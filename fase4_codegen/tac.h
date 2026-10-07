#ifndef TAC_H
#define TAC_H

#include <stdbool.h>
#include <stdint.h>
#include "ast.h"
#include "symtab.h"

typedef enum {
    TAC_NOP,
    TAC_ADD, TAC_SUB, TAC_MUL, TAC_DIV, TAC_MOD,
    TAC_AND, TAC_OR, TAC_XOR, TAC_SHL, TAC_SHR,
    TAC_NEG, TAC_NOT,
    TAC_ASSIGN,
    TAC_LABEL,
    TAC_GOTO,
    TAC_IF_FALSE,
    TAC_CMP,
    TAC_PARAM,
    TAC_CALL,
    TAC_RETURN,
    TAC_LOAD,    // t1 = mem[base + offset]
    TAC_STORE,   // mem[base + offset] = t1
    
    // Intrínsecas criptográficas CERBERO-1
    TAC_VAULT_LOGIN,
    TAC_VAULT_LOGOUT,
    TAC_VAULT_KSETW,
    TAC_FEISTEL_ROUND
} TACOp;

typedef struct TACInst {
    TACOp op;
    char *result;
    char *arg1;
    char *arg2;
    struct TACInst *next;
} TACInst;

typedef struct TACList {
    TACInst *head;
    TACInst *tail;
} TACList;

// Funciones para crear y manipular la lista de TAC
TACList* tac_create_list(void);
void tac_append(TACList *list, TACOp op, const char *res, const char *a1, const char *a2);
void tac_concat(TACList *dest, TACList *src);

char* tac_new_temp(void);
char* tac_new_label(void);

TACList* tac_generate_from_ast(Nodo *root, SymbolTable *st);
void tac_print(TACList *list);
void tac_free(TACList *list);

#endif // TAC_H