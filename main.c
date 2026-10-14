/*
 * Punto de entrada del compilador.
 * Lee las opciones de la linea de comandos y coordina las fases 1, 2 y 3.
 */
#include <errno.h>
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ast.h"
#include "diag.h"
#include "nova.tab.h"
#include "semantic.h"
#include "symtab.h"
#include "tac.h"
#include "codegen.h"

extern FILE *yyin;
extern char *yytext;
int yyparse(void);
int yylex(void);

/* Estado global de la ejecucion actual. */
static int modo_verbose = 0;
static int modo_arbol = 0;
static int modo_lexer = 0;
static int modo_symtab = 0;
static int modo_ir = 0;
static int modo_asm = 0;
static int modo_objeto = 0;        /* -c: solo compilar, generar .nvo */
static const char *archivo_salida = NULL;

/* -I: directorios donde buscar modulos importados. Los usa el enlazador. */
#define MAX_RUTAS 16
static const char *rutas_modulos[MAX_RUTAS];
static int n_rutas = 0;

/* Mapea cada token a su nombre para la salida del modo de inspeccion. */
static const char *nombre_token(int tipo) {
    switch (tipo) {
        case TK_FUNCTIO: return "TK_FUNCTIO";
        case TK_VARIA: return "TK_VARIA";
        case TK_CONSTANS: return "TK_CONSTANS";
        case TK_PRIVATUM: return "TK_PRIVATUM";
        case TK_IMPORTA: return "TK_IMPORTA";
        case TK_UT: return "TK_UT";
        case TK_REDDE: return "TK_REDDE";
        case TK_SI: return "TK_SI";
        case TK_SIN: return "TK_SIN";
        case TK_ALITER: return "TK_ALITER";
        case TK_DUM: return "TK_DUM";
        case TK_PER: return "TK_PER";
        case TK_RUMPE: return "TK_RUMPE";
        case TK_PERGE: return "TK_PERGE";
        case TK_TIPO_INTEGER: return "TK_TIPO_INTEGER";
        case TK_TIPO_VERITAS: return "TK_TIPO_VERITAS";
        case TK_TIPO_TEXTUS: return "TK_TIPO_TEXTUS";
        case TK_TIPO_NIHIL: return "TK_TIPO_NIHIL";
        case TK_ET: return "TK_ET";
        case TK_AUT: return "TK_AUT";
        case TK_NON: return "TK_NON";
        case TK_VERUM: return "TK_VERUM";
        case TK_FALSUM: return "TK_FALSUM";
        case TK_MAS: return "TK_MAS";
        case TK_MENOS: return "TK_MENOS";
        case TK_POR: return "TK_POR";
        case TK_ENTRE: return "TK_ENTRE";
        case TK_MODULO: return "TK_MODULO";
        case TK_IGUAL: return "TK_IGUAL";
        case TK_DIFERENTE: return "TK_DIFERENTE";
        case TK_MENOR: return "TK_MENOR";
        case TK_MENOR_IGUAL: return "TK_MENOR_IGUAL";
        case TK_MAYOR: return "TK_MAYOR";
        case TK_MAYOR_IGUAL: return "TK_MAYOR_IGUAL";
        case TK_ASIGNA: return "TK_ASIGNA";
        case TK_ASIGNA_MAS: return "TK_ASIGNA_MAS";
        case TK_ASIGNA_MENOS: return "TK_ASIGNA_MENOS";
        case TK_ASIGNA_POR: return "TK_ASIGNA_POR";
        case TK_ASIGNA_ENTRE: return "TK_ASIGNA_ENTRE";
        case TK_ASIGNA_MODULO: return "TK_ASIGNA_MODULO";
        case TK_PAR_IZQ: return "TK_PAR_IZQ";
        case TK_PAR_DER: return "TK_PAR_DER";
        case TK_LLAVE_IZQ: return "TK_LLAVE_IZQ";
        case TK_LLAVE_DER: return "TK_LLAVE_DER";
        case TK_COR_IZQ: return "TK_COR_IZQ";
        case TK_COR_DER: return "TK_COR_DER";
        case TK_PUNTO_COMA: return "TK_PUNTO_COMA";
        case TK_COMA: return "TK_COMA";
        case TK_DOS_PUNTOS: return "TK_DOS_PUNTOS";
        case TK_PUNTO: return "TK_PUNTO";
        case TK_FLECHA: return "TK_FLECHA";
        case TK_ARROBA: return "TK_ARROBA";
        case TK_AMPERSAND: return "TK_AMPERSAND";
        case TK_BARRA: return "TK_BARRA";
        case TK_XOR: return "TK_XOR";
        case TK_NOT: return "TK_NOT";
        case TK_DESP_IZQ: return "TK_DESP_IZQ";
        case TK_DESP_DER: return "TK_DESP_DER";
        case TK_DESP_LOG: return "TK_DESP_LOG";
        case TK_IDENT: return "TK_IDENT";
        case TK_ENTERO: return "TK_ENTERO";
        case TK_CADENA: return "TK_CADENA";
        default: return "?";
    }
}

