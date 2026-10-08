#!/bin/sh
# Depuracion del compilador de Nova, una fase a la vez.
#
#   sh depurar.sh              # todo, en orden
#   sh depurar.sh build        # compilacion limpia y sin advertencias
#   sh depurar.sh fase1        # analisis lexico
#   sh depurar.sh fase2        # analisis sintactico
#   sh depurar.sh fase3        # analisis semantico
#   sh depurar.sh cobertura    # tokens y codigos de error ejercitados
#   sh depurar.sh memoria      # sanitizers y valgrind
#   sh depurar.sh robustez     # el compilador no debe caerse con nada
#   sh depurar.sh opciones     # banderas y codigos de salida
#
# Cada objetivo imprime lo que verifica y termina en 0 si todo paso.

set -u
NOVAC=./novac
FALLOS=0
SECCION=""

titulo() { SECCION="$1"; printf '\n========== %s ==========\n' "$1"; }
ok()     { printf '  ok    %s\n' "$1"; }
falla()  { printf '  FALLA %s\n' "$1"; FALLOS=$((FALLOS + 1)); }
nota()   { printf '        %s\n' "$1"; }

existe_novac() {
    [ -x "$NOVAC" ] || { echo "no existe $NOVAC: corra 'make' primero"; exit 2; }
}

# ---------------------------------------------------------------- build
d_build() {
    titulo "Compilacion"
    make clean >/dev/null 2>&1
    salida=$(make 2>&1)
    rc=$?
    if [ $rc -ne 0 ]; then
        falla "make devolvio $rc"
        echo "$salida" | tail -20 | sed 's/^/        /'
        return
    fi
    ok "make termina sin errores"

    n=$(echo "$salida" | grep -ci 'warning' || true)
    if [ "$n" -eq 0 ]; then ok "0 advertencias de gcc con -Wall -Wextra"
    else
        falla "$n advertencias de gcc"
        echo "$salida" | grep -i 'warning' | head -10 | sed 's/^/        /'
    fi

    # Las dependencias de encabezados deben existir: si faltan, cambiar un .h
    # no recompila y quedan objetos contra estructuras distintas.
    if [ -f fase3_semantico/symtab.d ]; then ok "se generaron los .d (dependencias de encabezados)"
    else falla "no hay archivos .d: el Makefile no esta generando dependencias"; fi
}

# ---------------------------------------------------------------- fase 1
d_fase1() {
    titulo "Fase 1: analisis lexico"
    existe_novac

    # La tabla de tokens debe salir con lexema, token, linea y columna.
    salida=$($NOVAC --tokens test/factorial.nv 2>&1)
    case "$salida" in
        *LEXEMA*TOKEN*LINEA*COL*) ok "--tokens imprime la tabla con encabezado" ;;
        *) falla "--tokens no imprimio el encabezado esperado" ;;
    esac

    # El conteo que reporta debe coincidir con las filas impresas.
    declarados=$(echo "$salida" | sed -n 's/^-- \([0-9]*\) tokens --$/\1/p')
    filas=$(echo "$salida" | grep -c '[[:space:]]TK_[A-Z_]')
    if [ "$declarados" = "$filas" ]; then ok "el total declarado ($declarados) coincide con las filas"
    else falla "declara $declarados tokens pero imprimio $filas filas"; fi

    # Cada error lexico debe dispararse con su codigo.
    for f in test/errores/E1*.nv; do
        [ -f "$f" ] || continue
        nombre=$(basename "$f" .nv); codigo=${nombre%%_*}
        obtenidos=$($NOVAC --tokens "$f" 2>&1 | grep -o "error\[E[0-9]*\]" | sed 's/.*\[\(.*\)\]/\1/' | sort -u | tr '\n' ' ')
        case " $obtenidos " in
            *" $codigo "*) ok "$codigo se reporta en modo --tokens" ;;
            *) falla "$codigo no aparecio ($nombre dio [$obtenidos])" ;;
        esac
    done

    # Varios errores lexicos en una sola corrida: no debe abortar en el primero.
    n=$($NOVAC --tokens test/lexico/multi_lexicos.nv 2>&1 | grep -c 'error\[')
    if [ "$n" -eq 5 ]; then ok "reporta los 5 errores lexicos de una sola pasada"
    else falla "esperaba 5 errores lexicos y dio $n"; fi

    # Un hexadecimal con letras no es un identificador pegado a un numero.
    printf 'constans A : integer = 0xDEADBEEF;\n' > .tmp_hex.nv
    salida=$($NOVAC -t .tmp_hex.nv 2>&1); rm -f .tmp_hex.nv
    case "$salida" in
        *"Entero -559038737"*) ok "0xDEADBEEF vale -559038737 (integer de 32 bits con signo)" ;;
        *"Entero 3735928559"*) falla "0xDEADBEEF da 3735928559: falta el casteo a int de 32 bits en nova.l" ;;
        *) falla "0xDEADBEEF no se reconocio"; echo "$salida" | sed 's/^/        /' ;;
    esac
}

