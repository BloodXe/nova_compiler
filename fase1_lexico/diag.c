#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "diag.h"

static const char *archivo_fuente = "";
static int total_errores = 0;

void diag_iniciar(const char *archivo) {
    archivo_fuente = archivo;
    total_errores = 0;
}

int diag_errores(void) {
    return total_errores;
}

static int digitos(int n) {
    int d = 1;
    while (n >= 10) { n /= 10; d++; }
    return d;
}

/* Carga una linea del archivo para mostrarla junto al error. */
static int leer_linea(int n, char *buf, size_t cap) {
    FILE *f = fopen(archivo_fuente, "r");
    if (f == NULL) return 0;
    int actual = 1, c, encontrada = 0;
    size_t len = 0;
    while ((c = fgetc(f)) != EOF) {
        if (c == '\n') {
            if (actual == n) { encontrada = 1; break; }
            actual++;
        } else if (actual == n && c != '\r' && len + 1 < cap) {
            buf[len++] = (char)c;
        }
    }
    if (c == EOF && actual == n && len > 0) encontrada = 1;  /* ultima linea sin salto de linea */
    buf[len] = '\0';
    fclose(f);
    return encontrada;
}

void diag_error(const char *codigo, int linea, int col, int largo,
                const char *fmt, ...) {
    va_list ap;
    total_errores++;

    if (linea > 0 && col > 0)
        fprintf(stderr, "%s:%d:%d: error[%s]: ", archivo_fuente, linea, col, codigo);
    else
        fprintf(stderr, "%s: error[%s]: ", archivo_fuente, codigo);
    va_start(ap, fmt);
    vfprintf(stderr, fmt, ap);
    va_end(ap);
    fputc('\n', stderr);

    char texto[1024];
    if (linea <= 0 || col <= 0 || !leer_linea(linea, texto, sizeof(texto))) return;

    int ancho = digitos(linea);
    fprintf(stderr, "%d | %s\n", linea, texto);
    fprintf(stderr, "%*s | ", ancho, "");

    /* Avanza hasta la columna correcta y deja la marca alineada al texto original. */
    int pendientes = col - 1;
    const unsigned char *p = (const unsigned char *)texto;
    for (; *p && pendientes > 0; p++) {
        if ((*p & 0xC0) == 0x80) continue;           /* byte de continuacion de UTF-8 */
        fputc(*p == '\t' ? '\t' : ' ', stderr);
        pendientes--;
    }
    while (pendientes-- > 0) fputc(' ', stderr);     /* si la columna cae fuera de la linea */

    if (largo < 1) largo = 1;
    while (largo-- > 0) fputc('^', stderr);
    fputc('\n', stderr);
}

void diag_resumen(void) {
    if (total_errores > 0)
        fprintf(stderr, "\ncompilacion abortada: %d error%s.\n",
                total_errores, total_errores == 1 ? "" : "es");
}
