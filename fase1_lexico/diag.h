#ifndef DIAG_H
#define DIAG_H

/* Helpers para reportar errores de manera uniforme en todas las fases. */
void diag_iniciar(const char *archivo);

/* Maximo de errores antes de abortar (--max-errors). Por omision 25. */
void diag_max_errores(int n);

/* Registra un error con linea, columna y una marca visual bajo el codigo. */
void diag_error(const char *codigo, int linea, int col, int largo,
                const char *fmt, ...);

/* Registra una advertencia (no impide generar codigo). */
void diag_advertencia(const char *codigo, int linea, int col, int largo,
                      const char *fmt, ...);

/* Cuantos errores se reportaron hasta ahora. */
int diag_errores(void);

/* Cuantas advertencias se reportaron hasta ahora. */
int diag_advertencias(void);

/* Muestra el resumen final si hubo fallos. */
void diag_resumen(void);

#endif