# ---------------------------------------------------------------- fase 2
d_fase2() {
    titulo "Fase 2: analisis sintactico"
    existe_novac

    # La gramatica debe quedar sin conflictos. Es lo primero que se revisa en
    # una defensa: un conflicto significa que Bison desempato por omision.
    salida=$(bison -Wall --report=all -d -o fase2_sintactico/nova.tab.c \
                   fase2_sintactico/nova.y 2>&1)
    n=$(echo "$salida" | grep -ci 'conflict' || true)
    if [ "$n" -eq 0 ]; then ok "0 conflictos shift/reduce y reduce/reduce"
    else
        falla "bison reporta conflictos"
        echo "$salida" | grep -i conflict | sed 's/^/        /'
        nota "el detalle queda en fase2_sintactico/nova.output"
    fi

    n=$(echo "$salida" | grep -ci 'useless\|nunca se reduce\|never reduced' || true)
    if [ "$n" -eq 0 ]; then ok "no hay reglas ni no terminales inutiles"
    else falla "bison reporta reglas inutiles"; echo "$salida" | sed 's/^/        /'; fi

    # El AST de cada ejemplo debe construirse completo.
    for f in test/ejemplos/*.nv test/factorial.nv; do
        [ -f "$f" ] || continue
        salida=$($NOVAC -t "$f" 2>&1); rc=$?
        case "$salida" in
            *"Programa"*"Globales"*"Funcion"*)
                [ $rc -eq 0 ] && ok "AST de $(basename "$f")" \
                              || falla "AST de $(basename "$f") con rc=$rc" ;;
            *) falla "el AST de $(basename "$f") no tiene la forma esperada" ;;
        esac
    done

    # Errores sintacticos, uno por codigo.
    for f in test/errores/E2*.nv; do
        [ -f "$f" ] || continue
        nombre=$(basename "$f" .nv); codigo=${nombre%%_*}
        obtenidos=$($NOVAC "$f" 2>&1 | grep -o "error\[E[0-9]*\]" | sed 's/.*\[\(.*\)\]/\1/' | sort -u | tr '\n' ' ')
        case " $obtenidos " in
            *" $codigo "*) ok "$codigo se reporta" ;;
            *) falla "$codigo no aparecio ($nombre dio [$obtenidos])" ;;
        esac
    done

    # El extractor de producciones no debe dejar ni una linea de C: es con lo
    # que se compara la gramatica del documento.
    if command -v python3 >/dev/null 2>&1; then
        prod=$(python3 tools/producciones.py 2>&1)
        if [ $? -ne 0 ]; then
            falla "tools/producciones.py devolvio error"
            echo "$prod" | tail -5 | sed 's/^/        /'
        else
            n=$(echo "$prod" | grep -cE 'nodo_nuevo|agregar_hijo|diag_error|yyerror' || true)
            if [ "$n" -eq 0 ]; then ok "producciones.py extrae la gramatica sin codigo C"
            else falla "quedaron $n lineas de C en las producciones extraidas"; fi
        fi
    else
        nota "python3 no esta disponible; se omite el extractor"
    fi

    # Recuperacion de errores: varios errores sintacticos en una corrida.
    n=$($NOVAC test/errores/multi_mezcla.nv 2>&1 | grep -c 'error\[')
    if [ "$n" -ge 4 ]; then ok "la recuperacion en modo panico reporta $n errores de una vez"
    else falla "solo reporto $n errores: la recuperacion no esta avanzando"; fi
}

# ---------------------------------------------------------------- fase 3
d_fase3() {
    titulo "Fase 3: analisis semantico"
    existe_novac

    # Ningun programa valido debe producir errores ni advertencias.
    for f in test/factorial.nv test/ejemplos/*.nv; do
        [ -f "$f" ] || continue
        salida=$($NOVAC --sym "$f" 2>&1); rc=$?
        ne=$(echo "$salida" | grep -c 'error\[')
        na=$(echo "$salida" | grep -c 'advertencia\[')
        if [ $rc -eq 0 ] && [ "$ne" -eq 0 ] && [ "$na" -eq 0 ]; then
            ok "$(basename "$f") limpio"
        else
            falla "$(basename "$f"): rc=$rc, $ne errores, $na advertencias"
            echo "$salida" | grep 'error\[\|advertencia\[' | head -5 | sed 's/^/        /'
        fi
    done

    # La tabla de simbolos debe traer encabezado, direcciones y el resumen.
    salida=$($NOVAC --sym test/ejemplos/traza.nv 2>&1)
    case "$salida" in
        *"=== Tabla de simbolos ==="*) ok "--sym imprime la tabla" ;;
        *) falla "--sym no imprimio la tabla" ;;
    esac
    case "$salida" in
        *"R14-"*) ok "las variables locales tienen desplazamiento de R14" ;;
        *) falla "no se ven desplazamientos de R14 en la tabla" ;;
    esac
    case "$salida" in
        *"marco "*"B"*) ok "cada funcion reporta el tamano de su marco" ;;
        *) falla "falta el tamano del marco en la tabla" ;;
    esac
    case "$salida" in
        *"datos globales:"*"pila:"*) ok "el resumen de memoria de CERBERO sale completo" ;;
        *) falla "falta el resumen de memoria" ;;
    esac
    # integer[N][N] con N=3 debe resolverse a 36 bytes, no a 4.
    case "$salida" in
        *"integer[3][3]"*) ok "integer[N][N] se resolvio con la constante plegada" ;;
        *) falla "integer[N][N] no se resolvio: revise el plegado de constantes" ;;
    esac

    # Un error por codigo.
    for f in test/errores/E3*.nv test/errores/E4*.nv; do
        [ -f "$f" ] || continue
        nombre=$(basename "$f" .nv); codigo=${nombre%%_*}
        obtenidos=$($NOVAC "$f" 2>&1 | grep -o "error\[E[0-9]*\]" | sed 's/.*\[\(.*\)\]/\1/' | sort -u | tr '\n' ' ')
        case " $obtenidos " in
            *" $codigo "*) ok "$codigo se reporta" ;;
            *) falla "$codigo no aparecio ($nombre dio [$obtenidos])" ;;
        esac
    done

    # Una advertencia por codigo, y el programa debe seguir compilando.
    for f in test/advertencias/W*.nv; do
        [ -f "$f" ] || continue
        nombre=$(basename "$f" .nv); codigo=${nombre%%_*}
        salida=$($NOVAC "$f" 2>&1); rc=$?
        obtenidos=$(echo "$salida" | grep -o "advertencia\[W[0-9]*\]" | sed 's/.*\[\(.*\)\]/\1/' | sort -u | tr '\n' ' ')
        case " $obtenidos " in
            *" $codigo "*)
                [ $rc -eq 0 ] && ok "$codigo se reporta y no detiene la compilacion" \
                              || falla "$codigo detuvo la compilacion (rc=$rc)" ;;
            *) falla "$codigo no aparecio ($nombre dio [$obtenidos])" ;;
        esac
    done

    # La marca ^ debe caer sobre el identificador, no sobre la palabra reservada.
    salida=$($NOVAC test/errores/E309_falta_redde.nv 2>&1)
    col=$(echo "$salida" | sed -n '1s/.*nv:\([0-9]*\):\([0-9]*\):.*/\2/p')
    if [ "$col" = "9" ]; then ok "E309 apunta al nombre de la funcion (columna 9)"
    else falla "E309 apunta a la columna $col y deberia ser la 9 (el nombre)"; fi
}

