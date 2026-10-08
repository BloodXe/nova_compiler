#ifndef AST_H
#define AST_H

#include <stdio.h>

/* Estructura basica del AST usado por la fase sintactica. */
typedef enum {
    NODO_PROGRAMA, NODO_IMPORTS, NODO_IMPORT, NODO_ALIAS, NODO_GLOBALES,
    NODO_FUNCION, NODO_PARAMETROS, NODO_PARAMETRO,
    NODO_ANOTACION, NODO_PRIVATUM,
    NODO_CONSTANTE, NODO_VARIABLE,
    NODO_TIPO, NODO_DIMENSION, NODO_DIM_ABIERTA,
    NODO_LISTA_VALORES, NODO_BLOQUE,
    NODO_ASIGNACION, NODO_SI, NODO_DUM, NODO_PER,
    NODO_REDDE, NODO_RUMPE, NODO_PERGE,
    NODO_LLAMADA, NODO_ARGUMENTOS,
    NODO_BINARIO, NODO_UNARIO, NODO_IDENT, NODO_INDICE,
    NODO_ENTERO, NODO_CADENA, NODO_BOOLEANO
} TipoNodo;

typedef struct Nodo {
    TipoNodo tipo;
    char *texto;
    long valor;
    int linea;
    int columna;

    char *modulo;
    char *tipo_resuelto;

    struct Nodo *hijo;
    struct Nodo *sig;
} Nodo;

extern Nodo *raiz_ast;

Nodo *nodo_nuevo(TipoNodo tipo, char *texto, long valor, int linea, int columna);
Nodo *fijar_modulo(Nodo *n, char *modulo);
Nodo *agregar_hijo(Nodo *padre, Nodo *hijo);
Nodo *anteponer_hijo(Nodo *padre, Nodo *hijo);
Nodo *cadena_agregar(Nodo *cadena, Nodo *nuevo);
Nodo *copiar_ast(const Nodo *n);
Nodo *nodo_asignacion(Nodo *destino, const char *op, Nodo *valor, int linea, int columna);
Nodo *binario(const char *op, Nodo *izq, Nodo *der, int linea, int columna);
Nodo *unario(const char *op, Nodo *operando, int linea, int columna);

void imprimir_ast(FILE *out, Nodo *raiz);
void liberar_ast(Nodo *raiz);

#endif