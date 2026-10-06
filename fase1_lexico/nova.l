%{
/* Lexer principal del lenguaje Nova. Aqui se reconocen tokens, cadenas,
 * comentarios y errores lexicos. */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include "ast.h"
#include "diag.h"
#include "nova.tab.h"

#define YY_DECL int yylex_crudo(void)

typedef struct { const char *palabra; int token; } Reservada;

Reservada tabla[] = {
    {"functio", TK_FUNCTIO}, {"varia", TK_VARIA}, {"constans", TK_CONSTANS},
    {"privatum", TK_PRIVATUM}, {"importa", TK_IMPORTA}, {"ut", TK_UT}, {"redde", TK_REDDE},
    {"si", TK_SI}, {"sin", TK_SIN}, {"aliter", TK_ALITER}, {"dum", TK_DUM},
    {"per", TK_PER}, {"rumpe", TK_RUMPE}, {"perge", TK_PERGE},
    {"integer", TK_TIPO_INTEGER}, {"veritas", TK_TIPO_VERITAS},
    {"textus", TK_TIPO_TEXTUS}, {"nihil", TK_TIPO_NIHIL},
    {"et", TK_ET}, {"aut", TK_AUT}, {"non", TK_NON},
    {"verum", TK_VERUM}, {"falsum", TK_FALSUM}
};
int cant_reservadas = sizeof(tabla) / sizeof(tabla[0]);

int buscar_reservada(char *lexema) {
    int i;
    for (i = 0; i < cant_reservadas; i++) {
        if (strcmp(lexema, tabla[i].palabra) == 0) return tabla[i].token;
    }
    return TK_IDENT;
}

char buffer_cadena[4096];
#define MAX_CADENA ((int)sizeof(buffer_cadena) - 1)
int  len_cadena;

int lin_act = 1, col_act = 1;

int cad_linea, cad_col;
int com_linea, com_col;

int prev_fin_linea = 1, prev_fin_col = 1;
static int ult_fin_linea = 1, ult_fin_col = 1;

#define MAX_LLAVES 1024
static int llaves_lin[MAX_LLAVES], llaves_col[MAX_LLAVES];
static int llaves_tope = 0;

static void llave_abrir(int lin, int col) {
    if (llaves_tope < MAX_LLAVES) {
        llaves_lin[llaves_tope] = lin;
        llaves_col[llaves_tope] = col;
    }
    llaves_tope++;
}
static void llave_cerrar(void) { if (llaves_tope > 0) llaves_tope--; }

int llave_abierta(int *lin, int *col) {
    if (llaves_tope <= 0 || llaves_tope > MAX_LLAVES) return 0;
    *lin = llaves_lin[llaves_tope - 1];
    *col = llaves_col[llaves_tope - 1];
    return 1;
}

static void avanzar(const char *t, int n) {
    int i;
    yylloc.first_line = lin_act;
    yylloc.first_column = col_act;
    for (i = 0; i < n; i++) {
        if (t[i] == '\n') { lin_act++; col_act = 1; }
        else if (((unsigned char)t[i] & 0xC0) != 0x80) col_act++;
    }
    yylloc.last_line = lin_act;
    yylloc.last_column = col_act;
}
#define YY_USER_ACTION avanzar(yytext, yyleng);

/* Cuenta caracteres visibles para mensajes de error, ignorando bytes de continuacion UTF-8. */
static int largo_utf8(const char *t) {
    int n = 0;
    for (; *t; t++) if (((unsigned char)*t & 0xC0) != 0x80) n++;
    return n;
}

static int es_ident_inicio(int c) {
    return isalpha((unsigned char)c) || c == '_';
}

static int es_ident_seguro(int c) {
    return isalnum((unsigned char)c) || c == '_';
}
%}

%option noyywrap
%option yylineno

%x COMENTARIO
%x CADENA

%%

[ \t\r\n]+   { }

"#{"                 { BEGIN(COMENTARIO); com_linea = yylloc.first_line; com_col = yylloc.first_column; }
<COMENTARIO>"}#"     { BEGIN(INITIAL); }
<COMENTARIO>\n       { }
<COMENTARIO>.        { }
<COMENTARIO><<EOF>>  { diag_error("E103", com_linea, com_col, 2, "comentario de bloque sin cerrar; falta '}#'"); BEGIN(INITIAL); }

"#"[^{\n][^\n]*      { }
"#"                  { }

    /* Cadenas. Los escapes validos son \n, \t, \\, y \\". */
\"                   { BEGIN(CADENA); len_cadena = 0; cad_linea = yylloc.first_line; cad_col = yylloc.first_column; }
<CADENA>\"           { BEGIN(INITIAL); buffer_cadena[len_cadena] = '\0'; yylval.texto = strdup(buffer_cadena);
                       yylloc.first_line = cad_linea; yylloc.first_column = cad_col; return TK_CADENA; }
<CADENA>\\n          { if (len_cadena < MAX_CADENA) buffer_cadena[len_cadena++] = '\n'; }
<CADENA>\\t          { if (len_cadena < MAX_CADENA) buffer_cadena[len_cadena++] = '\t'; }
<CADENA>\\\\         { if (len_cadena < MAX_CADENA) buffer_cadena[len_cadena++] = '\\'; }
<CADENA>\\\"         { if (len_cadena < MAX_CADENA) buffer_cadena[len_cadena++] = '"'; }
<CADENA>\\.          { diag_error("E104", yylloc.first_line, yylloc.first_column, 2, "secuencia de escape desconocida '%s'", yytext); }
<CADENA>\n           { diag_error("E102", cad_linea, cad_col, 1, "cadena sin comilla de cierre antes del fin de linea"); buffer_cadena[len_cadena] = '\0'; yylval.texto = strdup(buffer_cadena);
                       yylloc.last_line = yylloc.first_line; yylloc.last_column = yylloc.first_column;
                       yylloc.first_line = cad_linea; yylloc.first_column = cad_col; BEGIN(INITIAL); return TK_CADENA; }
