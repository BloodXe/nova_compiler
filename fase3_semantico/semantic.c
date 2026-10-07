#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "semantic.h"
#include "diag.h"

static SymbolTable *st = NULL;
static int loop_depth = 0;               // Control de anidamiento de ciclos (para rumpe/perge)
static DataType current_func_return = TYPE_NIHIL; // Tipo de retorno de la función actual
static bool func_has_return = false;    // Para verificar E309

// --- Declaraciones de prototipos ---
static void analyze_first_pass(Nodo *node);
static void analyze_second_pass(Nodo *node);
static DataType analyze_expression(Nodo *expr);
static void analyze_statement(Nodo *stmt);

// Conversion de tipo en texto a DataType
static DataType ast_type_to_datatype(const char *type_name) {
    if (!type_name) return TYPE_NIHIL;
    if (strcmp(type_name, "integer") == 0) return TYPE_INTEGER;
    if (strcmp(type_name, "veritas") == 0) return TYPE_VERITAS;
    if (strcmp(type_name, "textus") == 0)  return TYPE_TEXTUS;
    if (strcmp(type_name, "nihil") == 0)   return TYPE_NIHIL;
    return TYPE_ERROR;
}

// === PRIMERA PASADA: Recolecta firmas de funciones y constantes globales ===
static void analyze_first_pass(Nodo *node) {
    if (!node) return;

    if (node->tipo == NODO_FUNCION) {
        const char *name = node->texto;
        DataType ret_type = TYPE_NIHIL;
        bool is_priv = false;

        // Busca el nodo tipo/retorno entre sus hijos si aplica
        if (node->hijo && node->hijo->tipo == NODO_TIPO) {
            ret_type = ast_type_to_datatype(node->hijo->texto);
        }

        if (symtab_lookup_current_scope(st, name)) {
            diag_error("E302", node->linea, 1, 1, "Redeclaracion de la funcion '%s' en el mismo ambito", name);
        } else {
            symtab_insert_func(st, name, ret_type, is_priv, node->linea, 1);
        }
    } else if (node->tipo == NODO_CONSTANTE) {
        const char *name = node->texto;
        DataType type = TYPE_INTEGER;
        
        if (symtab_lookup_current_scope(st, name)) {
            diag_error("E302", node->linea, 1, 1, "Redeclaracion de la constante '%s' en el mismo ambito", name);
        } else {
            int val = 0;
            if (node->hijo && node->hijo->tipo == NODO_ENTERO) {
                val = (int)node->hijo->valor;
            }
            symtab_insert_const(st, name, type, val, node->linea, 1);
        }
    }

    // Recorre los nodos hermanos e hijos globales
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
                diag_error("E301", expr->linea, 1, 1, "Identificador '%s' no declarado", name);
                return TYPE_ERROR;
            }
            return s->type;
        }

        case NODO_BINARIO: {
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
                    diag_error("E303", expr->linea, 1, 1, "Operador '%s' requiere operandos de tipo 'integer'", op);
                    return TYPE_ERROR;
                }
                return TYPE_INTEGER;
            }

            // Operadores relacionales
            if (strcmp(op, "==") == 0 || strcmp(op, "!=") == 0) {
                if (left != right) {
                    diag_error("E303", expr->linea, 1, 1, "Los operandos de '%s' deben ser del mismo tipo", op);
                    return TYPE_ERROR;
                }
                return TYPE_VERITAS;
            }

            if (strcmp(op, "<") == 0 || strcmp(op, "<=") == 0 || strcmp(op, ">") == 0 || strcmp(op, ">=") == 0) {
                if (left != TYPE_INTEGER || right != TYPE_INTEGER) {
                    diag_error("E303", expr->linea, 1, 1, "Operador relacional '%s' requiere operandos 'integer'", op);
                    return TYPE_ERROR;
                }
                return TYPE_VERITAS;
            }

            // Operadores lógicos
            if (strcmp(op, "et") == 0 || strcmp(op, "aut") == 0) {
                if (left != TYPE_VERITAS || right != TYPE_VERITAS) {
                    diag_error("E303", expr->linea, 1, 1, "Operador logico '%s' requiere operandos 'veritas'", op);
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
                    diag_error("E303", expr->linea, 1, 1, "Operador '%s' requiere tipo 'veritas'", op);
                    return TYPE_ERROR;
                }
                return TYPE_VERITAS;
            } else if (strcmp(op, "-") == 0 || strcmp(op, "~") == 0) {
                if (operand != TYPE_INTEGER) {
                    diag_error("E303", expr->linea, 1, 1, "Operador '%s' requiere tipo 'integer'", op);
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
                diag_error("E301", expr->linea, 1, 1, "Funcion '%s' no declarada", name);
                return TYPE_ERROR;
            }
            if (s->kind != SYMBOL_FUNC) {
                diag_error("E313", expr->linea, 1, 1, "'%s' no es una funcion", name);
                return TYPE_ERROR;
            }
            return s->return_type;
        }

        default:
            return TYPE_ERROR;
    }
}