/*
 * Fase 1: analisis lexico.
 * Recorre el archivo fuente token por token y muestra la tabla de tokens.
 */
static int correr_lexer(void) {
    printf("%-22s %-20s %6s %5s\n", "LEXEMA", "TOKEN", "LINEA", "COL");
    printf("-------------------------------------------------------------\n");
    int tok, total = 0;
    while ((tok = yylex()) != 0) {
        char lexema[64];
        if (tok == TK_CADENA) snprintf(lexema, sizeof(lexema), "\"%.50s\"", yylval.texto);
        else snprintf(lexema, sizeof(lexema), "%.60s", yytext);
        printf("%-22s %-20s %6d %5d\n", lexema, nombre_token(tok),
               yylloc.first_line, yylloc.first_column);
        total++;
        /* En este modo se llama a yylex() directo, asi que hay que liberar
         * los textos que se asignaron con strdup() en el lexer. */
        if (tok == TK_IDENT || tok == TK_CADENA) {
            free(yylval.texto);
        }
    }
    printf("%-22s %-20s %6d %5d\n", "<EOF>", "TK_EOF", yylloc.first_line, yylloc.first_column);
    printf("-- %d tokens --\n", total + 1);
    if (diag_errores() > 0) {
        diag_resumen();
        return 1;
    }
    printf("\nAnalisis lexico completado sin errores.\n");
    return 0;
}

/*
 * Nombre de salida por omision: el del fuente sin su extension, sin el
 * directorio, y con .nvo si se pidio -c. 'programa.nv' -> 'programa'.
 */
static void nombre_por_omision(const char *fuente, int objeto, char *dest, size_t cap) {
    const char *base = fuente;
    const char *p;
    size_t largo;

    for (p = fuente; *p; p++)
        if (*p == '/' || *p == '\\') base = p + 1;

    largo = strlen(base);
    if (largo > 3 && strcmp(base + largo - 3, ".nv") == 0) largo -= 3;
    if (largo >= cap - 5) largo = cap - 5;

    memcpy(dest, base, largo);
    dest[largo] = '\0';
    if (objeto) strncat(dest, ".nvo", cap - strlen(dest) - 1);
    /* Un fuente llamado solo ".nv" dejaria el nombre vacio. */
    if (dest[0] == '\0') snprintf(dest, cap, "%s", objeto ? "salida.nvo" : "salida");
}

/*
 * Ayuda del programa. Explica las banderas disponibles y que parte del
 * compilador se ejecuta en cada caso.
 */