<CADENA><<EOF>>      { diag_error("E102", cad_linea, cad_col, 1, "cadena sin comilla de cierre antes del fin de linea"); buffer_cadena[len_cadena] = '\0'; yylval.texto = strdup(buffer_cadena);
                       yylloc.first_line = cad_linea; yylloc.first_column = cad_col; yylloc.last_line = lin_act; yylloc.last_column = col_act; BEGIN(INITIAL); return TK_CADENA; }
<CADENA>.            { if (len_cadena < MAX_CADENA) buffer_cadena[len_cadena++] = yytext[0]; }

    /* Identificadores y palabras reservadas. */
[A-Za-z_][A-Za-z0-9_]*  {
    int tok = buscar_reservada(yytext);
    if (tok == TK_IDENT) yylval.texto = strdup(yytext);
    return tok;
}

    /* Enteros decimales y hexadecimales. */
0x[0-9A-Fa-f]+[A-Za-z_][A-Za-z0-9_]* {
    diag_error("E105", yylloc.first_line, yylloc.first_column, yyleng, "literal hexadecimal seguido de identificador sin separador");
    yylval.entero = 0;
    return TK_ENTERO;
}
0x[0-9A-Fa-f]+ {
    unsigned long valor = strtoul(yytext, NULL, 16);
    if (valor > 0xFFFFFFFFUL) diag_error("E106", yylloc.first_line, yylloc.first_column, yyleng, "el literal no cabe en un integer de 32 bits");
    yylval.entero = (long)valor;
    return TK_ENTERO;
}
0x              { diag_error("E105", yylloc.first_line, yylloc.first_column, 2, "literal numerico mal formado: '0x'"); }
[0-9]+[A-Za-z_][A-Za-z0-9_]* {
    diag_error("E105", yylloc.first_line, yylloc.first_column, yyleng, "literal entero seguido de identificador sin separador");
    yylval.entero = 0;
    return TK_ENTERO;
}
[0-9]+          {
    unsigned long valor = strtoul(yytext, NULL, 10);
    if (valor > 0xFFFFFFFFUL) diag_error("E106", yylloc.first_line, yylloc.first_column, yyleng, "el literal no cabe en un integer de 32 bits");
    yylval.entero = (long)valor;
    return TK_ENTERO;
}

    /* Operadores y delimitadores del lenguaje. */
">>>"  { return TK_DESP_LOG; }
">>"   { return TK_DESP_DER; }
">="   { return TK_MAYOR_IGUAL; }
">"    { return TK_MAYOR; }
"<<"   { return TK_DESP_IZQ; }
"<="   { return TK_MENOR_IGUAL; }
"<"    { return TK_MENOR; }
"=="   { return TK_IGUAL; }
"!="   { return TK_DIFERENTE; }
"->"   { return TK_FLECHA; }
"+="   { return TK_ASIGNA_MAS; }
"-="   { return TK_ASIGNA_MENOS; }
"*="   { return TK_ASIGNA_POR; }
"/="   { return TK_ASIGNA_ENTRE; }
"%="   { return TK_ASIGNA_MODULO; }
"="    { return TK_ASIGNA; }
"+"    { return TK_MAS; }
"-"    { return TK_MENOS; }
"*"    { return TK_POR; }
"/"    { return TK_ENTRE; }
"%"    { return TK_MODULO; }
"("    { return TK_PAR_IZQ; }
")"    { return TK_PAR_DER; }
"{"    { llave_abrir(yylloc.first_line, yylloc.first_column); return TK_LLAVE_IZQ; }
"}"    { llave_cerrar(); return TK_LLAVE_DER; }
"["    { return TK_COR_IZQ; }
"]"    { return TK_COR_DER; }
";"    { return TK_PUNTO_COMA; }
","    { return TK_COMA; }
":"    { return TK_DOS_PUNTOS; }
"."    { return TK_PUNTO; }
"@"    { return TK_ARROBA; }
"&"    { return TK_AMPERSAND; }
"|"    { return TK_BARRA; }
"^"    { return TK_XOR; }
"~"    { return TK_NOT; }

    /* Cualquier otro caracter es invalido fuera de una cadena. */
[\x80-\xFF]+  { diag_error("E101", yylloc.first_line, yylloc.first_column, largo_utf8(yytext), "caracter no valido '%s' fuera de una cadena", yytext); }
.      { diag_error("E101", yylloc.first_line, yylloc.first_column, 1, "caracter no valido '%s' fuera de una cadena", yytext); }

<<EOF>> { yylloc.first_line = yylloc.last_line = lin_act;
          yylloc.first_column = yylloc.last_column = col_act;
          return 0; }

%%

int yylex(void) {
    int t;
    prev_fin_linea = ult_fin_linea;
    prev_fin_col = ult_fin_col;
    t = yylex_crudo();
    ult_fin_linea = yylloc.last_line;
    ult_fin_col = yylloc.last_column;
    return t;
}
