# Alineación de Nova con CERBERO

Siete correcciones para que el código que genera Nova sea el que CERBERO
ejecuta. Seis salieron de la verificación cruzada y **una apareció al
corregirlas**, que es la más grave de todas.

Estado: **172 pruebas** y **185 verificaciones**, todas pasando, sin
advertencias de `gcc -Wall -Wextra`.

## La verificación que ahora respalda todo esto

El proyecto de CE4301 trae su propio ensamblador. Eso permite la comprobación
más fuerte que existe: ensamblar la salida `-s` de Nova con `cerbero_asm.py` y
comparar contra el binario que Nova produce por su cuenta. Dos
implementaciones independientes del ISA, los mismos 128 bits por bundle.

**Los 12 programas completos del corpus coinciden bit a bit.** Los otros dos
importan otro módulo y los resuelve el enlazador.

Quedó como objetivo permanente, para que no se vuelva a desalinear:

```sh
make depurar F=cerbero
CERBERO_ASM=/ruta/a/cerbero_asm.py make depurar F=cerbero   # si no lo encuentra solo
```

Busca el ensamblador en las rutas vecinas más probables y, si no está, lo dice
y sigue sin fallar.

---

## 1. `MOVH` no era del tipo que creíamos

Esta no estaba en la lista: apareció al arreglar el inmediato de `movi`, y es
la más grave porque **toda constante de 32 bits salía mal**.

Nova suponía que `MOVH` escribía los 13 bits altos conservando los 19 bajos,
con el inmediato en `[18:0]`. El RTL dice otra cosa:

```systemverilog
assign imm16  = slot_i[`F_IMM16];        // bits [18:3]
assign movh_w = {imm16, op_a_i[15:0]};   // rd <- {imm16, rd[15:0]}
```

Es del **tipo U**: reemplaza los **16 bits altos**, conserva los 16 bajos, y su
inmediato vive en `[18:3]`, con `rs1` y `cond` reservados en cero.

El documento de ellos se contradice —la tabla de la sección 3 lo marca como
tipo I, y el párrafo de arriba aclara que «ninguna de las cuatro lleva
inmediato de 19 bits»—, así que conviene avisarles para que lo corrijan.

Cambió en tres lugares: el corte de la constante pasa de 19/13 a **16/16**, el
codificador gana un caso propio para el tipo U, y el simulador hace
`(rd & 0xFFFF) | (imm16 << 16)`.

Comprobado: `0xDEADBEEF` ahora es `movi #48879` más `movh #57005`, idéntico a
lo que produce `cerbero_asm`, y `bits_y_hex.nv` sigue dando −65419.

## 2. `AUTHW` codificaba `widx` en los bits equivocados

El cambio v1.1 del ISA fijó `widx` en `[10:9]` y dejó `[12:11]` reservado.
Nova lo ponía en `[12:11]`, y `key_vault.sv` levanta **ILLOP** si esos bits no
son cero: de los cuatro `authw` que emite `ingredere`, tres habrían fallado y
la sesión no habría abierto nunca.

Un desplazamiento: `widx << 9`.

## 3. El código de la bóveda ahora vive en la región segura

Es el cambio v1.5, y el que ellos describen como «la peor forma de
equivocarse», porque no falla: cifra con la llave equivocada. El controlador
solo mantiene `AUTH` encendido mientras el PC está en `[0x7000, 0x7FFF]`, y
salir de ahí cierra la sesión por hardware.

Nova emitía todo desde `0x0000`. Ahora:

- Una función es **segura** si su cuerpo toca la bóveda. El criterio es la
  función entera y no cada instrucción, justamente porque salir cierra la
  sesión: el camino del `LOGIN` a la última ronda tiene que quedar completo
  adentro.
- Se emiten primero las funciones normales, después el soporte de ejecución, y
  al final las seguras, alineadas a `0x7000`.
- El texto lleva `.org 0x7000`, `.secure` y `.endsecure`, que son las
  directivas que su ensamblador verifica.
- Si el bloque seguro se pasa de los 256 bundles, se avisa con **W008**.

El simulador también lo modela ahora: un `login` fuera de la región no abre
sesión, y salir la cierra. Antes autenticaba siempre, así que no habría
detectado el problema.

## 4. El inmediato de `movi` va con signo

Su ensamblador rechazaba `movi r10, #376559`. Los bits son los mismos; lo que
cambia es cómo se lee el número. Nova emite la forma con signo, y el
verificador de rango volvió a ser estricto, igual que el de ellos.

## 5. La sintaxis de la bóveda

| Antes | Ahora |
|---|---|
| `ksetw 0, #0, r10` | `ksetw k0, #0, r10` |
| `f4e p0, 0, #0` | `f4e p0, k0, #0` |

La ranura va como `k0`–`k3`. Se agregó `llave_num()` al codificador y se
actualizaron el simulador y el desensamblador.

## 6. Los literales de cadena salen con `.byte`

Su ensamblador tiene `.word`, `.byte` y `.space`; no tiene `.ascii` ni
`.align`. Nova emitía las dos que no existen, y por eso **7 de los 16
programas eran rechazados**. Ahora emite los bytes con `.byte` y la alineación
con `.space`.

De paso apareció otra: su ensamblador **no acepta etiquetas como inmediato**.
Nova emitía `movi r10, #__str0` y `movi r11, #&destino`, este último para los
saltos largos. Las dos se resuelven ahora a su dirección numérica: las de datos
en el momento de emitir, y las de código en una pasada final, después de que la
relajación de saltos converge y las posiciones son definitivas.

## 7. `__div32` se llama ahora `__nova_div32`

CERBERO entrega su propia `__div32`, y la v1.3 dice que la etiqueta tiene que
coincidir exactamente. Son dos rutinas con contratos incompatibles:

| | CERBERO | Nova |
|---|---|---|
| Operandos | sin signo | con signo |
| Destruye | `R1`–`R5` | R10, R11 |
| Divisor cero | cociente en unos, no falla | termina con **136** |

Las dos son correctas para lo suyo: `integer` de Nova tiene signo y el lenguaje
promete el 136. Con nombres distintos conviven en el mismo programa enlazado.

---

## Lo que sigue pendiente, y no es de Nova

**La capacidad de IMEM.** Son 2048 bundles, y el código de usuario llega a
1792. Emitiendo una instrucción por bundle, `multiplicacion.nv` ocupa **2389 y
no cabe**; `mergesort` y `convolucion` invaden la región segura. La
planificación de la fase 5 deja de ser una mejora de rendimiento y pasa a ser
lo que hace que los programas quepan.

Ojo con un efecto del cambio 3: un programa que usa la bóveda ahora ocupa al
menos 1792 bundles, porque el bloque seguro arranca ahí. El relleno lo pone el
`.org`, no son instrucciones, pero cuenta contra IMEM.

**Dos cosas para avisarles a ellos:**

1. La tabla de la sección 3 marca `MOVH` como tipo I; es tipo U, como dice su
   propio párrafo de arriba y como lo implementa `alu.sv`.
2. En la tabla de registros de la sección 1.1, `R4`,`R5` figuran como «Par
   P3». Con `Pn = R(2n):R(2n+1)` son **P2**, y el texto que sigue lo confirma.

**Y tres cosas que el ISA nuevo ofrece y que conviene usar en la fase 5:**
`SETcc`, que materializa una comparación en una instrucción donde Nova hoy
gasta unos once bundles; la **ALU corta de S3**, el slot que siempre va vacío;
y los accesos de byte y media palabra, que hoy no se usan para `textus`.
