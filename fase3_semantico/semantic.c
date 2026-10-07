#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "semantic.h"
#include "diag.h"

static SymbolTable *st = NULL;

// --- Declaraciones de prototipos ---
static void analyze_first_pass(Nodo *node);
static void analyze_second_pass(Nodo *node);
static DataType analyze_expression(Nodo *expr);

// Conversion de tipo en texto a DataType
static DataType ast_type_to_datatype(const char *type_name) {
    if (!type_name) return TYPE_NIHIL;
    if (strcmp(type_name, "integer") == 0) return TYPE_INTEGER;
    if (strcmp(type_name, "veritas") == 0) return TYPE_VERITAS;
    if (strcmp(type_name, "textus") == 0)  return TYPE_TEXTUS;
    if (strcmp(type_name, "nihil") == 0)   return TYPE_NIHIL;
    return TYPE_ERROR;
}

// === PRIMERA PASADA: Recolectar firmas de funciones y constantes globales ===
static void analyze_first_pass(Nodo *node) {
    if (!node) return;

    if (node->tipo == NODO_FUNCION) {
        // En NODO_FUNCION, node->texto contiene el nombre de la función
        const char *name = node->texto;
        DataType ret_type = TYPE_NIHIL; 
        bool is_priv = false;

        if (symtab_lookup_current_scope(st, name)) {
            diag_error(node->linea, 1, "E302", "Redeclaracion de la funcion '%s' en el mismo ambito", name);
        } else {
            symtab_insert_func(st, name, ret_type, is_priv, node->linea, 1);
        }
    } else if (node->tipo == NODO_CONSTANTE) {
        const char *name = node->texto;
        DataType type = TYPE_INTEGER;
        
        if (symtab_lookup_current_scope(st, name)) {
            diag_error(node->linea, 1, "E302", "Redeclaracion de la constante '%s' en el mismo ambito", name);
        } else {
            int val = 0;
            if (node->hijo && node->hijo->tipo == NODO_ENTERO) {
                val = (int)node->hijo->valor;
            }
            symtab_insert_const(st, name, type, val, node->linea, 1);
        }
    }

    // Recorre los hijos en la lista enlazada (hijo -> sig -> sig ...)
    for (Nodo *curr = node->hijo; curr != NULL; curr = curr->sig) {
        analyze_first_pass(curr);
    }
}

// === ANÁLISIS DE EXPRESIONES ===
static DataType analyze_expression(Nodo *expr) {
    if (!expr) return TYPE_ERROR;

    switch (expr->tipo) {
        case NODO_ENTERO:
            return TYPE_INTEGER;

        case NODO_BOOLEANO:
            return TYPE_VERITAS;

        case NODO_CADENA:
            return TYPE_TEXTUS;

        case NODO_IDENT: {
            const char *name = expr->texto;
            Symbol *s = symtab_lookup(st, name);
            if (!s) {
                diag_error(expr->linea, 1, "E301", "Identificador '%s' no declarado", name);
                return TYPE_ERROR;
            }
            return s->type;
        }

        case NODO_BINARIO: {
            // Se asume que expr->hijo es el operando izquierdo y expr->hijo->sig es el derecho
            Nodo *left_node = expr->hijo;
            Nodo *right_node = left_node ? left_node->sig : NULL;

            DataType left = analyze_expression(left_node);
            DataType right = analyze_expression(right_node);

            if (left == TYPE_ERROR || right == TYPE_ERROR) return TYPE_ERROR;

            const char *op = expr->texto;

            // Operadores aritméticos y de bits
            if (strcmp(op, "+") == 0 || strcmp(op, "-") == 0 || strcmp(op, "*") == 0 || 
                strcmp(op, "/") == 0 || strcmp(op, "%") == 0 || strcmp(op, "&") == 0 ||
                strcmp(op, "|") == 0 || strcmp(op, "^") == 0 || strcmp(op, "<<") == 0 ||
                strcmp(op, ">>") == 0 || strcmp(op, ">>>") == 0) {
                
                if (left != TYPE_INTEGER || right != TYPE_INTEGER) {
                    diag_error(expr->linea, 1, "E303", "Operador '%s' requiere operandos de tipo 'integer'", op);
                    return TYPE_ERROR;
                }
                return TYPE_INTEGER;
            }

            // Operadores relacionales de igualdad
            if (strcmp(op, "==") == 0 || strcmp(op, "!=") == 0) {
                if (left != right) {
                    diag_error(expr->linea, 1, "E303", "Los operandos de '%s' deben ser del mismo tipo", op);
                    return TYPE_ERROR;
                }
                return TYPE_VERITAS;
            }

            // Operadores relacionales de orden
            if (strcmp(op, "<") == 0 || strcmp(op, "<=") == 0 || strcmp(op, ">") == 0 || strcmp(op, ">=") == 0) {
                if (left != TYPE_INTEGER || right != TYPE_INTEGER) {
                    diag_error(expr->linea, 1, "E303", "Operador relacional '%s' requiere operandos 'integer'", op);
                    return TYPE_ERROR;
                }
                return TYPE_VERITAS;
            }

            // Operadores lógicos
            if (strcmp(op, "et") == 0 || strcmp(op, "aut") == 0) {
                if (left != TYPE_VERITAS || right != TYPE_VERITAS) {
                    diag_error(expr->linea, 1, "E303", "Operador logico '%s' requiere operandos 'veritas'", op);
                    return TYPE_ERROR;
                }
                return TYPE_VERITAS;
            }

            return TYPE_ERROR;
        }

        case NODO_UNARIO: {
            Nodo *operand_node = expr->hijo;
            DataType operand = analyze_expression(operand_node);
            const char *op = expr->texto;

            if (strcmp(op, "non") == 0) {
                if (operand != TYPE_VERITAS) {
                    diag_error(expr->linea, 1, "E303", "Operador '%s' requiere tipo 'veritas'", op);
                    return TYPE_ERROR;
                }
                return TYPE_VERITAS;
            } else if (strcmp(op, "-") == 0 || strcmp(op, "~") == 0) {
                if (operand != TYPE_INTEGER) {
                    diag_error(expr->linea, 1, "E303", "Operador '%s' requiere tipo 'integer'", op);
                    return TYPE_ERROR;
                }
                return TYPE_INTEGER;
            }
            return TYPE_ERROR;
        }

        case NODO_LLAMADA: {
            const char *name = expr->texto;
            Symbol *s = symtab_lookup(st, name);
            if (!s) {
                diag_error(expr->linea, 1, "E301", "Funcion '%s' no declarada", name);
                return TYPE_ERROR;
            }
            if (s->kind != SYMBOL_FUNC) {
                diag_error(expr->linea, 1, "E313", "'%s' no es una funcion", name);
                return TYPE_ERROR;
            }
            return s->return_type;
        }

        default:
            return TYPE_ERROR;
    }
}

// === SEGUNDA PASADA: Recorrido del AST para evaluación de expresiones ===
static void analyze_second_pass(Nodo *node) {
    if (!node) return;

    analyze_expression(node);

    for (Nodo *curr = node->hijo; curr != NULL; curr = curr->sig) {
        analyze_second_pass(curr);
    }
}

// === ENTRADA PRINCIPAL ===
bool semantic_analyze(Nodo *root, SymbolTable **out_symtab) {
    st = symtab_create();

    // 1. Pasada 1: Recolecta firmas globales y constantes
    analyze_first_pass(root);

    // 2. Pasada 2: Recorrido del AST y comprobación de tipos de expresiones
    analyze_second_pass(root);

    if (out_symtab) {
        *out_symtab = st;
    }

    return (diag_get_error_count() == 0);
}