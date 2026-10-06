#ifndef DIAG_H
#define DIAG_H

/* Helpers para reportar errores de manera uniforme en todas las fases. */
void diag_iniciar(const char *archivo);

/* Registra un error con linea, columna y una marca visual bajo el codigo. */
void diag_error(const char *codigo, int linea, int col, int largo,
                const char *fmt, ...);

/* Cuantos errores se reportaron hasta ahora. */
int diag_errores(void);

/* Muestra el resumen final si hubo fallos. */
void diag_resumen(void);

#endif