// === ANÁLISIS DE SENTENCIAS ===
static void analyze_statement(Nodo *stmt) {
    if (!stmt) return;

    switch (stmt->tipo) {
        case NODO_VARIABLE: {
            const char *name = stmt->texto;
            DataType type = TYPE_INTEGER;
            if (stmt->hijo && stmt->hijo->tipo == NODO_TIPO) {
                type = ast_type_to_datatype(stmt->hijo->texto);
            }

            if (symtab_lookup_current_scope(st, name)) {
                diag_error("E302", stmt->linea, 1, 1, "Redeclaracion de la variable '%s' en el mismo ambito", name);
            } else {
                symtab_insert_var(st, name, type, 0, 0, 0, stmt->linea, 1);
            }

            // Inicialización si existe valor asignado
            Nodo *init_expr = (stmt->hijo && stmt->hijo->sig) ? stmt->hijo->sig : NULL;
            if (init_expr) {
                DataType init_type = analyze_expression(init_expr);
                if (init_type != TYPE_ERROR && init_type != type) {
                    diag_error("E303", stmt->linea, 1, 1, "Tipo incompatible en inicializacion de '%s'", name);
                }
            }
            break;
        }

        case NODO_ASIGNACION: {
            Nodo *target = stmt->hijo;
            Nodo *val_expr = target ? target->sig : NULL;
            const char *name = target ? target->texto : NULL;

            if (name) {
                Symbol *s = symtab_lookup(st, name);
                if (!s) {
                    diag_error("E301", stmt->linea, 1, 1, "Variable '%s' no declarada", name);
                } else if (s->kind == SYMBOL_CONST) {
                    diag_error("E311", stmt->linea, 1, 1, "No se puede asignar a la constante '%s'", name);
                } else {
                    DataType expr_type = analyze_expression(val_expr);
                    if (expr_type != TYPE_ERROR && expr_type != s->type) {
                        diag_error("E303", stmt->linea, 1, 1, "No se puede asignar a variable de tipo incompatible");
                    }
                }
            }
            break;
        }

        case NODO_SI: {
            Nodo *cond = stmt->hijo;
            Nodo *then_block = cond ? cond->sig : NULL;
            Nodo *else_block = then_block ? then_block->sig : NULL;

            DataType cond_type = analyze_expression(cond);
            if (cond_type != TYPE_ERROR && cond_type != TYPE_VERITAS) {
                diag_error("E306", stmt->linea, 1, 1, "La condicion de 'si' debe ser de tipo 'veritas'");
            }
            
            symtab_push_scope(st);
            analyze_second_pass(then_block);
            symtab_pop_scope(st);

            if (else_block) {
                symtab_push_scope(st);
                analyze_second_pass(else_block);
                symtab_pop_scope(st);
            }
            break;
        }

        case NODO_DUM: {
            Nodo *cond = stmt->hijo;
            Nodo *body = cond ? cond->sig : NULL;

            DataType cond_type = analyze_expression(cond);
            if (cond_type != TYPE_ERROR && cond_type != TYPE_VERITAS) {
                diag_error("E306", stmt->linea, 1, 1, "La condicion de 'dum' debe ser de tipo 'veritas'");
            }

            loop_depth++;
            symtab_push_scope(st);
            analyze_second_pass(body);
            symtab_pop_scope(st);
            loop_depth--;
            break;
        }

        case NODO_PER: {
            Nodo *init = stmt->hijo;
            Nodo *cond = init ? init->sig : NULL;
            Nodo *body = cond ? cond->sig : NULL;

            symtab_push_scope(st);
            if (init) {
                analyze_statement(init);
            }
            
            DataType cond_type = analyze_expression(cond);
            if (cond_type != TYPE_ERROR && cond_type != TYPE_VERITAS) {
                diag_error("E306", stmt->linea, 1, 1, "La condicion de 'per' debe ser de tipo 'veritas'");
            }

            loop_depth++;
            analyze_second_pass(body);
            loop_depth--;

            symtab_pop_scope(st);
            break;
        }

        case NODO_REDDE: {
            func_has_return = true;
            Nodo *ret_expr = stmt->hijo;
            if (ret_expr) {
                DataType expr_type = analyze_expression(ret_expr);
                if (current_func_return == TYPE_NIHIL) {
                    diag_error("E312", stmt->linea, 1, 1, "Funcion 'nihil' no debe retornar valor");
                } else if (expr_type != TYPE_ERROR && expr_type != current_func_return) {
                    diag_error("E312", stmt->linea, 1, 1, "Tipo de retorno incorrecto en 'redde'");
                }
            } else if (current_func_return != TYPE_NIHIL) {
                diag_error("E312", stmt->linea, 1, 1, "Se esperaba un valor de retorno en 'redde'");
            }
            break;
        }

        case NODO_RUMPE:
        case NODO_PERGE: {
            if (loop_depth <= 0) {
                diag_error("E310", stmt->linea, 1, 1, "'rumpe' o 'perge' debe estar dentro de un ciclo");
            }
            break;
        }

        default:
            break;
    }
}