# ---------------------------------------------------------------- cobertura
d_cobertura() {
    titulo "Cobertura"
    existe_novac

    # Todo token de la gramatica debe aparecer al menos una vez en el corpus.
    grep -o "TK_[A-Z_]*" fase2_sintactico/nova.tab.h | sort -u > .tmp_todos
    for f in test/*.nv test/ejemplos/*.nv; do
        [ -f "$f" ] || continue
        $NOVAC --tokens "$f" 2>/dev/null
    done | grep -o "TK_[A-Z_]*" | grep -v '^TK_EOF$' | sort -u > .tmp_vistos

    total=$(grep -c . .tmp_todos)
    vistos=$(grep -c . .tmp_vistos)
    faltan=$(comm -23 .tmp_todos .tmp_vistos | tr '\n' ' ')
    if [ -z "$faltan" ]; then ok "los $total tokens de la gramatica se ejercitan"
    else
        falla "$vistos de $total tokens ejercitados"
        nota "sin probar: $faltan"
    fi
    rm -f .tmp_todos .tmp_vistos

    # Todo codigo que el compilador puede emitir debe tener una prueba.
    grep -ho 'diag_error("E[0-9]*"\|diag_advertencia("W[0-9]*"' \
         fase1_lexico/nova.l fase2_sintactico/nova.y \
         fase3_semantico/semantic.c \
        | sed 's/.*("\(.*\)"/\1/' | sort -u > .tmp_emite
    ls test/errores/*.nv test/advertencias/*.nv 2>/dev/null \
        | sed 's|.*/||; s/_.*//; s/\.nv$//' | grep '^[EW][0-9]' | sort -u > .tmp_probados

    sin_prueba=$(comm -23 .tmp_emite .tmp_probados | tr '\n' ' ')
    if [ -z "$sin_prueba" ]; then
        ok "los $(grep -c . .tmp_emite) codigos que el compilador emite tienen prueba"
    else
        falla "codigos sin archivo de prueba: $sin_prueba"
    fi
    rm -f .tmp_emite .tmp_probados
}

