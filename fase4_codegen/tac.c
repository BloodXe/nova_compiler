#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tac.h"
#include "ast.h"

static int temp_counter = 0;
static int label_counter = 0;

// Generador de variables temporales (t0, t1, t2...)
char* tac_new_temp(void) {
    char *buf = malloc(16);
    if (!buf) return NULL;
    snprintf(buf, 16, "t%d", temp_counter++);
    return buf;
}

// Generador de etiquetas de salto (L0, L1, L2...)
char* tac_new_label(void) {
    char *buf = malloc(16);
    if (!buf) return NULL;
    snprintf(buf, 16, "L%d", label_counter++);
    return buf;
}

// Crea una lista vacía de TAC
TACList* tac_create_list(void) {
    TACList *list = malloc(sizeof(TACList));
    if (!list) return NULL;
    list->head = NULL;
    list->tail = NULL;
    return list;
}

// Agrega la instrucción al final de la lista
void tac_append(TACList *list, TACOp op, const char *res, const char *a1, const char *a2) {
    if (!list) return;
    TACInst *inst = malloc(sizeof(TACInst));
    if (!inst) return;

    inst->op = op;
    inst->result = res ? strdup(res) : NULL;
    inst->arg1 = a1 ? strdup(a1) : NULL;
    inst->arg2 = a2 ? strdup(a2) : NULL;
    inst->next = NULL;

    if (!list->head) {
        list->head = inst;
        list->tail = inst;
    } else {
        list->tail->next = inst;
        list->tail = inst;
    }
}

// Concatena dos listas TAC
void tac_concat(TACList *dest, TACList *src) {
    if (!dest || !src || !src->head) return;
    if (!dest->head) {
        dest->head = src->head;
        dest->tail = src->tail;
    } else {
        dest->tail->next = src->head;
        dest->tail = src->tail;
    }
    free(src);
}

// Recorrido de expresiones en el AST
static char* generate_expr_tac(Nodo *node, TACList *list) {
    if (!node) return NULL;

    switch (node->tipo) {
        case NODO_ENTERO: {
            char *temp = tac_new_temp();
            char val_str[32];
            snprintf(val_str, sizeof(val_str), "%ld", node->valor);
            tac_append(list, TAC_ASSIGN, temp, val_str, NULL);
            return temp;
        }

        case NODO_BOOLEANO:
        case NODO_CADENA:
        case NODO_IDENT: {
            return node->texto ? strdup(node->texto) : NULL;
        }

        case NODO_BINARIO: {
            Nodo *left_node = node->hijo;
            Nodo *right_node = left_node ? left_node->sig : NULL;

            char *left = generate_expr_tac(left_node, list);
            char *right = generate_expr_tac(right_node, list);
            char *temp = tac_new_temp();

            TACOp op = TAC_ADD;
            const char *o = node->texto;
            if (o) {
                if (strcmp(o, "-") == 0) op = TAC_SUB;
                else if (strcmp(o, "*") == 0) op = TAC_MUL;
                else if (strcmp(o, "/") == 0) op = TAC_DIV;
                else if (strcmp(o, "%") == 0) op = TAC_MOD;
                else if (strcmp(o, "&") == 0) op = TAC_AND;
                else if (strcmp(o, "|") == 0) op = TAC_OR;
                else if (strcmp(o, "^") == 0) op = TAC_XOR;
                else if (strcmp(o, "<<") == 0) op = TAC_SHL;
                else if (strcmp(o, ">>") == 0) op = TAC_SHR;
            }

            tac_append(list, op, temp, left, right);

            free(left);
            free(right);
            return temp;
        }

        case NODO_UNARIO: {
            char *operand = generate_expr_tac(node->hijo, list);
            char *temp = tac_new_temp();

            TACOp op = TAC_NEG;
            if (node->texto && strcmp(node->texto, "non") == 0) {
                op = TAC_NOT;
            }

            tac_append(list, op, temp, operand, NULL);
            free(operand);
            return temp;
        }

        default:
            return NULL;
    }
}

