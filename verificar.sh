#!/bin/sh
# verificar.sh -- prueba exhaustiva del compilador Nova, fase 4.
#
#   sh verificar.sh            # todo
#   sh verificar.sh 5          # solo el bloque 5
#
# Imprime un informe compacto y determinista: la misma version del proyecto
# tiene que dar exactamente la misma salida en cualquier maquina. Si algo no
# coincide, la diferencia senala el problema.

NOVAC=./novac
SOLO=${1:-}
T=${TMPDIR:-/tmp}/nova_verif_$$
mkdir -p "$T"
trap 'rm -rf "$T"' 0 2 15

bloque() {
    [ -z "$SOLO" ] || [ "$SOLO" = "$1" ] || return 1
    printf '\n========== %s. %s ==========\n' "$1" "$2"
    return 0
}

# --------------------------------------------------------------------------
if bloque 1 "Construccion desde cero"; then
    make clean >/dev/null 2>&1
    salida=$(make 2>&1)
    echo "$salida" | grep -E 'warning|error|Error'
    echo "advertencias de gcc: $(echo "$salida" | grep -c warning)"
    echo "errores de gcc:      $(echo "$salida" | grep -c 'error:')"
    [ -x $NOVAC ] && echo "novac: construido" || echo "novac: NO SE CONSTRUYO"
    $NOVAC --version
fi

# --------------------------------------------------------------------------
if bloque 2 "Las dos baterias completas"; then
    make prueba 2>&1 | tail -1
    r=$(make depurar F=todo 2>&1)
    echo "$r" | grep -E '^  FALLA'
    echo "verificaciones ok: $(echo "$r" | grep -c '^  ok')"
    echo "$r" | grep -E 'todo en orden|fallidas'
fi

# --------------------------------------------------------------------------
if bloque 3 "Cada objetivo de depuracion por separado"; then
    for f in build fase1 fase2 fase3 fase4 cobertura opciones robustez memoria; do
        r=$(make depurar F=$f 2>&1)
        printf '%-10s %2d ok, %d fallas\n' "$f" \
            "$(echo "$r" | grep -c '^  ok')" "$(echo "$r" | grep -c '^  FALLA')"
    done
fi

# --------------------------------------------------------------------------
if bloque 4 "Las cuatro fases sobre factorial.nv"; then
    echo "[1] $($NOVAC --tokens test/factorial.nv 2>&1 | grep -- '-- .* tokens --')"
    echo "[2] lineas del AST:    $($NOVAC -t test/factorial.nv 2>/dev/null | grep -c .)"
    echo "[3] simbolos:          $($NOVAC --sym test/factorial.nv 2>/dev/null | sed -n '/^---/,/^---/p' | grep -cvE '^---')"
    echo "[3] $($NOVAC --sym test/factorial.nv 2>/dev/null | tail -1)"
    echo "[4] lineas de TAC:     $($NOVAC --ir test/factorial.nv 2>/dev/null | grep -c .)"
    echo "[4] bundles emitidos:  $($NOVAC -s test/factorial.nv 2>/dev/null | grep ';$' | grep -vc '^ *//')"
fi

# --------------------------------------------------------------------------
if bloque 5 "El ejecutable binario y su encabezado"; then
    # Se oculta la ruta temporal, que cambia en cada corrida, para que el
    # informe sea comparable entre maquinas.
    $NOVAC -v test/factorial.nv -o "$T/factorial" 2>&1 | tail -2 | sed "s|$T/||"
    echo "tamano: $(wc -c < "$T/factorial") bytes"
    od -A d -t x1 -N 48 "$T/factorial"
    python3 - "$T/factorial" <<'PY'
import sys
d = open(sys.argv[1],'rb').read()
u = lambda o: int.from_bytes(d[o:o+4], 'little')
campos = [("magia", d[:4].decode()), ("version", int.from_bytes(d[4:6],'little')),
          ("n_bundles", u(8)), ("codigo_org", "0x%04X" % u(12)),
          ("entrada", "0x%04X" % u(16)), ("datos_org", "0x%04X" % u(20)),
          ("datos_init", u(24)), ("datos_cero", u(28)),
          ("pila_tope", "0x%04X" % u(32)), ("suma", "0x%08X" % u(36))]
for k, v in campos:
    print("  %-11s %s" % (k, v))
esperado = 48 + u(8)*16 + u(24)
print("  48 + %d*16 + %d = %d, el archivo mide %d -> %s"
      % (u(8), u(24), esperado, len(d),
         "cuadra" if esperado == len(d) else "NO CUADRA"))
PY
fi

# --------------------------------------------------------------------------
if bloque 6 "Todo el corpus: ensamblador contra binario"; then
    for f in test/factorial.nv test/ejemplos/*.nv test/ejecucion/*.nv; do
        [ -f "$f" ] || continue
        n=$(basename "$f" .nv)
        $NOVAC -s "$f" > "$T/p.s" 2>/dev/null
        if ! $NOVAC "$f" -o "$T/p.exe" 2>"$T/p.err"; then
            printf '%-18s pendiente de enlazar: %s\n' "$n" \
                "$(sed -n 's/.*\(error\[E[0-9]*\]\).*/\1/p' "$T/p.err" | head -1)"
            continue
        fi
        a=$(python3 tools/simular.py "$T/p.s"   2>&1 | grep -E 'ejecutados|zona|R6|pila')
        b=$(python3 tools/simular.py "$T/p.exe" 2>&1 | grep -E 'ejecutados|zona|R6|pila')
        [ "$a" = "$b" ] && e="IGUAL  " || e="DIFIERE"
        printf '%-18s %s %s\n' "$n" "$e" "$(echo "$a" | grep 'zona')"
    done
fi