static void print_usage(const char *prog) {
    fprintf(stderr,
        "Uso: %s [opciones] <archivo_fuente> [-o <salida>]\n"
        "\n"
        "Sin banderas de volcado produce el ejecutable binario de CERBERO. Si no\n"
        "se da -o, el nombre es el del fuente sin extension (con .nvo si hay -c).\n"
        "\n"
        "  -o <archivo>      Nombre de salida\n"
        "  -c                Solo compila, no enlaza: objeto .nvo (del enlazador)\n"
        "  -I <directorio>   Directorio de busqueda de modulos (del enlazador)\n"
        "  -v                Modo detallado: imprime cada fase\n"
        "  -Wall             Activa todas las advertencias (lo estan por omision)\n"
        "  -Werror           Trata las advertencias como errores\n"
        "  -w                Silencia todas las advertencias\n"
        "  -Wno-W00n         Silencia una advertencia concreta\n"
        "  --max-errors <n>  Maximo de errores antes de abortar (por omision: 25)\n"
        "  --tokens          Solo Fase 1: tabla de tokens\n"
        "  -t                Imprime el arbol sintactico (AST)\n"
        "  --sym, -m         Imprime la tabla de simbolos (Fase 3)\n"
        "  --ir              Codigo de tres direcciones (Fase 4)\n"
        "  -s                Ensamblador VLIW de CERBERO en texto (Fase 4)\n"
        "  --version         Version\n"
        "  -h, --help        Esta ayuda\n"
        "\n"
        "Codigos de salida: 0 exito, 1 errores de compilacion, 2 error de uso,\n"
        "3 error de entrada o salida.\n",
        prog);
}

/*
 * Las opciones largas se registran aqui para poder interpretar banderas como
 * --tokens, --help o --version sin tener que hacer parsing manual extra.
 */
static const struct option opciones_largas[] = {
    {"tokens",  no_argument, NULL, 'l'},
    {"sym",     no_argument, NULL, 'm'},
    {"ir",      no_argument, NULL, 1001},
    {"version", no_argument, NULL, 1002},
    {"max-errors", required_argument, NULL, 1003},
    {"help",    no_argument, NULL, 'h'},
    {NULL, 0, NULL, 0}
};

