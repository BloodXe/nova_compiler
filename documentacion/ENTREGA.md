# Proyecto del compilador Nova

La raíz del proyecto contiene el compilador Nova, sus seis fases, ejemplos y
pruebas. El procesador CERBERO está separado en `ARQUITECTURA/`.

## Requisitos

GCC, Make, Flex, Bison, Python 3 e Icarus Verilog (`iverilog` y `vvp`).

En Ubuntu o WSL:

```sh
sudo apt install build-essential flex bison make python3 iverilog
```

## Compilar y probar

Desde esta carpeta:

```sh
make
make prueba
make prueba-rtl
make depurar F=todo
```

Los resultados de ejecución sobre el RTL muestran el valor de retorno en R6.
Por ejemplo, la suma `10 + 15` termina con `R6=25`. Las pruebas incluyen
arreglos, matrices, ordenamiento, multiplicación y la matriz 10×100.

Para inspeccionar el compilador:

```sh
make tabla F=test/ejecucion/matriz_1000.nv
make arbol F=test/ejecucion/matriz_1000.nv
make ensamblador F=test/ejecucion/matriz_1000.nv
make paquetes F=test/ejecucion/matriz_1000.nv
```

`make arbol` deja un SVG en `.salida/`. `make prueba-rtl-matriz-1000` ejecuta
ese caso en el procesador RTL y tarda más que las pruebas pequeñas.
