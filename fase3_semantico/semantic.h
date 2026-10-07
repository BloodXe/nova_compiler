#ifndef SEMANTIC_H
#define SEMANTIC_H

#include <stdbool.h>
#include "ast.h"
#include "symtab.h"

// Función principal que ejecuta el análisis semántico sobre el AST del programa
bool semantic_analyze(Nodo *root, SymbolTable **out_symtab);

#endif // SEMANTIC_H