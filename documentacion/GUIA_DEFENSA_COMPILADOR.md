# Guia sencilla para defender el compilador Nova y CERBERO

Esta guia resume que hace el compilador, como organiza el codigo y la memoria,
y como explicar la ejecucion del programa ante el profesor. La implementacion
del compilador esta en la raiz del proyecto; el procesador CERBERO esta en
`../ARQUITECTURA/`.

## 1. Resumen del recorrido

El flujo principal es:

```text
programa.nv
   -> novac
   -> programa.nvx
   -> novac_image.py
   -> programa.imem.hex + programa.dmem.hex
   -> RTL de CERBERO compilado con iverilog
   -> ejecucion del RTL mediante vvp
```

El compilador analiza el fuente y genera un ejecutable NOVA. `novac_image.py`
no ejecuta ni interpreta instrucciones: valida el `.nvx` y lo convierte al
formato hexadecimal que el testbench carga en las memorias del procesador.
`iverilog` compila el hardware descrito en SystemVerilog y `vvp` ejecuta ese
RTL. Es una simulacion del circuito RTL, no una ejecucion en una CPU fisica ni
un simulador de instrucciones implementado en Python.

## 2. Fases del compilador

Las fases conceptuales son distintas aunque la implementacion de generacion
este agrupada en `fase4_codigo/`:

1. **Analisis lexico** (`fase1_lexico/`): reconoce palabras reservadas,
   identificadores, numeros, operadores, delimitadores y comentarios.
2. **Analisis sintactico** (`fase2_sintactico/`): comprueba la estructura del
   programa y construye el arbol sintactico (AST).
3. **Analisis semantico** (`fase3_semantico/`): verifica nombres, tipos y
   ambitos; construye la tabla de simbolos y asigna ubicaciones de datos.
4. **Representacion intermedia y ensamblador** (`fase4_codigo/tac.c` y
   `fase4_codigo/codegen.c`): convierte el AST en TAC y luego traduce ese TAC
   a instrucciones CERBERO.
5. **Resolucion de referencias y saltos** (`fase4_codigo/codegen.c`): registra
   las etiquetas, calcula sus posiciones finales y resuelve los destinos de
   saltos y llamadas.
6. **Codigo binario** (`fase4_codigo/codegen.c`): codifica los opcodes y
   operandos en bundles y escribe el ejecutable `.nvx`.

Por tanto, que las fases 4, 5 y 6 compartan carpeta o archivo no significa que
sean la misma fase; son etapas logicas conectadas por el generador.

## 3. Representaciones de salida

- **AST**: arbol que representa la estructura sintactica.
- **TAC**: codigo intermedio de tres direcciones, relativamente independiente
  de CERBERO. Por ejemplo, una suma se representa en pasos simples antes de
  traducirse a registros e instrucciones.
- **Ensamblador `.asm`**: forma legible de las instrucciones y etiquetas que
  se codificaran.
- **Paquetes**: listado de bundles con direccion, linea de fuente, slots y
  bytes codificados.
- **Ejecutable `.nvx`**: encabezado NOVA seguido de bundles binarios y datos
  inicializados.
- **`.imem.hex` y `.dmem.hex`**: imagenes de inicializacion para que el RTL
  cargue las instrucciones y los datos.

Comandos utiles desde la raiz del proyecto:

```bash
make
make tabla F=prueba.nv
make arbol F=prueba.nv
make ensamblador F=prueba.nv
make paquetes F=prueba.nv
make binario F=prueba.nv
make generar
make ejecutar-prueba
make prueba
make prueba-rtl
```

`make generar` crea las representaciones de `prueba.nv` y deja los artefactos
en la raiz. `make ejecutar-prueba` compila `prueba.nv`, prepara las imagenes,
compila el testbench y el RTL, y ejecuta el diseño. Si se cambia el programa,
el retorno esperado se puede indicar con `RESULTADO_ESPERADO=valor`.

## Comandos principales para la demostracion

Para una demostracion completa con el archivo `prueba.nv`, ejecutar desde la
raiz del proyecto:

```bash
make generar
make ejecutar-prueba
```

El primer comando muestra en la consola la tabla de simbolos, el AST en texto
y el TAC. Ademas, genera la imagen SVG del arbol y los archivos de ensamblador,
ejecutable, paquetes e imagenes de memoria.

El segundo comando prepara y ejecuta el programa en el RTL de CERBERO. Muestra
los ciclos, el retorno en `R6`, los valores escritos por `scribe` y el estado
de la prueba.

