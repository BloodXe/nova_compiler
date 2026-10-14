// =====================================================
// Ensamblador VLIW para CERBERO, generado por novac
// Bundle de 128 bits, cinco slots:
//   <S0:ALU-0> | <S1:ALU-1> | <S2:LSU> | <S3:CRP> | <S4:BRU> ;
// Tres bundles de productor a consumidor; un delay slot
// despues de cada salto, que siempre se ejecuta.
// =====================================================

.data
    // 0x0000-0x1FFF variables globales (Nova no tiene globales mutables)
    .org 0x2000
    // Literales de cadena: una palabra de longitud y luego los bytes.

    .org 0x3000
__out_n:
    .word 0
__out_buf:
    .space 4092

.text
    .org 0x0000
    // Arranque: la pila empieza en 0xFFFC y se entra a principale
__inicio:
    movi r14, #65532           | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | jal.al principale ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | halt             ;
    -                          | -          | -                      | -                  | -                ;
    // functio principale
principale:
    // marco de 12 bytes
    subi r14, r14, #12         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
__principale_cuerpo:
    // Nova fuente: linea 2
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 2
    movi r10, #15              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | lw r11, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 2
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;

// fin del programa