int main(int argc, char **argv) {
    int opt;
    /*
     * Se leen todas las banderas antes de abrir la fase real de compilacion.
     * Esto permite decidir si se ejecuta solo la fase 1, la fase 2 o un
     * modo de diagnostico simple.
     */
    while ((opt = getopt_long(argc, argv, "o:I:W:vtsmclhw", opciones_largas, NULL)) != -1) {
        switch (opt) {
            case 'h': print_usage(argv[0]); return 0;
            case 1003: {
                char *fin = NULL;
                long n;
                errno = 0;
                n = strtol(optarg, &fin, 10);
                if (errno != 0 || fin == optarg || *fin != '\0' || n < 1 || n > 1000000) {
                    fprintf(stderr, "novac: valor invalido para --max-errors: '%s' (se espera un entero positivo)\n", optarg);
                    return 2;
                }
                diag_max_errores((int)n);
                break;
            }
            case 1002: printf("novac (Nova) 0.4 - fases 1-4: lexico, sintactico, semantico y generacion de codigo\n"); return 0;
            case 1001: modo_ir = 1; break;
            case 'o': archivo_salida = optarg; break;
            case 'v': modo_verbose = 1; break;
            case 't': modo_arbol = 1; break;
            case 'l': modo_lexer = 1; break;
            case 'm': modo_symtab = 1; break;
            case 's': modo_asm = 1; break;
            case 'c': modo_objeto = 1; break;
            case 'w': diag_warn_ninguna(); break;
            case 'I':
                if (n_rutas >= MAX_RUTAS) {
                    fprintf(stderr, "novac: demasiados directorios -I (maximo %d)\n", MAX_RUTAS);
                    return 2;
                }
                rutas_modulos[n_rutas++] = optarg;
                break;
            case 'W':
                /* -Wall, -Werror, -Wno-W00n. getopt entrega lo que sigue a -W. */
                if (strcmp(optarg, "all") == 0) diag_warn_todas();
                else if (strcmp(optarg, "error") == 0) diag_warn_como_error();
                else if (strncmp(optarg, "no-", 3) == 0) {
                    if (!diag_warn_desactivar(optarg + 3)) {
                        fprintf(stderr, "novac: '-W%s' no nombra una advertencia conocida (se esperaba W001..W032)\n", optarg);
                        return 2;
                    }
                } else {
                    fprintf(stderr, "novac: opcion de advertencias desconocida: '-W%s'\n", optarg);
                    return 2;
                }
                break;
            default: print_usage(argv[0]); return 2;
        }
    }

    if (optind >= argc) {
        print_usage(argv[0]);
        return 2;
    }
    const char *archivo_fuente = argv[optind];

    /*
     * El objeto .nvo y el enlazado de varios archivos son la fase 6 del
     * documento, que es la parte que falta. Se dice sin rodeos en lugar de
     * dejar un archivo que parezca un objeto y no lo sea.
     */
    if (modo_objeto) {
        fprintf(stderr, "novac: -c (objeto .nvo) todavia no esta implementado: "
                        "el formato del objeto y el enlazado son la fase de enlace\n");
        return 2;
    }
    if (optind + 1 < argc) {
        fprintf(stderr, "novac: solo se acepta un archivo fuente por ahora; "
                        "enlazar varios es la fase de enlace\n");
        return 2;
    }
    if (n_rutas > 0 && modo_verbose)
        fprintf(stderr, "aviso: los %d directorio(s) -I se registran pero los usa el enlazador\n", n_rutas);

    yyin = fopen(archivo_fuente, "r");
    if (yyin == NULL) {
        fprintf(stderr, "novac: no se pudo abrir '%s'\n", archivo_fuente);
        return 3;
    }
    diag_iniciar(archivo_fuente);

    /*
     * Si la bandera --tokens/-l esta activa, se ejecuta solo la Fase 1.
     * En cualquier otro caso, el programa entra a la Fase 2 y construye el AST.
     */
    // Modo Léxico
    if (modo_lexer) {
        if (modo_verbose) fprintf(stderr, "== Fase 1: Analisis Lexico -- %s ==\n", archivo_fuente);
        int rc = correr_lexer();
        fclose(yyin);
        return rc;
    }

    /*
     * Fases 1 y 2. El lexer no se corre por separado: bison lo llama con
     * yylex() a medida que necesita el siguiente token, asi que las dos fases
     * van entrelazadas. Para ver solo la fase 1 esta --tokens.
     */
    if (modo_verbose) {
        fprintf(stderr, "== Fase 1: Analisis Lexico -- %s ==\n", archivo_fuente);
        fprintf(stderr, "   (a demanda del parser; --tokens la corre sola)\n");
        fprintf(stderr, "== Fase 2: Analisis Sintactico -- %s ==\n", archivo_fuente);
    }
    int rc = yyparse();
    fclose(yyin);

    if (rc != 0 || diag_errores() > 0) {
        /* Con recuperacion de errores yyparse puede devolver 0 aunque haya
         * errores: el arbol parcial no sirve, se libera. */
        liberar_ast(raiz_ast);
        diag_resumen();
        return 1;
    }

    if (modo_verbose) fprintf(stderr, "Fase 2 completada sin errores.\n");

    /*
     * Una vez que la fase 2 termina sin errores, se puede pedir la impresion
     * del AST en pantalla o en un archivo de salida.
     */
    // Imprimir AST si se solicitó (-t)
    if (modo_arbol) {
        FILE *salida = stdout;
        if (archivo_salida != NULL) {
            salida = fopen(archivo_salida, "w");
            if (salida == NULL) {
                fprintf(stderr, "novac: no se pudo escribir '%s'\n", archivo_salida);
                liberar_ast(raiz_ast);
                return 3;
            }
        }
        fprintf(salida, "=== Arbol sintactico (AST) ===\n");
        imprimir_ast(salida, raiz_ast);
        if (archivo_salida != NULL && salida != stdout) fclose(salida);
    }

    /*
     * Fase 3: analisis semantico. Construye la tabla de simbolos, verifica
     * tipos, ambitos y flujo, y deja en cada simbolo la direccion de memoria
     * que la fase 4 necesita para generar codigo de CERBERO.
     */
    if (modo_verbose) fprintf(stderr, "== Fase 3: Analisis Semantico -- %s ==\n", archivo_fuente);

    SymbolTable *tabla = NULL;
    bool sem_ok = semantic_analyze(raiz_ast, &tabla);

    if (!sem_ok) {
        symtab_destroy(tabla);
        liberar_ast(raiz_ast);
        diag_resumen();
        return 1;
    }

    if (modo_verbose) fprintf(stderr, "Fase 3 completada sin errores.\n");

    /* La tabla de simbolos se imprime despues del analisis, cuando ya tiene
     * los tipos resueltos y las direcciones asignadas. */
    if (modo_symtab) {
        FILE *salida = stdout;
        if (archivo_salida != NULL) {
            salida = fopen(archivo_salida, modo_arbol ? "a" : "w");
            if (salida == NULL) {
                fprintf(stderr, "novac: no se pudo escribir '%s'\n", archivo_salida);
                symtab_destroy(tabla);
                liberar_ast(raiz_ast);
                return 3;
            }
        }
        symtab_dump(salida, tabla);
        if (archivo_salida != NULL && salida != stdout) fclose(salida);
    }

    /* Las advertencias se resumen aunque la compilacion haya salido bien. */
    if (diag_advertencias() > 0) diag_resumen();

    /*
     * Fase 4: codigo intermedio y ensamblador de CERBERO. El AST ya viene
     * decorado por la fase 3 con la direccion de cada nombre.
     */
    /*
     * Si no se pidio ningun volcado, la salida por omision es el ejecutable
     * binario, como dice el documento. --ir y -s son volcados de texto que
     * reemplazan al binario para poder revisar la fase por partes.
     */
    int modo_binario = (!modo_ir && !modo_asm && !modo_arbol && !modo_symtab);

    if (modo_ir || modo_asm || modo_binario) {
        if (modo_verbose) {
            fprintf(stderr, "== Fase 4: Generacion de codigo intermedio -- %s ==\n", archivo_fuente);
            fprintf(stderr, "== Fase 5: Planificacion VLIW y Empaquetado -- %s ==\n", archivo_fuente);
        }

        TACList *tac = tac_generate_from_ast(raiz_ast, tabla);
        bool gen_ok = true;

        if (modo_ir || modo_asm) {
            FILE *salida = stdout;
            if (archivo_salida != NULL && !modo_arbol && !modo_symtab) {
                salida = fopen(archivo_salida, "w");
                if (salida == NULL) {
                    fprintf(stderr, "novac: no se pudo escribir '%s'\n", archivo_salida);
                    tac_free(tac);
                    symtab_destroy(tabla);
                    liberar_ast(raiz_ast);
                    return 3;
                }
            }
            if (modo_ir) tac_print(salida, tac);
            if (modo_asm) gen_ok = codegen_generate_vliw(tac, tabla, salida);
            if (salida != stdout) fclose(salida);
        } else {
            /* El binario nunca va a pantalla: siempre a un archivo. */
            char nombre[256];
            const char *destino = archivo_salida;
            if (destino == NULL) {
                nombre_por_omision(archivo_fuente, 0, nombre, sizeof(nombre));
                destino = nombre;
            }
            FILE *salida = fopen(destino, "wb");
            if (salida == NULL) {
                fprintf(stderr, "novac: no se pudo escribir '%s'\n", destino);
                tac_free(tac);
                symtab_destroy(tabla);
                liberar_ast(raiz_ast);
                return 3;
            }
            gen_ok = codegen_emitir_binario(tac, tabla, salida);
            fclose(salida);
            if (!gen_ok || diag_errores() > 0) remove(destino);
            else if (modo_verbose) fprintf(stderr, "ejecutable escrito en '%s'\n", destino);
        }

        tac_free(tac);

        if (!gen_ok || diag_errores() > 0) {
            symtab_destroy(tabla);
            liberar_ast(raiz_ast);
            diag_resumen();
            return 1;
        }
        if (modo_verbose) fprintf(stderr, "Fase 4 completada sin errores.\n");
    }

    symtab_destroy(tabla);
    liberar_ast(raiz_ast);
    return 0;
}