| Comando | Que muestra o genera |
| --- | --- |
| `make` | Compila el compilador Nova. |
| `make tabla F=prueba.nv` | Muestra la tabla de simbolos, con direcciones IMEM de funciones y ubicaciones de variables. |
| `make arbol F=prueba.nv` | Genera el arbol sintactico como SVG en `.salida/prueba.svg`. |
| `make ensamblador F=prueba.nv` | Genera el ensamblador CERBERO en `.salida/prueba.asm`. |
| `make paquetes F=prueba.nv` | Genera el listado de bundles, con direcciones, instrucciones y bytes. |
| `make generar` | Muestra tabla, AST en texto y TAC; tambien genera SVG, ensamblador, `.nvx`, paquetes e imagenes IMEM/DMEM en la raiz. |
| `make ejecutar-prueba` | Ejecuta `prueba.nv` en el RTL de CERBERO y muestra ciclos, retorno y salida de `scribe`. |
| `make prueba` | Ejecuta las pruebas del compilador. |
| `make prueba-rtl` | Ejecuta las pruebas de programas sobre el RTL de CERBERO. |
| `make clean` | Elimina los artefactos generados. |

Los artefactos principales de `make generar` son `prueba.svg`,
`prueba.tabla.txt`, `prueba.ast.txt`, `prueba.ir.txt`, `prueba.asm`,
`prueba.nvx`, `prueba.paquetes.txt`, `prueba.imem.hex` y `prueba.dmem.hex`.
El SVG es un archivo de imagen: se abre desde VS Code o con un visor, no se
representa como imagen dentro de la terminal.

Para probar otro fuente, hay que indicar tambien el retorno esperado al
ejecutar. Por ejemplo:

```bash
make generar FUENTE_PRUEBA=test/ejecucion/suma_10_15.nv
make ejecutar-prueba FUENTE_PRUEBA=test/ejecucion/suma_10_15.nv RESULTADO_ESPERADO=25
```

Para la defensa, primero se puede mostrar `make generar` y sus salidas del
compilador; despues, `make ejecutar-prueba` para enseñar el resultado de la
ejecucion RTL.

## 4. Memoria de datos (DMEM)

CERBERO tiene memoria de datos de 64 KiB. El mapa que considera el proyecto es:

| Rango de direccion | Uso |
| --- | --- |
| `0x0000-0x3FFF` | Segmento de datos globales, literales y salida del programa |
| `0x4000-0xBFFF` | Region reservada para E/S |
| `0xC000-0xEFFF` | Region reservada para heap |
| `0xF000-0xFFFF` | Region de pila, que crece hacia direcciones menores |

Dentro del segmento de datos, el generador organiza actualmente:

| Rango | Uso |
| --- | --- |
| `0x0000-0x1FFF` | Espacio destinado a variables globales |
| `0x2000-0x2FFF` | Literales de texto |
| `0x3000` | Contador de valores escritos por `scribe` |
| `0x3004-0x3FFF` | Buffer de salida de `scribe` |

El mapa es la distribucion definida por el proyecto. En la version actual,
Nova no admite variables globales mutables; las constantes se incrustan como
inmediatos y no reservan una palabra de DMEM. Por eso una tabla puede indicar
`datos globales: 0` aunque el programa tenga variables locales.

Las direcciones de DMEM son direcciones de **datos**. No deben confundirse con
las direcciones de funciones, que pertenecen a IMEM.

## 5. Variables locales, parametros y pila

CERBERO usa el registro `R14` como puntero de pila (stack pointer, SP). El
programa de arranque lo inicializa a `0xFFFC`. La pila crece hacia abajo:
reservar espacio resta bytes a `R14`; liberar el marco se los suma.

Cada palabra ocupa 4 bytes. La fase semantica asigna a parametros y variables
locales offsets logicos negativos, por ejemplo `-4`, `-8`, `-12`. Al entrar a
la funcion, el codegen calcula el marco completo y emite una instruccion como:

```asm
subi r14, r14, #20
```

Esto reserva 20 bytes; no significa que las variables ocupen por si solas esos
20 bytes. El marco puede incluir tambien temporales del TAC, argumentos salientes
de llamadas y un espacio para guardar `R15`.

Una vez reservado el marco, el ensamblador accede a los datos con desplazamientos
respecto del `R14` actual, por ejemplo:

```asm
lw r10, #8(r14)
sw r10, #4(r14)
```

Por eso `make tabla` puede mostrar los dos valores:

```text
R14 @-4 -> +8(r14)
```

- `R14 @-4` es la ubicacion logica asignada en fase 3.
- `+8(r14)` es el desplazamiento efectivo que usa el codegen despues de
  reservar el marco.
- En tiempo de ejecucion, la direccion efectiva de memoria es el valor actual
  de `R14` mas ese desplazamiento. No hay una unica direccion absoluta para
  una variable local: cambia entre llamadas y niveles de recursividad.

Para obtener ese desplazamiento, el generador usa el layout real de la funcion:

```text
desplazamiento = bytes_argumentos_salientes
               + tamano_locales_y_parametros
               + offset_logico
```

