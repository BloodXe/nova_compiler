#ifndef SYMTAB_H
#define SYMTAB_H

#include <stdbool.h>
#include <stdint.h>

// Tipos de datos en Nova
typedef enum {
    TYPE_INTEGER,
    TYPE_VERITAS,
    TYPE_TEXTUS,
    TYPE_NIHIL,
    TYPE_ERROR      // Tipo para propagación y recuperación de errores
} DataType;

// Categoría del símbolo
typedef enum {
    SYMBOL_VAR,
    SYMBOL_CONST,
    SYMBOL_FUNC
} SymbolKind;

// Estructura para parámetros de funciones
typedef struct Parameter {
    char *name;
    DataType type;
    int dimensions;             // 0: escalar, 1: arreglo 1D, 2: arreglo 2D
    struct Parameter *next;
} Parameter;

// Estructura de un símbolo
typedef struct Symbol {
    char *name;
    SymbolKind kind;
    DataType type;
    
    // Arreglos 2D
    int dimensions;             // 0: escalar, 1: arreglo 1D (parámetro), 2: arreglo 2D
    int rows;                   // Cantidad de filas (si es constante en compilación)
    int cols;                   // Cantidad de columnas
    
    // Asignación de memoria
    bool is_global;
    int32_t offset;             // Dirección DMEM si es global, u offset R14 si es local
    
    // Atributos de constante
    int32_t const_value;
    
    // Atributos de función
    bool is_private;
    bool is_intrinsic;          // Para feistel, custodi, etc.
    DataType return_type;
    Parameter *params;
    int param_count;
    int local_frame_size;       // Tamaño en bytes requerido en el stack
    
    // Ubicación en código para reportes de error
    int line;
    int col;

    struct Symbol *next;        // Siguiente símbolo en el mismo nivel/bucket
} Symbol;

// Estructura de ámbito (Scope)
typedef struct Scope {
    int level;                  // 0: Global, 1+: Ámbitos anidados
    Symbol *symbols;            // Lista enlazada de símbolos en este ámbito
    struct Scope *parent;       // Ámbito padre
} Scope;

// Pila de Tabla de Símbolos
typedef struct SymbolTable {
    Scope *current_scope;
    int global_memory_offset;   // Offset global en DMEM (inicia en 0x0000)
    int local_memory_offset;    // Offset acumulado de variables locales en la función actual
} SymbolTable;

// --- Funciones de la API de la Tabla de Símbolos ---
SymbolTable* symtab_create(void);
void symtab_destroy(SymbolTable *st);

void symtab_push_scope(SymbolTable *st);
void symtab_pop_scope(SymbolTable *st);

// Búsquedas
Symbol* symtab_lookup(SymbolTable *st, const char *name);
Symbol* symtab_lookup_current_scope(SymbolTable *st, const char *name);

// Inserciones
Symbol* symtab_insert_var(SymbolTable *st, const char *name, DataType type, int dims, int rows, int cols, int line, int col);
Symbol* symtab_insert_const(SymbolTable *st, const char *name, DataType type, int32_t val, int line, int col);
Symbol* symtab_insert_func(SymbolTable *st, const char *name, DataType return_type, bool is_private, int line, int col);

// Funciones auxiliares
const char* data_type_to_string(DataType type);

#endif // SYMTAB_H