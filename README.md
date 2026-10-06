# Nova Compiler

Este proyecto compila el lenguaje Nova. En este repo ya está hecha la parte de análisis léxico y sintáctico, y se puede compilar y probar directamente desde la línea de comandos.

## Requisitos

Necesitás tener instalado:

- gcc
- flex
- bison
- make

En Ubuntu o WSL:

```bash
sudo apt update
sudo apt install -y build-essential flex bison make
```

## Compilar

Desde la raíz del proyecto:

```bash
make
```

Esto genera el ejecutable `novac`. Para borrar lo generado: `make clean` (o `make limpiar`).

## Ejecutar

### Ver los tokens

```bash
./novac --tokens test/factorial.nv
```

### Parsear el archivo y mostrar el AST

```bash
./novac -t test/factorial.nv
```

### Limitar la cantidad de errores

Por omisión el compilador aborta al llegar a 25 errores:

```bash
./novac --max-errors 5 programa.nv
```

### Ayuda

```bash
./novac --help
```

Códigos de salida: `0` éxito, `1` errores de compilación, `2` error de uso, `3` error de entrada o salida.

## Pruebas

```bash
make prueba
```