Los argumentos a partir del quinto ocupan el area de salida del marco. Los
cuatro primeros se pasan en `R6-R9`. Al entrar, la funcion copia los parametros
a sus posiciones dentro de su marco.

El resumen `marco N B` de una funcion en la tabla de simbolos corresponde al
espacio semantico de parametros y locales. Puede ser `0 B` si no tiene ninguno;
el marco de ejecucion aun puede reservar espacio para temporales o llamadas.
El tamano total usado por el prologo se ve en el comentario del ensamblador.

## 6. Llamadas a funcion y retorno

La convencion de llamada empleada por el codegen es:

- `R6-R9`: primeros cuatro argumentos.
- Area de salida en la pila: quinto argumento en adelante.
- `jal.al etiqueta`: llamada; guarda la direccion de retorno en `R15`.
- `R6`: valor de retorno.
- `R14`: puntero de pila.
- `R15`: registro de enlace.

Si una funcion necesita hacer llamadas (incluyendo las rutinas de division
usadas por Nova), el prologo reserva espacio para guardar `R15`. El epilogo lo
restaura, libera el marco y retorna con `jr.al r15`. Las funciones que no
necesitan guardar el enlace no reservan ese espacio. `principale` es especial:
su retorno emite `halt` y deja el resultado en `R6`.

Una funcion marcada `@cauda` puede usar una llamada de cola: los nuevos
argumentos se copian sobre el marco existente y se salta al inicio del cuerpo,
sin apilar otro marco. Esto evita que la pila crezca en cada repeticion de esa
llamada.

## 7. Direcciones de codigo (IMEM) y etiquetas

IMEM contiene el codigo. En esta configuracion tiene 2048 posiciones de 16
bytes, es decir, 32 KiB. Cada posicion de 16 bytes es un **bundle** de 128
bits. Por eso:

```text
direccion de un bundle = numero_de_bundle * 16
```

Por ejemplo, el bundle 7 empieza en la direccion `0x0070`.

El codegen registra una etiqueta con el numero de bundle actual cuando la
emite. Las etiquetas incluyen:

- nombres de funciones;
- destinos de `si`, `dum`, `per` y otras estructuras de control;
- etiquetas auxiliares del compilador, por ejemplo para comprobaciones de
  rango y rutinas de soporte;
- `__inicio`, punto de entrada del programa ejecutable.

La direccion `IMEM @0xNNNN` de una funcion en `make tabla` es la direccion en
bytes de su primer bundle de codigo, incluido el prologo. La tabla obtiene el
valor del layout final del codegen, despues de resolver los saltos; no estima
la direccion mediante una segunda formula.

`__inicio` es distinto de la etiqueta `principale`: el cargador empieza en
`__inicio`, que inicializa `R14`, llama a `principale` y despues se detiene.
La direccion de entrada tambien queda guardada en el encabezado `.nvx`.

## 8. Saltos, desplazamientos y resolucion de referencias

El generador convierte el control de flujo a etiquetas y saltos:

- Un salto incondicional del TAC se convierte en `br.al etiqueta`.
- Una condicion se compara y luego se genera un salto condicional, como
  `br.eq` o `br.ne`.
- Una llamada usa `jal.al etiqueta`; el retorno usa `jr.al r15`.

CERBERO ejecuta un **delay slot** despues de cada salto: el bundle siguiente se
ejecuta siempre, se tome o no el salto. El codegen agrega ese bundle y evita
poner ahi una operacion que solo debia ejecutarse en uno de los caminos.

Un salto directo de tipo C guarda un desplazamiento relativo con signo de 10
bits, contado en bundles. Si `B` es el bundle del salto y `D` el bundle destino:

```text
desplazamiento = D - B - 1
direccion_destino = direccion_siguiente_bundle
                    + desplazamiento * 16
```

El `-1` aparece porque la base es el bundle siguiente al salto. El rango
representable es de `-512` a `+511` bundles.

La resolucion se hace una vez que se conoce el programa generado:

1. El generador emite bundles y guarda cada etiqueta con su posicion.
2. Busca las referencias a esas etiquetas y calcula los desplazamientos.
3. Si un salto incondicional o una llamada excede el rango directo, cambia a
   una forma larga que carga la direccion absoluta en un registro y salta por
   registro (`jr`/`jalr`).
4. La forma larga ocupa mas bundles y puede mover otras etiquetas. Por eso
   reconstruye el programa y vuelve a medir los saltos hasta que las
   posiciones se estabilizan.
5. Finalmente, las referencias absolutas locales como `#&etiqueta` se
   sustituyen por la direccion en bytes. Las referencias de otro modulo que
   aun no puedan resolverse se dejan para el enlazador; un simbolo que no
   pueda resolverse produce un diagnostico.