// Recorrido de sentencias en el AST
static void generate_stmt_tac(Nodo *node, TACList *list) {
    if (!node) return;

    switch (node->tipo) {
        case NODO_VARIABLE: {
            // Inicialización si existe una expresión tras la declaración
            Nodo *init_expr = (node->hijo && node->hijo->sig) ? node->hijo->sig : NULL;
            if (init_expr && node->texto) {
                char *res = strdup(node->texto);
                char *val = generate_expr_tac(init_expr, list);
                tac_append(list, TAC_ASSIGN, res, val, NULL);
                free(res);
                free(val);
            }
            break;
        }

        case NODO_ASIGNACION: {
            Nodo *target = node->hijo;
            Nodo *val_expr = target ? target->sig : NULL;
            if (target && target->texto && val_expr) {
                char *res = strdup(target->texto);
                char *val = generate_expr_tac(val_expr, list);
                tac_append(list, TAC_ASSIGN, res, val, NULL);
                free(res);
                free(val);
            }
            break;
        }

        case NODO_SI: {
            Nodo *cond = node->hijo;
            Nodo *then_block = cond ? cond->sig : NULL;
            Nodo *else_block = then_block ? then_block->sig : NULL;

            char *cond_var = generate_expr_tac(cond, list);
            char *l_else = tac_new_label();
            char *l_end = tac_new_label();

            tac_append(list, TAC_IF_FALSE, l_else, cond_var, NULL);
            free(cond_var);

            // Bloque THEN
            generate_stmt_tac(then_block, list);
            tac_append(list, TAC_GOTO, l_end, NULL, NULL);

            // Bloque ELSE
            tac_append(list, TAC_LABEL, l_else, NULL, NULL);
            if (else_block) {
                generate_stmt_tac(else_block, list);
            }

            tac_append(list, TAC_LABEL, l_end, NULL, NULL);

            free(l_else);
            free(l_end);
            break;
        }

        case NODO_BLOQUE: {
            for (Nodo *curr = node->hijo; curr != NULL; curr = curr->sig) {
                generate_stmt_tac(curr, list);
            }
            break;
        }

        default:
            // Recorre los hijos directamente si es otro tipo de nodo
            for (Nodo *curr = node->hijo; curr != NULL; curr = curr->sig) {
                generate_stmt_tac(curr, list);
            }
            break;
    }
}

// Función principal de generación de TAC desde el AST
TACList* tac_generate_from_ast(Nodo *root, SymbolTable *st) {
    (void)st;
    TACList *list = tac_create_list();
    if (!root) return list;

    if (root->tipo == NODO_BLOQUE || root->tipo == NODO_PROGRAMA) {
        for (Nodo *curr = root->hijo; curr != NULL; curr = curr->sig) {
            generate_stmt_tac(curr, list);
        }
    } else {
        generate_stmt_tac(root, list);
    }

    return list;
}

// Imprime las instrucciones TAC
void tac_print(TACList *list) {
    if (!list) return;
    printf("\n=== CÓDIGO INTERMEDIO (TAC) ===\n");
    for (TACInst *i = list->head; i != NULL; i = i->next) {
        switch (i->op) {
            case TAC_ASSIGN:   printf("  %s = %s\n", i->result, i->arg1); break;
            case TAC_ADD:      printf("  %s = %s + %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_SUB:      printf("  %s = %s - %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_MUL:      printf("  %s = %s * %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_DIV:      printf("  %s = %s / %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_MOD:      printf("  %s = %s %% %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_AND:      printf("  %s = %s & %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_OR:       printf("  %s = %s | %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_XOR:      printf("  %s = %s ^ %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_LABEL:    printf("%s:\n", i->result); break;
            case TAC_GOTO:     printf("  goto %s\n", i->result); break;
            case TAC_IF_FALSE: printf("  ifFalse %s goto %s\n", i->arg1, i->result); break;
            default:           printf("  op_%d %s %s %s\n", i->op, i->result ? i->result : "", i->arg1 ? i->arg1 : "", i->arg2 ? i->arg2 : ""); break;
        }
    }
}

// Libera memoria de la lista TAC
void tac_free(TACList *list) {
    if (!list) return;
    TACInst *curr = list->head;
    while (curr) {
        TACInst *next = curr->next;
        free(curr->result);
        free(curr->arg1);
        free(curr->arg2);
        free(curr);
        curr = next;
    }
    free(list);
}