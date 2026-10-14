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
__str0:
    .word 0
__str1:
    .word 32
    .byte 0x65, 0x72, 0x72, 0x6F, 0x72, 0x3A, 0x20, 0x64, 0x69, 0x6D, 0x65, 0x6E
    .byte 0x73, 0x69, 0x6F, 0x6E, 0x65, 0x73, 0x20, 0x69, 0x6E, 0x63, 0x6F, 0x6D
    .byte 0x70, 0x61, 0x74, 0x69, 0x62, 0x6C, 0x65, 0x73

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
    movi r11, #14224           | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | jalr.al r11      ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | halt             ;
    -                          | -          | -                      | -                  | -                ;
    // functio imprimir
imprimir:
    // marco de 32 bytes, guarda R15 en #28(r14)
    subi r14, r14, #32         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #28(r14)       | -                  | -                ;
    -                          | -          | sw r6, #8(r14)         | -                  | -                ;
    -                          | -          | sw r7, #12(r14)        | -                  | -                ;
    -                          | -          | sw r8, #16(r14)        | -                  | -                ;
__imprimir_cuerpo:
    // Nova fuente: linea 3
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L0:
    // Nova fuente: linea 3
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | br.lt __c6_si    ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | br.al __c6_fin   ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
__c6_si:
    // Nova fuente: linea 3
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
__c6_fin:
    // Nova fuente: linea 3
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | br.eq L2         ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L3:
    // Nova fuente: linea 4
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | br.lt __c7_si    ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | br.al __c7_fin   ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
__c7_si:
    // Nova fuente: linea 4
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
__c7_fin:
    // Nova fuente: linea 4
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | br.eq L5         ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango8_ok ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
__rango8_ok:
    // Nova fuente: linea 5
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango9_ok ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
__rango9_ok:
    // Nova fuente: linea 5
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    movi r11, #20032           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
L4:
    // Nova fuente: linea 4
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L3         ;
    -                          | -          | -                      | -                  | -                ;
L5:
    // Nova fuente: linea 7
    movi r10, #8192            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    movi r11, #25728           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    movi r11, #31984           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
L1:
    // Nova fuente: linea 3
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L0         ;
    -                          | -          | -                      | -                  | -                ;
L2:
    // Nova fuente: linea 2
    -                          | -          | lw r15, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 2
    addi r14, r14, #32         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // functio multiplicar
multiplicar:
    // marco de 100 bytes
    subi r14, r14, #100        | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #76(r14)        | -                  | -                ;
    -                          | -          | sw r7, #80(r14)        | -                  | -                ;
    -                          | -          | sw r8, #84(r14)        | -                  | -                ;
    -                          | -          | sw r9, #64(r14)        | -                  | -                ;
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #68(r14)       | -                  | -                ;
    -                          | -          | lw r10, #104(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    -                          | -          | lw r10, #108(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    -                          | -          | lw r10, #112(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    -                          | -          | lw r10, #116(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    -                          | -          | lw r10, #120(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    -                          | -          | lw r10, #124(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #44(r14)       | -                  | -                ;
    -                          | -          | lw r10, #128(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    -                          | -          | lw r10, #132(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
__multiplicar_cuerpo:
    // Nova fuente: linea 13
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | br.ge __c8_si    ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | br.al __c8_fin   ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
__c8_si:
    // Nova fuente: linea 13
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
__c8_fin:
    // Nova fuente: linea 13
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | br.eq L6         ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    addi r14, r14, #100        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
L6:
    // Nova fuente: linea 16
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | br.ge __c9_si    ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | br.al __c9_fin   ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
__c9_si:
    // Nova fuente: linea 16
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
__c9_fin:
    // Nova fuente: linea 16
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | br.eq L7         ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    mov r9, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r6, #76(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r7, #80(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r8, #84(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r9, #64(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | br.al __multiplicar_cuerpo ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    addi r14, r14, #100        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
L7:
    // Nova fuente: linea 20
    -                          | -          | lw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | br.ge __c10_si   ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | br.al __c10_fin  ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