Esto evita asumir que una etiqueta mantendra su posicion despues de expandir
un salto. Por la misma razon, las direcciones de funcion de la tabla se toman
despues de esta etapa.

## 9. Ensamblador y binario

El ensamblador CERBERO organiza cada bundle en cinco slots:

| Slot | Unidad |
| --- | --- |
| S0 | ALU-0 |
| S1 | ALU-1 |
| S2 | LSU, accesos a memoria |
| S3 | CRP, operaciones criptograficas |
| S4 | BRU, saltos y control |

Cada bundle mide 128 bits: S0, S1 y S2 ocupan 32 bits cada uno; S3 y S4 ocupan
16 bits cada uno. El codegen asigna los opcodes y codifica registros,
inmediatos, modos de direccionamiento, condiciones y desplazamientos. Los
bundles vacios se codifican como ceros. En esta version el generador no hace
planificacion VLIW general; coloca las instrucciones en los slots que
corresponden y deja vacios los slots que no utiliza.

El archivo `.nvx` empieza con un encabezado de 48 bytes que indica, entre otros
datos, la cantidad de bundles, la direccion de carga del codigo, el punto de
entrada, el origen y tamanos de datos, el tope de pila y una suma de
verificacion. Despues del encabezado vienen el codigo y los datos iniciales.

La herramienta `novac_image.py` comprueba el formato y la suma de
verificacion, extrae el codigo hacia IMEM y coloca los datos en la imagen de
DMEM. Completa las imagenes al tamano esperado por CERBERO. Es una conversion
de formato necesaria para `$readmemh`, no una ejecucion ni una interpretacion
de instrucciones.

## 10. Como demostrar la ejecucion en el RTL

Desde la raiz del proyecto:

```bash
make ejecutar-prueba
```

Durante la ejecucion se pueden mostrar estos pasos:

1. `novac` crea `prueba.nvx`.
2. `novac_image.py` crea `prueba.imem.hex` y `prueba.dmem.hex`.
3. `iverilog` compila los archivos SystemVerilog de `ARQUITECTURA/src/cpu/`
   junto con `test/tb_nova_rtl.sv`.
4. `vvp` ejecuta el modelo compilado del circuito RTL.
5. El testbench reporta ciclos, retorno de `R6`, valores de `scribe` leidos
   directamente de la DMEM del procesador y `RESULTADO: OK` si se cumplen las
   comprobaciones.

El testbench espera a que el procesador active `halted`, comprueba el retorno,
la ausencia de excepciones y el estado de autenticacion. Esto demuestra que el
programa fue ejecutado por el diseno RTL de CERBERO y que el resultado fue
observado en sus registros/memoria. Para afirmar ejecucion en silicio real
harian falta una FPGA o una plataforma fisica; la prueba actual es RTL.

## 11. Preguntas frecuentes para la defensa

**¿Por que la tabla muestra offsets negativos y el ensamblador positivos?**  
La fase 3 muestra la posicion logica antes de ajustar el marco. El ensamblador
usa el desplazamiento efectivo desde el nuevo `R14`, una vez reservados tambien
temporales y argumentos salientes. Ambos describen la misma variable desde
referencias distintas.

**¿La direccion de una variable local es fija?**  
No como direccion absoluta. Se calcula en tiempo de ejecucion como `R14` actual
mas su desplazamiento efectivo. Cada llamada puede tener un `R14` distinto.

**¿La direccion de una funcion es la direccion de entrada del programa?**  
No necesariamente. La funcion tiene su propia etiqueta y direccion IMEM.
El punto de entrada del ejecutable es `__inicio`; este llama a `principale`.

**¿Python ejecuta el programa?**  
No. Python convierte el `.nvx` en imagenes de memoria. La ejecucion de las
instrucciones ocurre en el RTL de CERBERO mediante `vvp`.

**¿Se esta ejecutando en el procesador fisico?**  
No. Se ejecuta el diseno RTL del procesador en el simulador de hardware Icarus
Verilog; no en una FPGA o chip fisico.

## 12. Archivos clave

- `fase1_lexico/`: analisis lexico.
- `fase2_sintactico/`: gramatica y arbol sintactico.
- `fase3_semantico/symtab.c`: asignacion y presentacion de simbolos.
- `fase4_codigo/tac.c`: generacion de codigo intermedio.
- `fase4_codigo/codegen.c`: marcos, ensamblador, etiquetas, saltos y binario.
- `ARQUITECTURA/docs/isa.md`: especificacion de la arquitectura CERBERO.
- `ARQUITECTURA/tools/novac_image.py`: conversion del ejecutable a imagenes.
- `test/tb_nova_rtl.sv`: testbench que instancia y comprueba el procesador.
- `Makefile`: objetivos para compilar, inspeccionar y ejecutar pruebas.
