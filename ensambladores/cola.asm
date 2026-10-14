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
    // functio sumar
sumar:
    // marco de 16 bytes
    subi r14, r14, #16         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #4(r14)         | -                  | -                ;
    -                          | -          | sw r7, #0(r14)         | -                  | -                ;
__sumar_cuerpo:
    // Nova fuente: linea 5
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | br.eq __c0_si    ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | br.al __c0_fin   ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
__c0_si:
    // Nova fuente: linea 5
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
__c0_fin:
    // Nova fuente: linea 5
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | br.eq L0         ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r6, #0(r14)         | -                  | -                ;
    // Nova fuente: linea 6
    addi r14, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
L0:
    // Nova fuente: linea 8
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    sub r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r11, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r6, #4(r14)         | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r7, #0(r14)         | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | br.al __sumar_cuerpo ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    addi r14, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // functio principale
principale:
    // marco de 8 bytes, guarda R15 en #4(r14)
    subi r14, r14, #8          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #4(r14)        | -                  | -                ;
__principale_cuerpo:
    // Nova fuente: linea 12
    movi r10, #500             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | jal.al sumar     ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r6, #0(r14)         | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | jal.al __scribe_int ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 13
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // __scribe_int(R6 = valor): el ISA no define puertos de E/S, los resultados se dejan en memoria para las herramientas de CE 4301
__scribe_int:
    movi r10, #12288           | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | lw r11, #0(r10)        | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    slli r11, r11, #2          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    addi r11, r11, #4          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    add r11, r10, r11          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #0(r11)         | -                  | -                ;
    -                          | -          | lw r11, #0(r10)        | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    addi r11, r11, #1          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r11, #0(r10)        | -                  | -                ;
    -                          | -          | -                      | -                  | jr.al r15        ;
    -                          | -          | -                      | -                  | -                ;

// fin del programa
