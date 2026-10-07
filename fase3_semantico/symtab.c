#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symtab.h"

// Utilidad para duplicar cadenas
static char* strdup_safe(const char *s) {
    if (!s) return NULL;
    char *d = malloc(strlen(s) + 1);
    if (d) strcpy(d, s);
    return d;
}

const char* data_type_to_string(DataType type) {
    switch (type) {
        case TYPE_INTEGER: return "integer";
        case TYPE_VERITAS: return "veritas";
        case TYPE_TEXTUS:  return "textus";
        case TYPE_NIHIL:   return "nihil";
        case TYPE_ERROR:   return "error";
        default:           return "desconocido";
    }
}

// Inicialización de las funciones intrínsecas del sistema y de la bóveda
static void register_intrinsics(SymbolTable *st) {
    // 1. longitudo(a) -> integer
    Symbol *f_len = symtab_insert_func(st, "longitudo", TYPE_INTEGER, false, 0, 0);
    f_len->is_intrinsic = true;

    // 2. scribe(...) -> nihil (variádica especial)
    Symbol *f_scribe = symtab_insert_func(st, "scribe", TYPE_NIHIL, false, 0, 0);
    f_scribe->is_intrinsic = true;

    // 3. dic(...) -> nihil (variádica especial)
    Symbol *f_dic = symtab_insert_func(st, "dic", TYPE_NIHIL, false, 0, 0);
    f_dic->is_intrinsic = true;

    // Intrínsecas de Criptografía / Bóveda (CERBERO-1)
    // 4. ingredere(clave: integer) -> veritas
    Symbol *f_ing = symtab_insert_func(st, "ingredere", TYPE_VERITAS, false, 0, 0);
    f_ing->is_intrinsic = true;

    // 5. exi() -> nihil
    Symbol *f_exi = symtab_insert_func(st, "exi", TYPE_NIHIL, false, 0, 0);
    f_exi->is_intrinsic = true;

    // 6. custodi(ranura, k0, k1, k2, k3) -> nihil
    Symbol *f_cust = symtab_insert_func(st, "custodi", TYPE_NIHIL, false, 0, 0);
    f_cust->is_intrinsic = true;

    // 7. feistel(bloque, ranura, ronda) -> nihil
    Symbol *f_feis = symtab_insert_func(st, "feistel", TYPE_NIHIL, false, 0, 0);
    f_feis->is_intrinsic = true;
}

SymbolTable* symtab_create(void) {
    SymbolTable *st = (SymbolTable*)malloc(sizeof(SymbolTable));
    st->current_scope = NULL;
    st->global_memory_offset = 0x0000; // Inicia en dirección 0x0000 de DMEM
    st->local_memory_offset = 0;

    // Crear ámbito global (Nivel 0)
    symtab_push_scope(st);

    // Registrar intrínsecas
    register_intrinsics(st);

    return st;
}

void symtab_destroy(SymbolTable *st) {
    while (st->current_scope != NULL) {
        symtab_pop_scope(st);
    }
    free(st);
}

void symtab_push_scope(SymbolTable *st) {
    Scope *new_scope = (Scope*)malloc(sizeof(Scope));
    new_scope->level = st->current_scope ? st->current_scope->level + 1 : 0;
    new_scope->symbols = NULL;
    new_scope->parent = st->current_scope;
    st->current_scope = new_scope;
}

void symtab_pop_scope(SymbolTable *st) {
    if (!st->current_scope) return;

    Scope *old_scope = st->current_scope;
    st->current_scope = old_scope->parent;

    // Liberar símbolos del ámbito que cierra
    Symbol *sym = old_scope->symbols;
    while (sym) {
        Symbol *next = sym->next;
        free(sym->name);
        
        // Liberar parámetros si era función
        Parameter *p = sym->params;
        while (p) {
            Parameter *pn = p->next;
            free(p->name);
            free(p);
            p = pn;
        }
        
        free(sym);
        sym = next;
    }
    free(old_scope);
}

Symbol* symtab_lookup_current_scope(SymbolTable *st, const char *name) {
    if (!st->current_scope) return NULL;
    for (Symbol *s = st->current_scope->symbols; s != NULL; s = s->next) {
        if (strcmp(s->name, name) == 0) {
            return s;
        }
    }
    return NULL;
}

Symbol* symtab_lookup(SymbolTable *st, const char *name) {
    for (Scope *sc = st->current_scope; sc != NULL; sc = sc->parent) {
        for (Symbol *s = sc->symbols; s != NULL; s = s->next) {
            if (strcmp(s->name, name) == 0) {
                return s;
            }
        }
    }
    return NULL;
}

Symbol* symtab_insert_var(SymbolTable *st, const char *name, DataType type, int dims, int rows, int cols, int line, int col) {
    Symbol *s = (Symbol*)calloc(1, sizeof(Symbol));
    s->name = strdup_safe(name);
    s->kind = SYMBOL_VAR;
    s->type = type;
    s->dimensions = dims;
    s->rows = rows;
    s->cols = cols;
    s->line = line;
    s->col = col;

    // Asignar offset de memoria
    int elem_size = 4; // Cada palabra en CERBERO-1 mide 4 bytes (32 bits)
    int total_elements = (dims == 2) ? (rows * cols) : 1;
    int size_bytes = total_elements * elem_size;

    if (st->current_scope->level == 0) {
        s->is_global = true;
        s->offset = st->global_memory_offset;
        st->global_memory_offset += size_bytes;
    } else {
        s->is_global = false;
        st->local_memory_offset += size_bytes;
        s->offset = -st->local_memory_offset; // Crecimiento hacia direcciones menores en la Pila (R14)
    }

    s->next = st->current_scope->symbols;
    st->current_scope->symbols = s;
    return s;
}

Symbol* symtab_insert_const(SymbolTable *st, const char *name, DataType type, int32_t val, int line, int col) {
    Symbol *s = (Symbol*)calloc(1, sizeof(Symbol));
    s->name = strdup_safe(name);
    s->kind = SYMBOL_CONST;
    s->type = type;
    s->const_value = val;
    s->line = line;
    s->col = col;
    s->is_global = (st->current_scope->level == 0);

    s->next = st->current_scope->symbols;
    st->current_scope->symbols = s;
    return s;
}

Symbol* symtab_insert_func(SymbolTable *st, const char *name, DataType return_type, bool is_private, int line, int col) {
    Symbol *s = (Symbol*)calloc(1, sizeof(Symbol));
    s->name = strdup_safe(name);
    s->kind = SYMBOL_FUNC;
    s->type = return_type;
    s->return_type = return_type;
    s->is_private = is_private;
    s->line = line;
    s->col = col;
    s->is_global = true;

    s->next = st->current_scope->symbols;
    st->current_scope->symbols = s;
    return s;
}