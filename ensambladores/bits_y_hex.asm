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
    // functio rotar
rotar:
    // marco de 20 bytes
    subi r14, r14, #20         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #4(r14)         | -                  | -                ;
    -                          | -          | sw r7, #0(r14)         | -                  | -                ;
__rotar_cuerpo:
    // Nova fuente: linea 7
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    sll r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    movi r10, #32              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    sub r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    srl r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    or r10, r10, r11           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    addi r14, r14, #20         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // functio es_par
es_par:
    // marco de 16 bytes
    subi r14, r14, #16         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #0(r14)         | -                  | -                ;
__es_par_cuerpo:
    // Nova fuente: linea 11
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    and r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.eq __c0_si    ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.al __c0_fin   ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
__c0_si:
    // Nova fuente: linea 11
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
__c0_fin:
    // Nova fuente: linea 11
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    addi r14, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // functio mezclar
mezclar:
    // marco de 24 bytes
    subi r14, r14, #24         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #8(r14)         | -                  | -                ;
    -                          | -          | sw r7, #4(r14)         | -                  | -                ;
    -                          | -          | sw r8, #0(r14)         | -                  | -                ;
__mezclar_cuerpo:
    // Nova fuente: linea 15
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    movi r10, #48879           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    movh r10, #57005           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    and r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    xor r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    movi r10, #15              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    not r10, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    xor r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    addi r14, r14, #24         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // functio principale
principale:
    // marco de 20 bytes, guarda R15 en #16(r14)
    subi r14, r14, #20         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #16(r14)       | -                  | -                ;
__principale_cuerpo:
    // Nova fuente: linea 19
    movi r10, #255             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #8               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | jal.al rotar     ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r6, #4(r14)         | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #165             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    xor r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | jal.al es_par    ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r6, #4(r14)         | -                  | -                ;
    // Nova fuente: linea 21
    mov r10, r6                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | br.eq __n0_si    ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | br.al __n0_fin   ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
__n0_si:
    // Nova fuente: linea 21
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
__n0_fin:
    // Nova fuente: linea 21
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | br.eq L2         ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | br.ge __c1_si    ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | br.al __c1_fin   ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
__c1_si:
    // Nova fuente: linea 21
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
__c1_fin:
    // Nova fuente: linea 21
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | br.al L3         ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
L2:
    // Nova fuente: linea 21
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L3:
    // Nova fuente: linea 21
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | br.ne L0         ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | br.ne __c2_si    ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | br.al __c2_fin   ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
__c2_si:
    // Nova fuente: linea 21
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
__c2_fin:
    // Nova fuente: linea 21
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | br.al L1         ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
L0:
    // Nova fuente: linea 21
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
L1:
    // Nova fuente: linea 21
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | br.eq L4         ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | lw r6, #0(r14)         | -                  | -                ;
    // Nova fuente: linea 22
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    movi r10, #31              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | jal.al mezclar   ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r6, #4(r14)         | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
L4:
    // Nova fuente: linea 24
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 24
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;

// fin del programa
