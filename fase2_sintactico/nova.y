%{
/* Parser de Nova para la fase 2.
 * Aqui se define la gramatica y se construye el AST. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ast.h"
#include "diag.h"

extern char *yytext;
extern FILE *yyin;
extern int prev_fin_linea, prev_fin_col;
int llave_abierta(int *lin, int *col);
int yylex(void);
void yyerror(const char *msg);

int errores_sintacticos = 0;
Nodo *raiz_ast = NULL;
%}

%union {
    long entero;
    char *texto;
    struct Nodo *nodo;
}

/* Cada regla guarda su posicion para marcar mejor la linea del nodo. */
%locations

/* Los errores de Bison se muestran de forma mas legible. */
%define parse.error verbose

/* Si hay un error, liberamos los nodos parciales que quedaron en la pila. */
%destructor { liberar_ast($$); } <nodo>

/* La raiz se deja para que main() pueda imprimir el AST final. */
%destructor { /* no liberar: main() todavia necesita raiz_ast */ } programa

/* Si queda texto suelto por un error, tambien se libera. */
%destructor { free($$); } <texto>

/* ---- Tokens con valor semantico ---- */
%token <texto> TK_IDENT TK_CADENA
%token <entero> TK_ENTERO

/* ---- Palabras reservadas ---- */
%token TK_FUNCTIO TK_VARIA TK_CONSTANS TK_PRIVATUM TK_IMPORTA TK_UT TK_REDDE
%token TK_SI TK_SIN TK_ALITER TK_DUM TK_PER TK_RUMPE TK_PERGE
%token TK_TIPO_INTEGER TK_TIPO_VERITAS TK_TIPO_TEXTUS TK_TIPO_NIHIL
%token TK_VERUM TK_FALSUM

/* ---- Delimitadores y simbolos especiales ---- */
%token TK_PAR_IZQ TK_PAR_DER TK_LLAVE_IZQ TK_LLAVE_DER
%token TK_COR_IZQ TK_COR_DER TK_PUNTO_COMA TK_COMA
%token TK_DOS_PUNTOS TK_PUNTO TK_FLECHA TK_ARROBA
%token TK_ASIGNA TK_ASIGNA_MAS TK_ASIGNA_MENOS TK_ASIGNA_POR TK_ASIGNA_ENTRE TK_ASIGNA_MODULO

/* ---- Operadores con precedencia ---- */
%left TK_AUT
%left TK_ET
%left TK_BARRA
%left TK_XOR
%left TK_AMPERSAND
%left TK_IGUAL TK_DIFERENTE
%left TK_MENOR TK_MENOR_IGUAL TK_MAYOR TK_MAYOR_IGUAL
%left TK_DESP_IZQ TK_DESP_DER TK_DESP_LOG
%left TK_MAS TK_MENOS
%left TK_POR TK_ENTRE TK_MODULO
%right TK_NON TK_NOT UMENOS

%type <nodo> programa importaciones_opt importacion
%type <nodo> declaraciones_globales_opt declaracion_global
%type <nodo> anotaciones_opt anotacion privatum_opt
%type <nodo> decl_func parametros_opt parametros parametro
%type <nodo> decl_const decl_var
%type <nodo> tipo tipo_param dims dims_param
%type <nodo> bloque sentencias_opt sentencia
%type <nodo> inicializador lista_valores lista_inicializadores
%type <nodo> sent_asignacion asignacion designador
%type <nodo> sent_si cola_si
%type <nodo> sent_dum sent_per per_init
%type <nodo> sent_redde sent_rumpe sent_perge
%type <nodo> sent_llamada llamada_expr lista_argumentos argumentos
%type <nodo> expresion referencia

%start programa

%%

/* Regla principal: el programa puede tener imports y declaraciones globales. */
programa
    : importaciones_opt declaraciones_globales_opt
        {
            raiz_ast = nodo_nuevo(NODO_PROGRAMA, NULL, 0, 1);
            agregar_hijo(raiz_ast, agregar_hijo(nodo_nuevo(NODO_IMPORTS, NULL, 0, 1), $1));
            agregar_hijo(raiz_ast, agregar_hijo(nodo_nuevo(NODO_GLOBALES, NULL, 0, 1), $2));
            $$ = raiz_ast;
        }
    ;

/* Importaciones */
importaciones_opt
    : /* vacio */                       { $$ = NULL; }
    | importaciones_opt importacion     { $$ = cadena_agregar($1, $2); }
    ;

importacion
    : TK_IMPORTA TK_CADENA TK_PUNTO_COMA
        { $$ = nodo_nuevo(NODO_IMPORT, $2, 0, @$.first_line); }
    | TK_IMPORTA TK_CADENA TK_UT TK_IDENT TK_PUNTO_COMA
        {
            $$ = nodo_nuevo(NODO_IMPORT, $2, 0, @$.first_line);
            agregar_hijo($$, nodo_nuevo(NODO_ALIAS, $4, 0, @$.first_line));
        }
    ;

/* Declaraciones globales */
declaraciones_globales_opt
    : /* vacio */                                   { $$ = NULL; }
    | declaraciones_globales_opt declaracion_global { $$ = cadena_agregar($1, $2); }
    ;

declaracion_global
    : anotaciones_opt privatum_opt decl_func
        { $$ = $3; agregar_hijo($$, $1); agregar_hijo($$, $2); }
    | anotaciones_opt privatum_opt decl_const
        { $$ = $3; agregar_hijo($$, $1); agregar_hijo($$, $2); }
    ;

privatum_opt
    : /* vacio */   { $$ = NULL; }
    | TK_PRIVATUM   { $$ = nodo_nuevo(NODO_PRIVATUM, NULL, 0, @$.first_line); }
    ;

anotaciones_opt
    : /* vacio */                   { $$ = NULL; }
    | anotaciones_opt anotacion     { $$ = cadena_agregar($1, $2); }
    ;

anotacion
    : TK_ARROBA TK_IDENT
        { $$ = nodo_nuevo(NODO_ANOTACION, $2, 0, @$.first_line); }
    | TK_ARROBA TK_IDENT TK_PAR_IZQ TK_CADENA TK_PAR_DER
        {
            $$ = nodo_nuevo(NODO_ANOTACION, $2, 0, @$.first_line);
            agregar_hijo($$, nodo_nuevo(NODO_CADENA, $4, 0, @$.first_line));
        }
    ;

decl_func
    : TK_FUNCTIO TK_IDENT TK_PAR_IZQ parametros_opt TK_PAR_DER TK_FLECHA tipo bloque
        {
            $$ = nodo_nuevo(NODO_FUNCION, $2, 0, @$.first_line);
            agregar_hijo($$, agregar_hijo(nodo_nuevo(NODO_PARAMETROS, NULL, 0, @$.first_line), $4));
            agregar_hijo($$, $7);
            agregar_hijo($$, $8);
        }
    ;

parametros_opt
    : /* vacio */   { $$ = NULL; }
    | parametros    { $$ = $1; }
    ;

parametros
    : parametro                      { $$ = $1; }
    | parametros TK_COMA parametro   { $$ = cadena_agregar($1, $3); }
    ;

parametro
    : TK_IDENT TK_DOS_PUNTOS tipo_param
        { $$ = nodo_nuevo(NODO_PARAMETRO, $1, 0, @$.first_line); agregar_hijo($$, $3); }
    ;

decl_const
    : TK_CONSTANS TK_IDENT TK_DOS_PUNTOS tipo TK_ASIGNA expresion TK_PUNTO_COMA
        {
            $$ = nodo_nuevo(NODO_CONSTANTE, $2, 0, @$.first_line);
            agregar_hijo($$, $4);
            agregar_hijo($$, $6);
        }
    ;

/* Tipos y dimensiones */
tipo
    : TK_TIPO_INTEGER dims   { $$ = nodo_nuevo(NODO_TIPO, strdup("integer"), 0, @$.first_line); agregar_hijo($$, $2); }
    | TK_TIPO_VERITAS dims   { $$ = nodo_nuevo(NODO_TIPO, strdup("veritas"), 0, @$.first_line); agregar_hijo($$, $2); }
    | TK_TIPO_TEXTUS dims    { $$ = nodo_nuevo(NODO_TIPO, strdup("textus"), 0, @$.first_line); agregar_hijo($$, $2); }
    | TK_TIPO_NIHIL dims     { $$ = nodo_nuevo(NODO_TIPO, strdup("nihil"), 0, @$.first_line); agregar_hijo($$, $2); }
    ;

dims
    : /* vacio */                          { $$ = NULL; }
    | dims TK_COR_IZQ expresion TK_COR_DER
        { $$ = cadena_agregar($1, agregar_hijo(nodo_nuevo(NODO_DIMENSION, NULL, 0, @2.first_line), $3)); }
    ;

tipo_param
    : TK_TIPO_INTEGER dims_param   { $$ = nodo_nuevo(NODO_TIPO, strdup("integer"), 0, @$.first_line); agregar_hijo($$, $2); }
    | TK_TIPO_VERITAS dims_param   { $$ = nodo_nuevo(NODO_TIPO, strdup("veritas"), 0, @$.first_line); agregar_hijo($$, $2); }
    | TK_TIPO_TEXTUS dims_param    { $$ = nodo_nuevo(NODO_TIPO, strdup("textus"), 0, @$.first_line); agregar_hijo($$, $2); }
    | TK_TIPO_NIHIL dims_param     { $$ = nodo_nuevo(NODO_TIPO, strdup("nihil"), 0, @$.first_line); agregar_hijo($$, $2); }
    ;

dims_param
    : /* vacio */                                { $$ = NULL; }
    | dims_param TK_COR_IZQ TK_COR_DER
        { $$ = cadena_agregar($1, nodo_nuevo(NODO_DIM_ABIERTA, NULL, 0, @2.first_line)); }
    | dims_param TK_COR_IZQ expresion TK_COR_DER
        { $$ = cadena_agregar($1, agregar_hijo(nodo_nuevo(NODO_DIMENSION, NULL, 0, @2.first_line), $3)); }
    ;

/* Bloques y sentencias */
bloque
    : TK_LLAVE_IZQ sentencias_opt TK_LLAVE_DER
        { $$ = agregar_hijo(nodo_nuevo(NODO_BLOQUE, NULL, 0, @$.first_line), $2); }
    ;

sentencias_opt
    : /* vacio */                  { $$ = NULL; }
    | sentencias_opt sentencia     { $$ = cadena_agregar($1, $2); }
    ;

sentencia
    : decl_var          { $$ = $1; }
    | decl_const         { $$ = $1; }
    | sent_asignacion     { $$ = $1; }
    | sent_si              { $$ = $1; }
    | sent_dum              { $$ = $1; }
    | sent_per               { $$ = $1; }
    | sent_redde              { $$ = $1; }
    | sent_rumpe               { $$ = $1; }
    | sent_perge                { $$ = $1; }
    | sent_llamada                { $$ = $1; }
    | bloque                       { $$ = $1; }
    ;

decl_var
    : TK_VARIA TK_IDENT TK_DOS_PUNTOS tipo TK_PUNTO_COMA
        { $$ = nodo_nuevo(NODO_VARIABLE, $2, 0, @$.first_line); agregar_hijo($$, $4); }
    | TK_VARIA TK_IDENT TK_DOS_PUNTOS tipo TK_ASIGNA inicializador TK_PUNTO_COMA
        { $$ = nodo_nuevo(NODO_VARIABLE, $2, 0, @$.first_line); agregar_hijo($$, $4); agregar_hijo($$, $6); }
    ;

inicializador
    : expresion      { $$ = $1; }
    | lista_valores  { $$ = $1; }
    ;

lista_valores
    : TK_LLAVE_IZQ TK_LLAVE_DER
        { $$ = nodo_nuevo(NODO_LISTA_VALORES, NULL, 0, @$.first_line); }
    | TK_LLAVE_IZQ lista_inicializadores TK_LLAVE_DER
        { $$ = agregar_hijo(nodo_nuevo(NODO_LISTA_VALORES, NULL, 0, @$.first_line), $2); }
    ;

lista_inicializadores
    : inicializador                               { $$ = $1; }
    | lista_inicializadores TK_COMA inicializador { $$ = cadena_agregar($1, $3); }
    ;

sent_asignacion
    : asignacion TK_PUNTO_COMA { $$ = $1; }
    ;

/* Las asignaciones compuestas se expanden a la forma simple. */
asignacion
    : designador TK_ASIGNA expresion
        { $$ = nodo_asignacion($1, NULL, $3, @$.first_line); }
    | designador TK_ASIGNA_MAS expresion
        { $$ = nodo_asignacion($1, "+", $3, @$.first_line); }
    | designador TK_ASIGNA_MENOS expresion
        { $$ = nodo_asignacion($1, "-", $3, @$.first_line); }
    | designador TK_ASIGNA_POR expresion
        { $$ = nodo_asignacion($1, "*", $3, @$.first_line); }
    | designador TK_ASIGNA_ENTRE expresion
        { $$ = nodo_asignacion($1, "/", $3, @$.first_line); }
    | designador TK_ASIGNA_MODULO expresion
        { $$ = nodo_asignacion($1, "%", $3, @$.first_line); }
    ;

designador
    : TK_IDENT
        { $$ = nodo_nuevo(NODO_IDENT, $1, 0, @$.first_line); }
    | designador TK_COR_IZQ expresion TK_COR_DER
        { $$ = agregar_hijo(nodo_nuevo(NODO_INDICE, NULL, 0, @$.first_line), $1); agregar_hijo($$, $3); }
    ;

/* 'sin' se convierte en una cadena de ifs anidados. */
sent_si
    : TK_SI TK_PAR_IZQ expresion TK_PAR_DER bloque cola_si
        {
            $$ = nodo_nuevo(NODO_SI, NULL, 0, @$.first_line);
            agregar_hijo($$, $3);
            agregar_hijo($$, $5);
            agregar_hijo($$, $6);
        }
    ;

cola_si
    : /* vacio */   { $$ = NULL; }
    | TK_ALITER bloque
        { $$ = $2; }
    | TK_SIN TK_PAR_IZQ expresion TK_PAR_DER bloque cola_si
        {
            Nodo *interno = nodo_nuevo(NODO_SI, NULL, 0, @1.first_line);
            agregar_hijo(interno, $3);
            agregar_hijo(interno, $5);
            agregar_hijo(interno, $6);
            $$ = agregar_hijo(nodo_nuevo(NODO_BLOQUE, NULL, 0, @1.first_line), interno);
        }
    ;

sent_dum
    : TK_DUM TK_PAR_IZQ expresion TK_PAR_DER bloque
        { $$ = nodo_nuevo(NODO_DUM, NULL, 0, @$.first_line); agregar_hijo($$, $3); agregar_hijo($$, $5); }
    ;

sent_per
    : TK_PER TK_PAR_IZQ per_init TK_PUNTO_COMA expresion TK_PUNTO_COMA asignacion TK_PAR_DER bloque
        {
            $$ = nodo_nuevo(NODO_PER, NULL, 0, @$.first_line);
            agregar_hijo($$, $3);
            agregar_hijo($$, $5);
            agregar_hijo($$, $7);
            agregar_hijo($$, $9);
        }
    ;

per_init
    : TK_VARIA TK_IDENT TK_DOS_PUNTOS tipo TK_ASIGNA expresion
        { $$ = nodo_nuevo(NODO_VARIABLE, $2, 0, @$.first_line); agregar_hijo($$, $4); agregar_hijo($$, $6); }
    | asignacion
        { $$ = $1; }
    ;

sent_redde
    : TK_REDDE TK_PUNTO_COMA
        { $$ = nodo_nuevo(NODO_REDDE, NULL, 0, @$.first_line); }
    | TK_REDDE expresion TK_PUNTO_COMA
        { $$ = agregar_hijo(nodo_nuevo(NODO_REDDE, NULL, 0, @$.first_line), $2); }
    ;

sent_rumpe
    : TK_RUMPE TK_PUNTO_COMA  { $$ = nodo_nuevo(NODO_RUMPE, NULL, 0, @$.first_line); }
    ;

sent_perge
    : TK_PERGE TK_PUNTO_COMA  { $$ = nodo_nuevo(NODO_PERGE, NULL, 0, @$.first_line); }
    ;

sent_llamada
    : llamada_expr TK_PUNTO_COMA { $$ = $1; }
    ;

llamada_expr
    : TK_IDENT TK_PAR_IZQ lista_argumentos TK_PAR_DER
        { $$ = nodo_nuevo(NODO_LLAMADA, $1, 0, @$.first_line); agregar_hijo($$, $3); }
    | TK_IDENT TK_PUNTO TK_IDENT TK_PAR_IZQ lista_argumentos TK_PAR_DER
        {
            $$ = fijar_modulo(nodo_nuevo(NODO_LLAMADA, $3, 0, @$.first_line), $1);
            agregar_hijo($$, $5);
        }
    ;

lista_argumentos
    : /* vacio */  { $$ = NULL; }
    | argumentos   { $$ = $1; }
    ;

argumentos
    : expresion
        {
            $$ = nodo_nuevo(NODO_ARGUMENTOS, NULL, 0, @$.first_line);
            agregar_hijo($$, $1);
        }
    | argumentos TK_COMA expresion
        {
            $$ = $1;
            agregar_hijo($$, $3);
        }
    ;

/* Expresiones. La precedencia la resuelve Bison con las reglas %left/%right. */
expresion
    : expresion TK_AUT expresion         { $$ = binario("aut", $1, $3, @$.first_line); }
    | expresion TK_ET expresion          { $$ = binario("et", $1, $3, @$.first_line); }
    | expresion TK_BARRA expresion       { $$ = binario("|", $1, $3, @$.first_line); }
    | expresion TK_XOR expresion         { $$ = binario("^", $1, $3, @$.first_line); }
    | expresion TK_AMPERSAND expresion   { $$ = binario("&", $1, $3, @$.first_line); }
    | expresion TK_IGUAL expresion       { $$ = binario("==", $1, $3, @$.first_line); }
    | expresion TK_DIFERENTE expresion   { $$ = binario("!=", $1, $3, @$.first_line); }
    | expresion TK_MENOR expresion       { $$ = binario("<", $1, $3, @$.first_line); }
    | expresion TK_MENOR_IGUAL expresion { $$ = binario("<=", $1, $3, @$.first_line); }
    | expresion TK_MAYOR expresion       { $$ = binario(">", $1, $3, @$.first_line); }
    | expresion TK_MAYOR_IGUAL expresion { $$ = binario(">=", $1, $3, @$.first_line); }
    | expresion TK_DESP_IZQ expresion    { $$ = binario("<<", $1, $3, @$.first_line); }
    | expresion TK_DESP_DER expresion    { $$ = binario(">>", $1, $3, @$.first_line); }
    | expresion TK_DESP_LOG expresion    { $$ = binario(">>>", $1, $3, @$.first_line); }
    | expresion TK_MAS expresion         { $$ = binario("+", $1, $3, @$.first_line); }
    | expresion TK_MENOS expresion       { $$ = binario("-", $1, $3, @$.first_line); }
    | expresion TK_POR expresion         { $$ = binario("*", $1, $3, @$.first_line); }
    | expresion TK_ENTRE expresion       { $$ = binario("/", $1, $3, @$.first_line); }
    | expresion TK_MODULO expresion      { $$ = binario("%", $1, $3, @$.first_line); }
    | TK_MENOS expresion %prec UMENOS    { $$ = unario("-", $2, @$.first_line); }
    | TK_NON expresion                   { $$ = unario("non", $2, @$.first_line); }
    | TK_NOT expresion                   { $$ = unario("~", $2, @$.first_line); }
    | TK_PAR_IZQ expresion TK_PAR_DER    { $$ = $2; }
    | referencia                          { $$ = $1; }
    | TK_ENTERO                            { $$ = nodo_nuevo(NODO_ENTERO, NULL, $1, @$.first_line); }
    | TK_CADENA                             { $$ = nodo_nuevo(NODO_CADENA, $1, 0, @$.first_line); }
    | TK_VERUM                               { $$ = nodo_nuevo(NODO_BOOLEANO, strdup("verum"), 1, @$.first_line); }
    | TK_FALSUM                               { $$ = nodo_nuevo(NODO_BOOLEANO, strdup("falsum"), 0, @$.first_line); }
    ;

referencia
    : TK_IDENT
        { $$ = nodo_nuevo(NODO_IDENT, $1, 0, @$.first_line); }
    | TK_IDENT TK_PUNTO TK_IDENT
        { $$ = fijar_modulo(nodo_nuevo(NODO_IDENT, $3, 0, @$.first_line), $1); }
    | llamada_expr
        { $$ = $1; }
    | referencia TK_COR_IZQ expresion TK_COR_DER
        { $$ = agregar_hijo(nodo_nuevo(NODO_INDICE, NULL, 0, @$.first_line), $1); agregar_hijo($$, $3); }
    ;

%%

/* Diagnosticos sintacticos. Convertimos el error tecnico de Bison en
 * mensajes mas claros con codigo E2xx. */
typedef struct { const char *nombre; const char *texto; } NombreTok;

static const NombreTok nombres_tok[] = {
    {"TK_FUNCTIO","functio"}, {"TK_VARIA","varia"}, {"TK_CONSTANS","constans"},
    {"TK_PRIVATUM","privatum"}, {"TK_IMPORTA","importa"}, {"TK_UT","ut"},
    {"TK_REDDE","redde"}, {"TK_SI","si"}, {"TK_SIN","sin"}, {"TK_ALITER","aliter"},
    {"TK_DUM","dum"}, {"TK_PER","per"}, {"TK_RUMPE","rumpe"}, {"TK_PERGE","perge"},
    {"TK_TIPO_INTEGER","integer"}, {"TK_TIPO_VERITAS","veritas"},
    {"TK_TIPO_TEXTUS","textus"}, {"TK_TIPO_NIHIL","nihil"},
    {"TK_ET","et"}, {"TK_AUT","aut"}, {"TK_NON","non"},
    {"TK_VERUM","verum"}, {"TK_FALSUM","falsum"},
    {"TK_MAS","+"}, {"TK_MENOS","-"}, {"TK_POR","*"}, {"TK_ENTRE","/"}, {"TK_MODULO","%"},
    {"TK_IGUAL","=="}, {"TK_DIFERENTE","!="}, {"TK_MENOR","<"}, {"TK_MENOR_IGUAL","<="},
    {"TK_MAYOR",">"}, {"TK_MAYOR_IGUAL",">="},
    {"TK_ASIGNA","="}, {"TK_ASIGNA_MAS","+="}, {"TK_ASIGNA_MENOS","-="},
    {"TK_ASIGNA_POR","*="}, {"TK_ASIGNA_ENTRE","/="}, {"TK_ASIGNA_MODULO","%="},
    {"TK_PAR_IZQ","("}, {"TK_PAR_DER",")"}, {"TK_LLAVE_IZQ","{"}, {"TK_LLAVE_DER","}"},
    {"TK_COR_IZQ","["}, {"TK_COR_DER","]"}, {"TK_PUNTO_COMA",";"}, {"TK_COMA",","},
    {"TK_DOS_PUNTOS",":"}, {"TK_PUNTO","."}, {"TK_FLECHA","->"}, {"TK_ARROBA","@"},
    {"TK_AMPERSAND","&"}, {"TK_BARRA","|"}, {"TK_XOR","^"}, {"TK_NOT","~"},
    {"TK_DESP_IZQ","<<"}, {"TK_DESP_DER",">>"}, {"TK_DESP_LOG",">>>"}
};

static const char *texto_tok(const char *nombre) {
    size_t i;
    for (i = 0; i < sizeof(nombres_tok) / sizeof(nombres_tok[0]); i++)
        if (strcmp(nombres_tok[i].nombre, nombre) == 0) return nombres_tok[i].texto;
    return NULL;
}

/* Traduce el nombre de un token a texto legible para el error. */
static void mostrar_tok(const char *nombre, int es_el_encontrado, char *out, size_t cap) {
    const char *t;
    if (strcmp(nombre, "$end") == 0 || strcmp(nombre, "end of file") == 0)
        snprintf(out, cap, "fin de archivo");
    else if (strcmp(nombre, "TK_IDENT") == 0)
        { if (es_el_encontrado) snprintf(out, cap, "'%s'", yytext); else snprintf(out, cap, "un identificador"); }
    else if (strcmp(nombre, "TK_ENTERO") == 0)
        { if (es_el_encontrado) snprintf(out, cap, "'%s'", yytext); else snprintf(out, cap, "un numero"); }
    else if (strcmp(nombre, "TK_CADENA") == 0)
        snprintf(out, cap, "una cadena");
    else if ((t = texto_tok(nombre)) != NULL)
        snprintf(out, cap, "'%s'", t);
    else
        snprintf(out, cap, "'%s'", nombre);
}

#define MAX_ESP 8

void yyerror(const char *msg) {
    char inesp[64] = "", esp[MAX_ESP][64];
    char vista[96], lista[512] = "", texto[700];
    int nesp = 0, i;
    const char *p;

    /* Leemos el token inesperado y lo que Bison esperaba. */
    p = strstr(msg, "unexpected ");
    if (p != NULL) {
        size_t n;
        p += strlen("unexpected ");
        n = strcspn(p, ",");
        if (n > sizeof(inesp) - 1) n = sizeof(inesp) - 1;
        memcpy(inesp, p, n); inesp[n] = '\0';
    }
    p = strstr(msg, "expecting ");
    if (p != NULL) {
        p += strlen("expecting ");
        while (*p != '\0' && nesp < MAX_ESP) {
            const char *sep = strstr(p, " or ");
            size_t n = sep ? (size_t)(sep - p) : strlen(p);
            if (n > sizeof(esp[0]) - 1) n = sizeof(esp[0]) - 1;
            memcpy(esp[nesp], p, n); esp[nesp][n] = '\0';
            nesp++;
            if (sep == NULL) break;
            p = sep + 4;
        }
    }

    {
        int es_eof = (strcmp(inesp, "$end") == 0 || strcmp(inesp, "end of file") == 0);
        int linea = yylloc.first_line, col = yylloc.first_column, largo = 1;
        const char *codigo = "E201";
        int es_inicio_sentencia = !strcmp(inesp, "TK_VARIA") || !strcmp(inesp, "TK_CONSTANS") ||
            !strcmp(inesp, "TK_SI") || !strcmp(inesp, "TK_DUM") || !strcmp(inesp, "TK_PER") ||
            !strcmp(inesp, "TK_REDDE") || !strcmp(inesp, "TK_RUMPE") || !strcmp(inesp, "TK_PERGE") ||
            !strcmp(inesp, "TK_LLAVE_DER") || !strcmp(inesp, "TK_IDENT");

        if (yylloc.last_line == yylloc.first_line && yylloc.last_column > yylloc.first_column)
            largo = yylloc.last_column - yylloc.first_column;

        mostrar_tok(inesp, 1, vista, sizeof(vista));
        for (i = 0; i < nesp; i++) {
            char una[96];
            mostrar_tok(esp[i], 0, una, sizeof(una));
            if (i > 0) strncat(lista, " o ", sizeof(lista) - strlen(lista) - 1);
            strncat(lista, una, sizeof(lista) - strlen(lista) - 1);
        }

        if (!strcmp(inesp, "TK_SIN") || !strcmp(inesp, "TK_ALITER")) {
            codigo = "E205";
            snprintf(texto, sizeof(texto), "%s sin un 'si' correspondiente", vista);
        } else if (!strcmp(inesp, "TK_IMPORTA")) {
            codigo = "E206";
            snprintf(texto, sizeof(texto), "las importaciones deben ir antes de cualquier declaracion");
        } else if (es_eof) {
            int ll, lc;
            linea = prev_fin_linea; col = prev_fin_col; largo = 1;
            if (llave_abierta(&ll, &lc)) {
                codigo = "E203";
                linea = ll; col = lc;
                snprintf(texto, sizeof(texto), "'{' abierto en la linea %d nunca se cierra", ll);
            } else {
                snprintf(texto, sizeof(texto), "fin de archivo inesperado%s%s",
                         nesp ? ": se esperaba " : "", nesp ? lista : "");
            }
        } else if (nesp == 1 && !strcmp(esp[0], "TK_PUNTO_COMA")) {
            codigo = "E202"; linea = prev_fin_linea; col = prev_fin_col; largo = 1;
            snprintf(texto, sizeof(texto), "falta ';' al final de la sentencia");
        } else if (nesp == 1 && !strcmp(esp[0], "TK_DOS_PUNTOS")) {
            codigo = "E204";
            snprintf(texto, sizeof(texto), "falta ': tipo' en la declaracion");
        } else if (nesp == 1 && !strcmp(esp[0], "TK_FLECHA")) {
            codigo = "E209";
            snprintf(texto, sizeof(texto), "falta '-> tipo' en la declaracion de la funcion");
        } else if (nesp == 1 && !strcmp(esp[0], "TK_LLAVE_IZQ")) {
            codigo = "E207";
            snprintf(texto, sizeof(texto), "el cuerpo debe ir entre llaves");
        } else if (nesp > 0) {
            snprintf(texto, sizeof(texto), "se esperaba %s pero se encontro %s", lista, vista);
        } else if (es_inicio_sentencia && yylloc.first_line > prev_fin_linea) {
            /* Sin lista de esperados, pero el token empieza una sentencia
             * en otra linea: lo normal es que falte el ';' de la anterior. */
            codigo = "E202"; linea = prev_fin_linea; col = prev_fin_col; largo = 1;
            snprintf(texto, sizeof(texto), "falta ';' al final de la sentencia");
        } else {
            snprintf(texto, sizeof(texto), "token inesperado %s", vista);
        }

        diag_error(codigo, linea, col, largo, "%s", texto);
    }
}
