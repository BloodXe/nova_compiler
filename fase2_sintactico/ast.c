#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ast.h"

/* Funciones auxiliares para crear y recorrer el AST. */
Nodo *nodo_nuevo(TipoNodo tipo, char *texto, long valor, int linea) {
    Nodo *n = malloc(sizeof(Nodo));
    if (n == NULL) {
        fprintf(stderr, "Sin memoria\n");
        exit(3);
    }
    n->tipo = tipo;
    n->texto = texto;
    n->valor = valor;
    n->linea = linea;
    n->modulo = NULL;
    n->tipo_resuelto = NULL;
    n->hijo = NULL;
    n->sig = NULL;
    return n;
}

Nodo *fijar_modulo(Nodo *n, char *modulo) {
    n->modulo = modulo;
    return n;
}

Nodo *agregar_hijo(Nodo *padre, Nodo *hijo) {
    if (hijo == NULL) return padre;
    padre->hijo = cadena_agregar(padre->hijo, hijo);
    return padre;
}

Nodo *anteponer_hijo(Nodo *padre, Nodo *hijo) {
    if (hijo == NULL) return padre;
    Nodo *ultimo = hijo;
    while (ultimo->sig != NULL) ultimo = ultimo->sig;
    ultimo->sig = padre->hijo;
    padre->hijo = hijo;
    return padre;
}

Nodo *cadena_agregar(Nodo *cadena, Nodo *nuevo) {
    if (cadena == NULL) return nuevo;
    Nodo *ultimo = cadena;
    while (ultimo->sig != NULL) ultimo = ultimo->sig;
    ultimo->sig = nuevo;
    return cadena;
}

Nodo *binario(const char *op, Nodo *izq, Nodo *der, int linea) {
    Nodo *n = nodo_nuevo(NODO_BINARIO, strdup(op), 0, linea);
    agregar_hijo(n, izq);
    agregar_hijo(n, der);
    return n;
}

Nodo *unario(const char *op, Nodo *operando, int linea) {
    Nodo *n = nodo_nuevo(NODO_UNARIO, strdup(op), 0, linea);
    agregar_hijo(n, operando);
    return n;
}

Nodo *copiar_ast(const Nodo *n) {
    if (n == NULL) return NULL;
    Nodo *c = nodo_nuevo(n->tipo, n->texto ? strdup(n->texto) : NULL, n->valor, n->linea);
    if (n->modulo != NULL) c->modulo = strdup(n->modulo);
    if (n->tipo_resuelto != NULL) c->tipo_resuelto = strdup(n->tipo_resuelto);
    Nodo *ultimo = NULL;
    for (const Nodo *h = n->hijo; h != NULL; h = h->sig) {
        Nodo *hc = copiar_ast(h);
        if (ultimo == NULL) c->hijo = hc; else ultimo->sig = hc;
        ultimo = hc;
    }
    return c;
}

Nodo *nodo_asignacion(Nodo *destino, const char *op, Nodo *valor, int linea) {
    if (op != NULL) valor = binario(op, copiar_ast(destino), valor, linea);
    Nodo *n = nodo_nuevo(NODO_ASIGNACION, strdup("="), 0, linea);
    agregar_hijo(n, destino);
    agregar_hijo(n, valor);
    return n;
}

static const char *nombre_nodo(TipoNodo t) {
    switch (t) {
        case NODO_PROGRAMA: return "Programa";
        case NODO_IMPORTS: return "Imports";
        case NODO_IMPORT: return "Import";
        case NODO_ALIAS: return "Alias";
        case NODO_GLOBALES: return "Globales";
        case NODO_FUNCION: return "Funcion";
        case NODO_PARAMETROS: return "Parametros";
        case NODO_PARAMETRO: return "Parametro";
        case NODO_ANOTACION: return "Anotacion";
        case NODO_PRIVATUM: return "Privatum";
        case NODO_CONSTANTE: return "Constante";
        case NODO_VARIABLE: return "Variable";
        case NODO_TIPO: return "Tipo";
        case NODO_DIMENSION: return "Dimension";
        case NODO_DIM_ABIERTA: return "DimensionAbierta";
        case NODO_LISTA_VALORES: return "ListaValores";
        case NODO_BLOQUE: return "Bloque";
        case NODO_ASIGNACION: return "Asignacion";
        case NODO_SI: return "Si";
        case NODO_DUM: return "Dum";
        case NODO_PER: return "Per";
        case NODO_REDDE: return "Redde";
        case NODO_RUMPE: return "Rumpe";
        case NODO_PERGE: return "Perge";
        case NODO_LLAMADA: return "Llamada";
        case NODO_ARGUMENTOS: return "Argumentos";
        case NODO_BINARIO: return "Binario";
        case NODO_UNARIO: return "Unario";
        case NODO_IDENT: return "Ident";
        case NODO_INDICE: return "Indice";
        case NODO_ENTERO: return "Entero";
        case NODO_CADENA: return "Cadena";
        case NODO_BOOLEANO: return "Booleano";
    }
    return "?";
}

static void imprimir_texto(FILE *out, const char *s) {
    fputc('"', out);
    for (; *s; s++) {
        if (*s == '\n') fprintf(out, "\\n");
        else if (*s == '\t') fprintf(out, "\\t");
        else if (*s == '"') fprintf(out, "\\\"");
        else if (*s == '\\') fprintf(out, "\\\\");
        else fputc(*s, out);
    }
    fputc('"', out);
}

static void imprimir_rec(FILE *out, Nodo *n, int nivel) {
    for (; n != NULL; n = n->sig) {
        int i;
        for (i = 0; i < nivel; i++) fprintf(out, "  ");
        fprintf(out, "%s", nombre_nodo(n->tipo));
        if (n->tipo == NODO_ENTERO) {
            fprintf(out, " %ld", n->valor);
        } else if (n->tipo == NODO_CADENA || n->tipo == NODO_IMPORT) {
            fputc(' ', out);
            imprimir_texto(out, n->texto);
        } else if (n->texto != NULL) {
            fprintf(out, " %s", n->texto);
        }
        if (n->modulo != NULL) {
            fprintf(out, "  [modulo: %s]", n->modulo);
        }
        if (n->tipo_resuelto != NULL) {
            fprintf(out, "  [tipo: %s]", n->tipo_resuelto);
        }
        fprintf(out, "  (linea %d)\n", n->linea);
        imprimir_rec(out, n->hijo, nivel + 1);
    }
}

void imprimir_ast(FILE *out, Nodo *raiz) {
    imprimir_rec(out, raiz, 0);
}

void liberar_ast(Nodo *n) {
    while (n != NULL) {
        Nodo *sig = n->sig;
        liberar_ast(n->hijo);
        free(n->texto);
        free(n->modulo);
        free(n->tipo_resuelto);
        free(n);
        n = sig;
    }
}