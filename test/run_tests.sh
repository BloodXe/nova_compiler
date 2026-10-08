#!/bin/sh
# Suite de pruebas de las fases 1, 2 y 3.
#   Uso: sh test/run_tests.sh [./novac]
#
# 1. Todo test/*.nv y test/ejemplos/*.nv debe analizarse sin errores (rc 0) y
#    sin advertencias: son los programas de referencia.
# 2. Cada test/errores/E###_*.nv debe fallar (rc 1) con el codigo del nombre.
# 3. Los test/errores/multi_*.nv reportan varios errores en una sola corrida: la
#    primera linea ("# espera: E201 E202 ...") lista los codigos, en orden.
# 4. Cada test/advertencias/W###_*.nv debe compilar (rc 0) y emitir su codigo.
# 5. --tokens (test/lexico), --sym, --max-errors y el resumen final.

NOVAC=${1:-./novac}
DIR=$(dirname "$0")
PASS=0
FAIL=0

ok()  { PASS=$((PASS + 1)); }
bad() { FAIL=$((FAIL + 1)); echo "FALLO: $1"; [ -n "$2" ] && echo "$2" | head -8 | sed 's/^/    /'; }

[ -x "$NOVAC" ] || { echo "no existe el ejecutable $NOVAC (corra 'make' primero)"; exit 2; }

# 1. archivos validos --------------------------------------------------------
for f in "$DIR"/*.nv "$DIR"/ejemplos/*.nv; do
    [ -f "$f" ] || continue
    out=$("$NOVAC" "$f" 2>&1); rc=$?
    if [ $rc -eq 0 ]; then ok; else bad "$f deberia analizarse sin errores (rc=$rc)" "$out"; fi
    out=$("$NOVAC" --tokens "$f" 2>&1); rc=$?
    if [ $rc -eq 0 ]; then ok; else bad "$f --tokens deberia terminar sin errores (rc=$rc)" "$out"; fi
    out=$("$NOVAC" -t "$f" 2>&1); rc=$?
    if [ $rc -eq 0 ]; then ok; else bad "$f -t deberia terminar sin errores (rc=$rc)" "$out"; fi
    # Fase 3: ninguno de los programas de referencia debe producir advertencias.
    out=$("$NOVAC" --sym "$f" 2>&1); rc=$?
    n=$(echo "$out" | grep -c 'advertencia\[')
    if [ $rc -eq 0 ] && [ "$n" -eq 0 ]; then ok; else
        bad "$f --sym deberia compilar sin advertencias (rc=$rc, advertencias=$n)" "$out"; fi
    # La tabla de simbolos debe salir con el encabezado y el resumen de memoria.
    case "$out" in
        *"=== Tabla de simbolos ==="*"datos globales:"*) ok ;;
        *) bad "$f --sym no imprimio la tabla de simbolos completa" "$out" ;;
    esac
done

# 2 y 3. archivos con errores ------------------------------------------------------
for f in "$DIR"/errores/*.nv; do
    [ -f "$f" ] || continue
    nombre=$(basename "$f" .nv)
    out=$("$NOVAC" "$f" 2>&1); rc=$?
    if [ $rc -ne 1 ]; then bad "$nombre: se esperaba rc=1 y fue rc=$rc" "$out"; continue; fi
    obtenidos=$(echo "$out" | grep -o 'error\[E[0-9]*\]' | sed 's/error\[\(.*\)\]/\1/' | tr '\n' ' ')
    primera=$(head -1 "$f")
    case "$primera" in
        "# espera:"*)
            esperados="$(echo "${primera#\# espera:}" | tr -s ' ' | sed 's/^ //; s/ *$//') "
            if [ "$obtenidos" = "$esperados" ]; then ok; else
                bad "$nombre: codigos esperados [$esperados] obtenidos [$obtenidos]" "$out"; fi ;;
        *)
            codigo=${nombre%%_*}
            case " $obtenidos" in
                *" $codigo "*) ok ;;
                *) bad "$nombre: se esperaba $codigo y se obtuvo [$obtenidos]" "$out" ;;
            esac ;;
    esac
done

# 4. advertencias -----------------------------------------------------------
# Compilan bien (rc 0) pero deben emitir el codigo W del nombre del archivo.
for f in "$DIR"/advertencias/*.nv; do
    [ -f "$f" ] || continue
    nombre=$(basename "$f" .nv)
    out=$("$NOVAC" "$f" 2>&1); rc=$?
    if [ $rc -ne 0 ]; then bad "$nombre: se esperaba rc=0 y fue rc=$rc" "$out"; continue; fi
    codigo=${nombre%%_*}
    obtenidos=$(echo "$out" | grep -o 'advertencia\[W[0-9]*\]' | sed 's/advertencia\[\(.*\)\]/\1/' | tr '\n' ' ')
    case " $obtenidos" in
        *" $codigo "*) ok ;;
        *) bad "$nombre: se esperaba $codigo y se obtuvo [$obtenidos]" "$out" ;;
    esac
done

# 5. opciones y resumen --------------------------------------------------------------
multi="$DIR/errores/multi_mezcla.nv"
out=$("$NOVAC" --max-errors 2 "$multi" 2>&1); rc=$?
n=$(echo "$out" | grep -c 'error\[')
if [ $rc -eq 1 ] && [ "$n" -eq 2 ]; then ok; else bad "--max-errors 2 deberia mostrar exactamente 2 errores (rc=$rc, errores=$n)" "$out"; fi

out=$("$NOVAC" --max-errors 0 "$multi" 2>&1); rc=$?
if [ $rc -eq 2 ]; then ok; else bad "--max-errors 0 deberia ser error de uso (rc=$rc)" "$out"; fi

out=$("$NOVAC" "$multi" 2>&1)
case "$out" in
    *"compilacion abortada: 6 errores (2 lexicos, 4 sintacticos)"*) ok ;;
    *) bad "el resumen final no tiene el desglose esperado" "$out" ;;
esac

out=$("$NOVAC" --tokens "$DIR/lexico/multi_lexicos.nv" 2>&1); rc=$?
n=$(echo "$out" | grep -c 'error\[')
if [ $rc -eq 1 ] && [ "$n" -eq 5 ]; then ok; else bad "--tokens deberia reportar los 5 errores lexicos (rc=$rc, errores=$n)" "$out"; fi

"$NOVAC" /no/existe.nv >/dev/null 2>&1; rc=$?
if [ $rc -eq 3 ]; then ok; else bad "archivo inexistente deberia dar rc=3 (rc=$rc)"; fi

"$NOVAC" >/dev/null 2>&1; rc=$?
if [ $rc -eq 2 ]; then ok; else bad "sin argumentos deberia dar rc=2 (rc=$rc)"; fi

# un hexadecimal con letras ya no da un E105 falso
printf 'constans A : integer = 0xDEADBEEF;\n' > "$DIR/.hex.tmp.nv"
out=$("$NOVAC" -t "$DIR/.hex.tmp.nv" 2>&1); rc=$?
rm -f "$DIR/.hex.tmp.nv"
case "$out" in
    *"Entero -559038737"*) [ $rc -eq 0 ] && ok || bad "0xDEADBEEF rc=$rc" "$out" ;;
    *) bad "0xDEADBEEF deberia valer -559038737 (integer de 32 bits con signo)" "$out" ;;
esac

echo
echo "pruebas: $PASS correctas, $FAIL fallidas"
[ "$FAIL" -eq 0 ]
