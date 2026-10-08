#ifndef CODEGEN_H
#define CODEGEN_H

#include <stdio.h>
#include "tac.h"
#include "symtab.h"

// Genera el código ensamblador VLIW CERBERO-1 en formato posicional
void codegen_generate_vliw(TACList *tac, SymbolTable *st, FILE *output_file);

#endif // CODEGEN_H