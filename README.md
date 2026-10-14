# Nova Compiler

Compilador del lenguaje Nova para la arquitectura VLIW CERBERO. El flujo
implementa análisis léxico, sintáctico, semántico y generación de TAC; traduce
el TAC a ensamblador de cinco slots; resuelve etiquetas y saltos; y genera un
ejecutable binario con bundles CERBERO y datos inicializados.

Este directorio es la raíz del proyecto del compilador para la entrega. El
procesador correspondiente está en [ARQUITECTURA](ARQUITECTURA/), separado
para que el compilador y la arquitectura queden claramente identificados.

La carpeta [documentacion](documentacion/) contiene únicamente documentos
Markdown y PDF. Los ejercicios, listados, evidencias e imágenes están separados
en sus respectivas carpetas en la raíz.

Para una explicación paso a paso del flujo del compilador, la memoria, la
pila, las direcciones, los saltos y cómo demostrar la ejecución sobre el RTL,
consulta la [guía para defender el proyecto](documentacion/GUIA_DEFENSA_COMPILADOR.md).

## Requisitos

- GCC, Flex, Bison y Make.
- Para probar en el RTL: Icarus Verilog (`iverilog` y `vvp`). El RTL CERBERO
  está en `ARQUITECTURA/src/cpu`.

En Ubuntu o WSL:

```bash
sudo apt update
sudo apt install -y build-essential flex bison make iverilog
```

## Compilar y probar

Desde la raíz de este proyecto:

```bash
make
make prueba
make prueba-rtl
```

`make prueba` ejecuta las pruebas léxicas, sintácticas, semánticas,
diagnósticos y generación. `make prueba-rtl` compila y ejecuta en el procesador
CERBERO RTL:

Para generar todas las representaciones del fuente [prueba.nv](prueba.nv) en
la raíz, ejecutar `make generar`. Se muestra la tabla de símbolos, el AST y el
código intermedio; además se crean
`prueba.ast.txt`, `prueba.svg`, `prueba.tabla.txt`, `prueba.ir.txt`,
`prueba.asm`, `prueba.nvx`, `prueba.paquetes.txt`, `prueba.imem.hex` y
`prueba.dmem.hex`. Los dos archivos `.hex` son las imágenes que se cargan en el
procesador CERBERO. Para usar otro fuente se puede indicar
`make generar FUENTE_PRUEBA=ruta/programa.nv`. `make clean` elimina estos
artefactos, pero conserva `prueba.nv`.

Para ejecutar el programa en el RTL real del procesador y ver los ciclos,
el retorno en R6 y los valores de `scribe` leídos directamente de la memoria de
datos RTL, usa:

```bash
make ejecutar-prueba
```

El programa actual devuelve 720 y escribe 6 con `scribe`. Si se modifica
`prueba.nv`, indica el retorno esperado con `make ejecutar-prueba RESULTADO_ESPERADO=valor`;
el testbench compara el valor observado en R6 con ese resultado y reporta un
error si no coincide. También se puede usar
`make ejecutar-prueba FUENTE_PRUEBA=ruta/programa.nv` para ejecutar otro fuente
con el mismo flujo.

- Suma simple `10 + 15` (R6=25).
- Módulos fuente anidados y enlace de un objeto `.nvo` (R6=175).
- Llenado de matriz con `for` y suma de sus elementos (R6=138).
- Llenado de una matriz de 10×100 (1000 enteros), búsqueda del máximo y
  resultado 5000 en R6.
- Transposición de una matriz 3×2 a 2×3 y comprobación de elementos (R6=2122).
- Producto punto de dos arreglos pasados por referencia a una función (R6=182).
- Multiplicación de matrices 2×3 por 3×2 con tres bucles anidados (R6=415).
- Una ronda Feistel F4E y su inversa F4D, autenticadas y comprobadas contra
  vectores conocidos; también se comprueba el cierre automático de la sesión
  de la bóveda (R6=0).

`make depurar F=todo` ejecuta además las verificaciones extendidas, incluida la
comparación de codificación con el ensamblador independiente de CERBERO.

Las pruebas nuevas se pueden ejecutar por separado con
`make prueba-rtl-transpuesta` y `make prueba-rtl-producto-punto`; ambas también
se incluyen en `make prueba-rtl`.

La matriz grande se puede probar aisladamente con
`make prueba-rtl-matriz-1000`. Tiene 1000 enteros (4 KB), no 1000×1000: esta
última tendría 4 MB y excedería la memoria de datos de 64 KiB de CERBERO. Se
recorre dos veces para verificar primero el llenado y luego la búsqueda; el
test RTL aumenta el límite de ciclos solo para ese caso.

Las operaciones criptográficas del lenguaje son `feistel(bloque, ranura, ronda)`
para F4E y `desfeistel(bloque, ranura, ronda)` para F4D. `ingredere(clave)` abre
la sesión y `custodi(ranura, k0, k1, k2, k3)` instala una llave. La clave raíz
del RTL se configura mediante `ROT_SECRET`; la prueba RTL criptográfica usa una
clave raíz explícita que corresponde con la credencial de 32 bits admitida por
`ingredere`.

El resultado básico de la prueba RTL se muestra así:

```text
retorno R6: 25 (0x00000019)
RESULTADO: OK
```

Se puede indicar otra ubicación del RTL con `CERBERO_CPU`, por ejemplo:

```bash
make prueba-rtl CERBERO_CPU=/ruta/al/proyecto/src/cpu
```

