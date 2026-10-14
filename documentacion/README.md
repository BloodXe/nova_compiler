# Documentación de Nova y CERBERO

El proyecto del compilador Nova está en la raíz del repositorio. La
arquitectura del procesador se encuentra en `../ARQUITECTURA`.

## Contenido

- `especificacion_nova.md` y `especificacion_nova.pdf`: especificación del
  lenguaje y cumplimiento de las seis fases.
- `GUIA_DEFENSA_COMPILADOR.md`: explicación sencilla del flujo, memoria, pila,
  direcciones, etiquetas, saltos, binario y pruebas del RTL para defender el
  proyecto.
- `ENTREGA.md`: guía breve de compilación, ejecución y pruebas.
- `CAMBIOS_alineacion_cerbero.md`: registro técnico de compatibilidad Nova-CERBERO.
- `ProyectoIIS2026Completo (4).pdf`: requisitos originales del proyecto.
- `../ensambladores/`: listados generados por el compilador.
- `../imagenes/`: figuras usadas en la documentación.
- `../ARQUITECTURA/docs/isa.md`: especificación de la ISA CERBERO.

## Compilar y verificar

Desde la raíz del proyecto:

```sh
make
make prueba
make prueba-rtl
make depurar F=todo
```

Para ejecutar los testbenches independientes del procesador, desde
`ARQUITECTURA/src/build`:

```sh
make sim
```

El RTL de integración carga las imágenes en CERBERO y comprueba el resultado
en R6.

Para regenerar el PDF a partir del Markdown:

```sh
python3 tools/generar_pdf.py
```
