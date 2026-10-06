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



## Ejecutar

### Ver los tokens

```bash
./novac_parser --tokens test/factorial.nv
```

### Parsear el archivo y mostrar el AST

```bash
./novac_parser -t test/factorial.nv
```

### Ayuda

```bash
./novac_parser --help
```