# --------------------------------------------------------------------------
if bloque 7 "Errores de ejecucion y recursividad de cola"; then
    for n in rango div_cero boveda cola; do
        $NOVAC -s test/ejecucion/$n.nv > "$T/e.s" 2>/dev/null
        r=$(python3 tools/simular.py "$T/e.s" 2>&1)
        printf '%-9s %s | %s\n' "$n" \
            "$(echo "$r" | grep 'R6')" "$(echo "$r" | grep 'pila:')"
    done
    echo
    echo "la misma funcion de cola, sin @cauda:"
    sed '/@cauda/d' test/ejecucion/cola.nv > "$T/sin.nv"
    $NOVAC -s "$T/sin.nv" > "$T/sin.s" 2>/dev/null
    python3 tools/simular.py "$T/sin.s" 2>&1 | grep -E 'zona|pila:'
fi

# --------------------------------------------------------------------------
if bloque 8 "Un binario alterado debe ser rechazado"; then
    $NOVAC test/factorial.nv -o "$T/alt.exe" 2>/dev/null
    python3 - "$T/alt.exe" <<'PY'
import sys
d = bytearray(open(sys.argv[1],'rb').read())
d[60] ^= 0xFF          # un bit del codigo, despues del encabezado
open(sys.argv[1],'wb').write(d)
PY
    python3 tools/simular.py "$T/alt.exe" 2>&1
fi

# --------------------------------------------------------------------------
if bloque 9 "Banderas y codigos de salida"; then
    p() { printf '%-38s rc=%s\n' "$1" "$2"; }
    $NOVAC --help >/dev/null 2>&1;                       p "--help (0)" $?
    $NOVAC --version >/dev/null 2>&1;                    p "--version (0)" $?
    $NOVAC >/dev/null 2>&1;                              p "sin argumentos (2)" $?
    $NOVAC /no/existe.nv >/dev/null 2>&1;                p "archivo inexistente (3)" $?
    $NOVAC test/factorial.nv -o "$T/x" >/dev/null 2>&1;  p "programa valido (0)" $?
    $NOVAC test/errores/E301_no_declarado.nv >/dev/null 2>&1; p "con errores (1)" $?
    $NOVAC -c test/factorial.nv >/dev/null 2>&1;         p "-c, del enlazador (2)" $?
    $NOVAC test/factorial.nv test/ejemplos/matriz.nv >/dev/null 2>&1; p "dos fuentes (2)" $?
    $NOVAC -Wloquesea test/factorial.nv >/dev/null 2>&1; p "-W desconocida (2)" $?
    $NOVAC --max-errors 0 test/errores/multi_mezcla.nv >/dev/null 2>&1; p "--max-errors 0 (2)" $?
    echo
    W=test/advertencias/W001_variable_sin_usar.nv
    for b in "" "-Wall" "-w" "-Wno-W001"; do
        printf '%-12s %d advertencia(s)\n' "${b:-sin bandera}" \
            "$($NOVAC $b $W -o "$T/x" 2>&1 | grep -c 'W001')"
    done
    rm -f "$T/werr"
    $NOVAC -Werror $W -o "$T/werr" >/dev/null 2>&1
    printf '%-12s rc=%d, deja ejecutable: %s\n' "-Werror" $? \
        "$([ -f "$T/werr" ] && echo si || echo no)"
    $NOVAC -Werror $W 2>&1 | head -1
    echo
    raiz=$(pwd)
    cp test/factorial.nv "$T/factorial.nv"
    ( cd "$T" && "$raiz/novac" factorial.nv >/dev/null 2>&1 )
    echo "sin -o, el ejecutable se llama: $(cd "$T" && ls factorial 2>/dev/null || echo 'NO SE CREO')"
fi

# --------------------------------------------------------------------------
if bloque 10 "Cada codigo de error y advertencia"; then
    mal=0; n=0
    for f in test/errores/*.nv; do
        esp=$(basename "$f" | sed 's/_.*//')
        case "$esp" in multi*) continue ;; esac
        n=$((n + 1))
        $NOVAC "$f" 2>&1 | grep -q "error\[$esp\]" || {
            echo "  $esp NO se reporto en $(basename "$f")"; mal=$((mal + 1)); }
    done
    for f in test/advertencias/*.nv; do
        esp=$(basename "$f" | sed 's/_.*//')
        n=$((n + 1))
        $NOVAC "$f" -o "$T/x" 2>&1 | grep -q "advertencia\[$esp\]" || {
            echo "  $esp NO se reporto"; mal=$((mal + 1)); }
    done
    rm -f "$T/x"
    echo "codigos con archivo de prueba: $n (+ E410, interno), fallaron: $mal"
    echo
    echo "varios errores en una sola corrida:"
    $NOVAC test/errores/multi_mezcla.nv 2>&1 | tail -1
fi

# --------------------------------------------------------------------------
if bloque 11 "Memoria: sanitizers y valgrind"; then
    if command -v valgrind >/dev/null 2>&1; then
        mal=0
        for f in test/factorial.nv test/ejemplos/*.nv test/ejecucion/*.nv; do
            [ -f "$f" ] || continue
            valgrind -q --error-exitcode=9 --leak-check=full \
                --errors-for-leak-kinds=definite \
                $NOVAC --sym --ir -s "$f" >/dev/null 2>"$T/vg" || {
                echo "  valgrind en $(basename "$f"):"; head -5 "$T/vg" | sed 's/^/    /'
                mal=$((mal + 1)); }
        done
        echo "valgrind sobre los 16 programas: $mal con hallazgos"
    else
        echo "valgrind no esta instalado; lo cubre 'make depurar F=memoria'"
    fi
fi

printf '\n========== fin ==========\n'
rm -rf "$T"