__c10_si:
    // Nova fuente: linea 20
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
__c10_fin:
    // Nova fuente: linea 20
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | br.eq L8         ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango10_ok ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
__rango10_ok:
    // Nova fuente: linea 21
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango11_ok ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
__rango11_ok:
    // Nova fuente: linea 21
    -                          | -          | lw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    mov r9, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    -                          | -          | lw r10, #48(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r6, #76(r14)        | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r7, #80(r14)        | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r8, #84(r14)        | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r9, #64(r14)        | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | br.al __multiplicar_cuerpo ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    addi r14, r14, #100        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | -                ;
L8:
    // Nova fuente: linea 25
    -                          | -          | lw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    mov r9, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    -                          | -          | lw r10, #48(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    -                          | -          | lw r10, #44(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | br.ltu __rango12_ok ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
__rango12_ok:
    // Nova fuente: linea 25
    -                          | -          | lw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | br.ltu __rango13_ok ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
__rango13_ok:
    // Nova fuente: linea 25
    -                          | -          | lw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | br.ltu __rango14_ok ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
__rango14_ok:
    // Nova fuente: linea 25
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | br.ltu __rango15_ok ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
__rango15_ok:
    // Nova fuente: linea 25
    -                          | -          | lw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #96(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #96(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #96(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r6, #76(r14)        | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r7, #80(r14)        | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r8, #84(r14)        | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r9, #64(r14)        | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    movi r11, #3952            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | jr.al r11        ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    addi r14, r14, #100        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // functio principale
principale:
    // marco de 116 bytes, guarda R15 en #112(r14)
    subi r14, r14, #116        | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #112(r14)      | -                  | -                ;
__principale_cuerpo:
    // Nova fuente: linea 29
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    addi r11, r14, #76         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    addi r11, r14, #76         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    addi r11, r14, #76         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 30
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    addi r11, r14, #76         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 30
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    addi r11, r14, #76         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 30
    movi r10, #6               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    addi r11, r14, #76         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #7               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #52         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #8               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #52         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #9               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #52         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #52         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #11              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #52         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #12              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #52         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 33
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 33
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | sw r10, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | lw r11, #104(r14)      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | br.ne __c11_si   ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | br.al __c11_fin  ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
__c11_si:
    // Nova fuente: linea 33
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
__c11_fin:
    // Nova fuente: linea 33
    -                          | -          | sw r10, #108(r14)      | -                  | -                ;
    // Nova fuente: linea 33
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | br.eq L9         ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    movi r10, #8196            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | jal.al __scribe_txt ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    movi r11, #31984           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 35
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
L9:
    // Nova fuente: linea 37
    addi r10, r14, #76         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    addi r10, r14, #52         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    mov r9, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 37
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 37
    addi r10, r14, #36         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 37
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 37
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 37
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 37
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 37
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 37
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 37
    movi r11, #3264            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    addi r10, r14, #36         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    movi r11, #160             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | sw r10, #100(r14)      | -                  | -                ;
    // Nova fuente: linea 39
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 39
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
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | jr.al r15        ;
    -                          | -          | -                      | -                  | -                ;
    // __scribe_txt(R6 = direccion): escribe la longitud y las palabras
__scribe_txt:
    subi r14, r14, #4          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #0(r14)        | -                  | -                ;
    -                          | -          | lw r7, #0(r6)          | -                  | -                ;
    mov r9, r6                 | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    mov r6, r7                 | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    movi r11, #20032           | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | jalr.al r11      ;
    -                          | -          | -                      | -                  | -                ;
    addi r9, r9, #4            | -          | -                      | -                  | -                ;
    addi r8, r7, #3            | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    srli r8, r8, #2            | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
__txt_bucle:
    cmpi r8, #0                | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | br.eq __txt_fin  ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | lw r6, #0(r9)          | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    movi r11, #20032           | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | jalr.al r11      ;
    -                          | -          | -                      | -                  | -                ;
    addi r9, r9, #4            | -          | -                      | -                  | -                ;
    subi r8, r8, #1            | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | br.al __txt_bucle ;
    -                          | -          | -                      | -                  | -                ;
__txt_fin:
    -                          | -          | lw r15, #0(r14)        | -                  | -                ;
    addi r14, r14, #4          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | jr.al r15        ;
    -                          | -          | -                      | -                  | -                ;
    // __dic_fin(): marca el fin de linea de 'dic' con 0x0A
__dic_fin:
    movi r6, #10               | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    movi r11, #20032           | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | jr.al r11        ;
    -                          | -          | -                      | -                  | -                ;

// fin del programa
