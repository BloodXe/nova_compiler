#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tac.h"

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

// Crea una lista vacía de instrucciones TAC
TACList* tac_create_list(void) {
    TACList *list = malloc(sizeof(TACList));
    if (!list) return NULL;
    list->head = NULL;
    list->tail = NULL;
    return list;
}

// Agrega una instrucción al final de la lista TAC
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

// Concatena dos listas de TAC
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

// Imprime las instrucciones TAC acumuladas
void tac_print(TACList *list) {
    if (!list) return;
    printf("\n=== CÓDIGO INTERMEDIO (TAC) ===\n");
    for (TACInst *i = list->head; i != NULL; i = i->next) {
        switch (i->op) {
            case TAC_ASSIGN:    printf("  %s = %s\n", i->result, i->arg1); break;
            case TAC_ADD:       printf("  %s = %s + %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_SUB:       printf("  %s = %s - %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_MUL:       printf("  %s = %s * %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_DIV:       printf("  %s = %s / %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_MOD:       printf("  %s = %s %% %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_AND:       printf("  %s = %s & %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_OR:        printf("  %s = %s | %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_XOR:       printf("  %s = %s ^ %s\n", i->result, i->arg1, i->arg2); break;
            case TAC_LABEL:     printf("%s:\n", i->result); break;
            case TAC_GOTO:      printf("  goto %s\n", i->result); break;
            case TAC_IF_FALSE:  printf("  ifFalse %s goto %s\n", i->arg1, i->result); break;
            default:            printf("  op_%d %s %s %s\n", i->op, i->result ? i->result : "", i->arg1 ? i->arg1 : "", i->arg2 ? i->arg2 : ""); break;
        }
    }
}

// Libera la memoria de la lista y sus instrucciones
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

// Punto de entrada base para el recorrido del AST 
TACList* tac_generate_from_ast(Nodo *root, SymbolTable *st) {
    (void)root;
    (void)st;
    return tac_create_list();
}