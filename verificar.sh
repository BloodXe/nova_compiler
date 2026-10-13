#!/bin/sh
# verificar.sh -- prueba exhaustiva del compilador Nova, fases 1 a 4.
#
#   sh verificar.sh            # todo
#   sh verificar.sh 5          # solo el bloque 5
#
# Los bloques 12 a 14 contrastan contra el proyecto de CE4301. Si el
# ensamblador de ellos no esta en una ruta vecina, se le pasa asi:
#
#   CERBERO_ASM=/ruta/a/cerbero/tools/cerbero_asm.py sh verificar.sh
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
    for f in build fase1 fase2 fase3 fase4 cerbero cobertura opciones robustez memoria; do
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


# --------------------------------------------------------------------------
# Localiza el ensamblador de CERBERO para los bloques 12 a 14.
ASM=${CERBERO_ASM:-}
if [ -z "$ASM" ]; then
    for c in ../cerbero/tools/cerbero_asm.py ../../cerbero/tools/cerbero_asm.py \
             ../cerbero/cerbero/tools/cerbero_asm.py \
             ../../cerbero/cerbero/tools/cerbero_asm.py; do
        [ -f "$c" ] && ASM=$c && break
    done
fi

# --------------------------------------------------------------------------
if bloque 12 "Contraste con el ensamblador de CERBERO"; then
    if [ -z "$ASM" ] || [ ! -f "$ASM" ]; then
        echo "no se encontro cerbero_asm.py"
        echo "pase la ruta asi:  CERBERO_ASM=/ruta/a/cerbero_asm.py sh verificar.sh"
    else
        echo "usando $ASM"
        echo
        ig=0; di=0; pe=0
        for f in test/factorial.nv test/ejemplos/*.nv test/ejecucion/*.nv; do
            [ -f "$f" ] || continue
            n=$(basename "$f" .nv)
            $NOVAC -s "$f" > "$T/c.s" 2>/dev/null || continue
            if ! python3 "$ASM" "$T/c.s" -o "$T/c.hex" > "$T/c.err" 2>&1; then
                case "$(cat "$T/c.err")" in
                    *'inmediato mal formado'*'$'*)
                        printf '%-18s espera al enlazador (importa otro modulo)\n' "$n"
                        pe=$((pe + 1)) ;;
                    *)  printf '%-18s RECHAZADO: %s\n' "$n" \
                            "$(head -1 "$T/c.err" | cut -c1-80)"
                        di=$((di + 1)) ;;
                esac
                continue
            fi
            $NOVAC "$f" -o "$T/c.bin" 2>/dev/null || continue
            if python3 - "$T/c.bin" "$T/c.hex" <<'PY'
import sys
d = open(sys.argv[1], 'rb').read()
u = lambda o: int.from_bytes(d[o:o+4], 'little')
n = u(8)
nova = [(u(48+b*16+12) << 96) | (u(48+b*16+8) << 64) |
        (u(48+b*16+4) << 32) | u(48+b*16) for b in range(n)]
suyo = [int(l.strip(), 16) for l in open(sys.argv[2]) if l.strip()]
sys.exit(0 if nova == suyo else 1)
PY
            then printf '%-18s IDENTICO bit a bit   %5s bundles\n' "$n" \
                     "$(grep -c . "$T/c.hex")"; ig=$((ig + 1))
            else printf '%-18s LOS BITS NO COINCIDEN\n' "$n"; di=$((di + 1)); fi
        done
        echo
        echo "identicos: $ig, distintos: $di, pendientes de enlazar: $pe"
    fi
fi

# --------------------------------------------------------------------------
if bloque 13 "Las correcciones de alineacion, una por una"; then
    v() { printf '  %-46s %s\n' "$1" "$2"; }

    # 1. MOVH es tipo U: 16 bits altos, inmediato en [18:3]
    $NOVAC -s test/ejemplos/bits_y_hex.nv > "$T/h.s" 2>/dev/null
    lo=$(grep -c 'movi r10, #48879' "$T/h.s")
    hi=$(grep -c 'movh r10, #57005' "$T/h.s")
    [ "$lo" -ge 1 ] && [ "$hi" -ge 1 ] \
        && v "1. 0xDEADBEEF se parte en 16 y 16" "movi #48879 + movh #57005" \
        || v "1. 0xDEADBEEF se parte en 16 y 16" "NO"

    # 2. AUTHW lleva widx en [10:9]
    cat > "$T/a.s" <<'EOF'
.text
    .org 0x0000
i:
    - | - | - | authw #3, r4 | - ;
    - | - | - | - | halt ;
    - | - | - | - | - ;
EOF
    if [ -n "$ASM" ] && [ -f "$ASM" ]; then
        python3 "$ASM" "$T/a.s" -o "$T/a.hex" >/dev/null 2>&1
        s3=$(python3 -c "print('0x%04X' % ((int(open('$T/a.hex').readline().strip(),16)>>16)&0xFFFF))")
        [ "$s3" = "0x8680" ] && v "2. authw #3, r4" "$s3, igual que cerbero_asm" \
                             || v "2. authw #3, r4" "$s3, se esperaba 0x8680"
    else
        v "2. authw #3, r4" "hace falta cerbero_asm"
    fi

    # 3. La boveda vive en la region segura
    $NOVAC -s test/advertencias/W008_region_segura_llena.nv > "$T/s.s" 2>/dev/null
    grep -q '\.org 0x7000' "$T/s.s" && grep -q '\.secure' "$T/s.s" \
        && v "3. el bloque de boveda se ancla en 0x7000" "con .secure y .endsecure" \
        || v "3. el bloque de boveda se ancla en 0x7000" "NO"
    if $NOVAC test/advertencias/W008_region_segura_llena.nv -o "$T/s.bin" 2>&1 \
         | grep -q 'advertencia\[W008\]'
    then v "4. W008 avisa si el bloque seguro no cabe" "si"
    else v "4. W008 avisa si el bloque seguro no cabe" "NO"; fi

    # 5. movi con signo
    grep -q 'movi r10, #376559' "$T/h.s" \
        && v "5. el inmediato de movi va con signo" "NO: sigue sin signo" \
        || v "5. el inmediato de movi va con signo" "si"

    # 6. sintaxis de la boveda y .byte
    grep -q 'ksetw k0,' "$T/s.s" && grep -q 'f4e p0, k0,' "$T/s.s" \
        && v "6. la ranura se escribe k0..k3" "ksetw k0 y f4e p0, k0" \
        || v "6. la ranura se escribe k0..k3" "NO"
    $NOVAC -s test/ejemplos/saludo.nv > "$T/t.s" 2>/dev/null
    grep -q '\.byte' "$T/t.s" && ! grep -q '\.ascii\|\.align' "$T/t.s" \
        && v "7. las cadenas salen con .byte" "sin .ascii ni .align" \
        || v "7. las cadenas salen con .byte" "NO"
    grep -q '#__str0\|#&' "$T/t.s" \
        && v "8. no quedan etiquetas como inmediato" "NO: aun hay" \
        || v "8. no quedan etiquetas como inmediato" "resueltas a numero"

    # 9. la division renombrada
    $NOVAC -s test/ejecucion/div_cero.nv > "$T/d.s" 2>/dev/null
    grep -q '__nova_div32' "$T/d.s" && ! grep -q 'jal.al __div32' "$T/d.s" \
        && v "9. la division se llama __nova_div32" "sin chocar con la de CERBERO" \
        || v "9. la division se llama __nova_div32" "NO"
fi

# --------------------------------------------------------------------------
if bloque 14 "Las reglas temporales del ISA"; then
    python3 - <<'PY'
import glob, subprocess, os, re
S = ('br.', 'jal.', 'jr.', 'jalr.', 'halt')
ds = sin = r15 = 0
peor = 99
arch = ['test/factorial.nv'] + sorted(glob.glob('test/ejemplos/*.nv'))      + sorted(glob.glob('test/ejecucion/*.nv'))
n = 0
for f in arch:
    if subprocess.run(['./novac', '-s', f, '-o', '/tmp/_v.s'],
                      capture_output=True).returncode:
        continue
    n += 1
    bl = [[c.strip() for c in l.strip()[:-1].split('|')] for l in open('/tmp/_v.s')
          if l.strip().endswith(';') and not l.strip().startswith('//')]
    s4 = [b[4] for b in bl]
    for i, a in enumerate(s4):
        if any(a.startswith(p) for p in S):
            if i + 1 >= len(s4):
                sin += 1
            elif any(s4[i+1].startswith(p) for p in S):
                ds += 1
    ult = None
    for i, b in enumerate(bl):
        if b[4].startswith('jal'):
            ult = i
        for sl in b:
            if re.search('(^|[ ,(])r15([ ,)]|$)', sl) and not sl.startswith('jal') and ult is not None:
                peor = min(peor, i - ult)
                if i - ult < 3:
                    r15 += 1
os.path.exists('/tmp/_v.s') and os.remove('/tmp/_v.s')
print("  %d programas revisados" % n)
print("  saltos dentro de un delay slot (v1.2 lo prohibe):      %d" % ds)
print("  saltos sin su delay slot, halt incluido (v1.2):        %d" % sin)
print("  lecturas de r15 antes de 3 bundles del jal:            %d" % r15)
print("  separacion minima medida entre un jal y leer r15:      %d bundles" % peor)
PY
fi

printf '\n========== fin ==========\n'
rm -rf "$T"