// === SEGUNDA PASADA: Analiza cuerpos de funciones y bloques ===
static void analyze_second_pass(Nodo *node) {
    if (!node) return;

    if (node->tipo == NODO_FUNCION) {
        current_func_return = TYPE_NIHIL;
        if (node->hijo && node->hijo->tipo == NODO_TIPO) {
            current_func_return = ast_type_to_datatype(node->hijo->texto);
        }

        func_has_return = false;
        st->local_memory_offset = 0; // Reinicia el offset del marco local

        symtab_push_scope(st);

        // Analiza el cuerpo de la función (siguiente hijo tras el tipo/parámetros)
        Nodo *body = node->hijo;
        while (body && body->tipo != NODO_BLOQUE) {
            body = body->sig;
        }

        if (body) {
            analyze_second_pass(body);
        }

        // Verificar E309: Rutas de retorno en funciones no-nihil
        if (current_func_return != TYPE_NIHIL && !func_has_return) {
            diag_error("E309", node->linea, 1, 1, "Toda ruta de funcion no 'nihil' debe terminar en 'redde'");
        }

        // Guarda el tamaño del marco local en el símbolo de la función
        Symbol *f_sym = symtab_lookup(st, node->texto);
        if (f_sym) {
            f_sym->local_frame_size = st->local_memory_offset;
        }

        symtab_pop_scope(st);
    } else if (node->tipo == NODO_BLOQUE) {
        for (Nodo *curr = node->hijo; curr != NULL; curr = curr->sig) {
            analyze_statement(curr);
        }
    } else {
        analyze_statement(node);
    }
}

// === ENTRADA PRINCIPAL ===
bool semantic_analyze(Nodo *root, SymbolTable **out_symtab) {
    st = symtab_create();

    // 1. Pasada 1: Recolectar firmas globales
    analyze_first_pass(root);

    // 2. Pasada 2: Verifica cuerpos, ámbitos y control de flujo
    analyze_second_pass(root);

    if (out_symtab) {
        *out_symtab = st;
    }

    return (diag_errores() == 0);
}