## Compilar un programa

La invocación normal produce un ejecutable binario NOVA:

```bash
./novac test/ejecucion/suma_10_15.nv -o suma.nvx
```

Para revisar cada representación intermedia:

```bash
./novac --tokens test/ejecucion/suma_10_15.nv  # tokens
./novac -t test/ejecucion/suma_10_15.nv        # AST
./novac --sym test/ejecucion/suma_10_15.nv     # tabla de símbolos
./novac --ir test/ejecucion/suma_10_15.nv      # TAC
./novac -s test/ejecucion/suma_10_15.nv -o suma.nvx # .nvx + .asm; asm tambien a stdout
./novac -p test/ejecucion/suma_10_15.nv        # bundles, slots y bytes
```

En `--sym`, las variables globales muestran su dirección absoluta `DMEM`.
Para locales y parámetros se muestran ambos desplazamientos: `R14 @N` es la
ubicación lógica asignada en fase 3 y `-> N(r14)` es el desplazamiento que usa
el ensamblador una vez reservado el marco. Este último incluye, cuando
corresponde, el espacio para argumentos de llamadas salientes. Las funciones
definidas en el programa muestran `IMEM @0xNNNN`, la dirección de su primer
bundle de código en la imagen que carga CERBERO; las funciones intrínsecas no
tienen una dirección propia de código Nova.

La opción `-s` genera el mismo ensamblador textual que usa la fase 4, lo
escribe por stdout para facilitar su inspección y guarda una copia `.asm`
junto al ejecutable `.nvx` (o junto al nombre indicado por `-o`). La opción
`-p` muestra cada bundle con sus cinco slots, dirección y bytes hexadecimales;
con `-o listado.txt` guarda ese reporte en un archivo.

También se puede ensamblar un archivo CERBERO `.s` por separado:

```bash
./novac -x suma.asm -o suma.hex
```

`-x` usa `ARQUITECTURA/tools/cerbero_asm.py` y genera una imagen IMEM `.hex`, además de
`suma.hex.dmem.hex` y `suma.hex.lst`. Esos archivos son imágenes para
`$readmemh`, no un ejecutable empaquetado `.nvx`; para obtener imágenes desde
un `.nvx` use `ARQUITECTURA/tools/novac_image.py` como se muestra abajo.

## Inspección visual con Make

Los objetivos siguientes usan `test/ejecucion/suma_10_15.nv` por omisión.
Puede cambiar el fuente con `F=ruta/programa.nv`:

```bash
make tabla F=test/ejecucion/suma_10_15.nv
make arbol F=test/ejecucion/suma_10_15.nv
make ensamblador F=test/ejecucion/suma_10_15.nv
make paquetes F=test/ejecucion/suma_10_15.nv
make binario F=test/ejecucion/suma_10_15.nv
```

`make arbol` crea un SVG coloreado e independiente en `.salida/`, que puede
abrirse en un navegador. `tabla` imprime los símbolos con su dirección en
DMEM o su posición relativa a R14. `ensamblador` produce el `.asm` junto con
su ejecutable; `paquetes` guarda slots, dirección, bytes y línea de fuente
por bundle. Para ejecutar en el hardware RTL usa `make ejecutar-prueba` o los
objetivos `make prueba-rtl-*`. Las anotaciones de línea en listados y
comentarios `//` del ensamblador no forman parte de la codificación binaria.

El ejecutable `.nvx` usa un encabezado NOVA de 48 bytes con versión, tamaños,
punto de entrada, ubicación de datos y suma de verificación; después contiene
el código CERBERO y los bytes de datos inicializados. Para cargarlo con las
memorias del RTL, convertirlo a los archivos `$readmemh` de 2048 bundles y
16384 palabras:

```bash
python3 ARQUITECTURA/tools/novac_image.py suma.nvx --imem suma_imem.hex --dmem suma_dmem.hex
```

El convertidor valida encabezado, versión, punto de entrada, checksum y límites
de memoria de CERBERO. Los datos sin inicializar y el resto de las memorias se
rellenan con cero. Un programa que exceda los 2048 bundles o los 64 KiB de
DMEM se rechaza explícitamente.

## Opciones útiles

```bash
./novac --max-errors 5 programa.nv
./novac --help
```

Las advertencias se activan por omisión; `-Wall`, `-Werror`, `-w` y
`-Wno-W001` permiten controlarlas. Códigos de salida: `0` éxito, `1` error de
compilación, `2` error de uso y `3` error de entrada/salida.

`-c` empaqueta un módulo validado como objeto `.nvo`. El compilador resuelve
automáticamente los `importa` relativos, admite rutas `-I` y enlaza módulos
fuente u objetos `.nvo` antes de generar el ejecutable:

```bash
./novac -c lib.nv -o lib.nvo
./novac programa.nv -I ./bibliotecas -o programa.nvx
```

El objeto `.nvo` guarda la fuente validada con versión y checksum; se vuelve a
analizar e integrar durante el enlace para verificar tipos y resolver símbolos
con el conjunto completo. No es todavía un objeto de código máquina
independiente de la fuente.

Para probar varias llamadas y un ciclo a través de dos módulos en el RTL:

```bash
make prueba-rtl-integracion
```

Las pruebas avanzadas también se pueden correr por separado:

```bash
make prueba-rtl-matriz
make prueba-rtl-multiplicacion
make prueba-rtl-crypto
```

Para borrar los artefactos del compilador y de la prueba RTL:

```bash
make clean
```