# ---------------------------------------------------------------- memoria
d_memoria() {
    titulo "Memoria"

    # ASan + UBSan: detectan desbordes, uso despues de liberar y
    # comportamiento indefinido que -Wall no ve.
    make clean >/dev/null 2>&1
    if make CFLAGS="-Wall -Wextra -g -MMD -MP -fsanitize=address,undefined \
-fno-omit-frame-pointer -Ifase1_lexico -Ifase2_sintactico -Ifase3_semantico" \
        >/dev/null 2>&1; then
        ok "compila con -fsanitize=address,undefined"
        malos=0
        for f in test/factorial.nv test/ejemplos/*.nv test/errores/*.nv \
                 test/advertencias/*.nv; do
            [ -f "$f" ] || continue
            salida=$(ASAN_OPTIONS=detect_leaks=1 $NOVAC --sym "$f" 2>&1)
            case "$salida" in
                *"runtime error"*|*"AddressSanitizer"*|*"LeakSanitizer"*)
                    falla "sanitizer en $(basename "$f")"
                    echo "$salida" | grep -A3 'runtime error\|ERROR:' | head -6 | sed 's/^/        /'
                    malos=$((malos + 1)) ;;
            esac
        done
        [ "$malos" -eq 0 ] && ok "todo el corpus pasa los sanitizers sin hallazgos"
    else
        nota "los sanitizers no estan disponibles en este gcc; se omite"
    fi
    make clean >/dev/null 2>&1
    make >/dev/null 2>&1

    if command -v valgrind >/dev/null 2>&1; then
        malos=0
        for f in test/factorial.nv test/ejemplos/*.nv; do
            [ -f "$f" ] || continue
            if ! valgrind -q --error-exitcode=9 --leak-check=full \
                 --errors-for-leak-kinds=definite \
                 $NOVAC --sym "$f" >/dev/null 2>.tmp_vg; then
                falla "valgrind en $(basename "$f")"
                head -8 .tmp_vg | sed 's/^/        /'
                malos=$((malos + 1))
            fi
        done
        rm -f .tmp_vg
        [ "$malos" -eq 0 ] && ok "valgrind sin errores ni fugas definitivas"
    else
        nota "valgrind no esta instalado (sudo apt install valgrind); se omite"
    fi
}

# ---------------------------------------------------------------- robustez
d_robustez() {
    titulo "Robustez"
    existe_novac

    # El compilador puede rechazar lo que quiera, pero nunca caerse. Se le dan
    # todos los prefijos truncados de cada ejemplo, que es la forma mas rapida
    # de encontrar un AST a medias que la fase 3 no esperaba.
    caidas=0
    casos=0
    for f in test/factorial.nv test/ejemplos/*.nv; do
        [ -f "$f" ] || continue
        total=$(wc -l < "$f")
        i=1
        while [ "$i" -le "$total" ]; do
            head -n "$i" "$f" > .tmp_trunc.nv
            $NOVAC --sym .tmp_trunc.nv >/dev/null 2>&1
            rc=$?
            casos=$((casos + 1))
            # 0 ok, 1 errores, 2 uso, 3 E/S. Cualquier otro es una senal.
            if [ $rc -gt 3 ]; then
                falla "rc=$rc con las primeras $i lineas de $(basename "$f")"
                caidas=$((caidas + 1))
            fi
            i=$((i + 1))
        done
    done
    rm -f .tmp_trunc.nv
    [ "$caidas" -eq 0 ] && ok "$casos prefijos truncados, ninguna caida"

    # Entradas degeneradas.
    : > .tmp_vacio.nv
    $NOVAC .tmp_vacio.nv >/dev/null 2>&1
    [ $? -le 1 ] && ok "archivo vacio" || falla "archivo vacio dio rc=$?"

    printf '{{{{{{{{{{\n' > .tmp_basura.nv
    $NOVAC .tmp_basura.nv >/dev/null 2>&1
    [ $? -le 1 ] && ok "archivo de pura basura" || falla "basura dio rc=$?"

    # Anidamiento profundo: no debe desbordar la pila del compilador.
    { printf 'functio principale() -> integer {\n'
      i=0; while [ $i -lt 60 ]; do printf '  si (verum) {\n'; i=$((i+1)); done
      printf '  redde 0;\n'
      i=0; while [ $i -lt 60 ]; do printf '  }\n'; i=$((i+1)); done
      printf '  redde 0;\n}\n'; } > .tmp_profundo.nv
    $NOVAC --sym .tmp_profundo.nv >/dev/null 2>&1
    [ $? -le 1 ] && ok "60 niveles de si anidados" || falla "anidamiento profundo dio rc=$?"

    # Expresion muy larga.
    { printf 'functio principale() -> integer {\n  redde 1'
      i=0; while [ $i -lt 400 ]; do printf ' + 1'; i=$((i+1)); done
      printf ';\n}\n'; } > .tmp_larga.nv
    $NOVAC .tmp_larga.nv >/dev/null 2>&1
    [ $? -le 1 ] && ok "expresion de 400 terminos" || falla "expresion larga dio rc=$?"

    rm -f .tmp_vacio.nv .tmp_basura.nv .tmp_profundo.nv .tmp_larga.nv
}

# ---------------------------------------------------------------- opciones
d_opciones() {
    titulo "Banderas y codigos de salida"
    existe_novac

    $NOVAC --help >/dev/null 2>&1
    [ $? -eq 0 ] && ok "--help devuelve 0" || falla "--help devolvio $?"

    $NOVAC --version >/dev/null 2>&1
    [ $? -eq 0 ] && ok "--version devuelve 0" || falla "--version devolvio $?"

    $NOVAC >/dev/null 2>&1
    [ $? -eq 2 ] && ok "sin argumentos devuelve 2 (error de uso)" || falla "sin argumentos devolvio $?"

    $NOVAC /no/existe.nv >/dev/null 2>&1
    [ $? -eq 3 ] && ok "archivo inexistente devuelve 3" || falla "archivo inexistente devolvio $?"

    $NOVAC test/factorial.nv >/dev/null 2>&1
    [ $? -eq 0 ] && ok "programa valido devuelve 0" || falla "programa valido devolvio $?"

    $NOVAC test/errores/E301_no_declarado.nv >/dev/null 2>&1
    [ $? -eq 1 ] && ok "programa con errores devuelve 1" || falla "programa con errores devolvio $?"

    $NOVAC --max-errors 0 test/errores/multi_mezcla.nv >/dev/null 2>&1
    [ $? -eq 2 ] && ok "--max-errors 0 es error de uso" || falla "--max-errors 0 devolvio $?"

    n=$($NOVAC --max-errors 2 test/errores/multi_mezcla.nv 2>&1 | grep -c 'error\[')
    [ "$n" -eq 2 ] && ok "--max-errors 2 corta en 2 errores" || falla "--max-errors 2 mostro $n"

    # -o debe escribir a archivo y no a pantalla.
    $NOVAC -t -o .tmp_ast.txt test/factorial.nv >/dev/null 2>&1
    if [ -s .tmp_ast.txt ] && grep -q "Programa" .tmp_ast.txt; then
        ok "-o escribe el AST al archivo"
    else
        falla "-o no escribio el AST"
    fi
    rm -f .tmp_ast.txt

    # Los diagnosticos van a stderr, no a stdout: asi se pueden filtrar.
    salida=$($NOVAC test/errores/E301_no_declarado.nv 2>/dev/null)
    if [ -z "$salida" ]; then ok "los diagnosticos salen por stderr"
    else falla "hay diagnosticos en stdout"; fi

    # Una compilacion exitosa es silenciosa; -v debe nombrar las tres fases.
    salida=$($NOVAC test/factorial.nv 2>&1)
    if [ -z "$salida" ]; then ok "una compilacion limpia no imprime nada"
    else falla "una compilacion limpia imprimio algo"; echo "$salida" | sed 's/^/        /'; fi

    salida=$($NOVAC -v test/factorial.nv 2>&1)
    faltan=""
    for fase in "Fase 1" "Fase 2" "Fase 3"; do
        case "$salida" in *"$fase"*) ;; *) faltan="$faltan $fase" ;; esac
    done
    if [ -z "$faltan" ]; then ok "-v nombra las tres fases"
    else falla "-v no menciona:$faltan"; fi

    # Un programa con advertencias compila y debe decir cuantas hubo.
    salida=$($NOVAC test/advertencias/W001_variable_sin_usar.nv 2>&1); rc=$?
    case "$salida" in
        *"compilacion terminada: 1 advertencia"*)
            [ $rc -eq 0 ] && ok "resume las advertencias sin abortar" \
                          || falla "el resumen de advertencias dio rc=$rc" ;;
        *) falla "no se resumieron las advertencias"; echo "$salida" | sed 's/^/        /' ;;
    esac

    # Y con errores debe decir abortada, no terminada.
    salida=$($NOVAC test/errores/E301_no_declarado.nv 2>&1)
    case "$salida" in
        *"compilacion abortada: 1 error"*) ok "resume los errores como 'abortada'" ;;
        *) falla "el resumen de errores no tiene la forma esperada" ;;
    esac
}

# ---------------------------------------------------------------- principal
objetivo=${1:-todo}
case "$objetivo" in
    build)     d_build ;;
    fase1)     d_fase1 ;;
    fase2)     d_fase2 ;;
    fase3)     d_fase3 ;;
    cobertura) d_cobertura ;;
    memoria)   d_memoria ;;
    robustez)  d_robustez ;;
    opciones)  d_opciones ;;
    todo)
        d_build; d_fase1; d_fase2; d_fase3
        d_cobertura; d_opciones; d_robustez; d_memoria ;;
    *)
        echo "objetivo desconocido: $objetivo"
        echo "use: build fase1 fase2 fase3 cobertura memoria robustez opciones todo"
        exit 2 ;;
esac

printf '\n==================================================\n'
if [ "$FALLOS" -eq 0 ]; then
    echo "todo en orden"
    exit 0
else
    echo "$FALLOS verificaciones fallidas"
    exit 1
fi
