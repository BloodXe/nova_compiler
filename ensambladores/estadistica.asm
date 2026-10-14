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
    // Modulo de biblioteca: no tiene principale, no lleva arranque
    // functio total
total:
    // marco de 32 bytes
    subi r14, r14, #32         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #12(r14)        | -                  | -                ;
    -                          | -          | sw r7, #16(r14)        | -                  | -                ;
    -                          | -          | sw r8, #20(r14)        | -                  | -                ;
__total_cuerpo:
    // Nova fuente: linea 3
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L0:
    // Nova fuente: linea 4
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c0_si    ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | br.al __c0_fin   ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
__c0_si:
    // Nova fuente: linea 4
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
__c0_fin:
    // Nova fuente: linea 4
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | br.eq L2         ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L3:
    // Nova fuente: linea 5
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c1_si    ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | br.al __c1_fin   ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
__c1_si:
    // Nova fuente: linea 5
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
__c1_fin:
    // Nova fuente: linea 5
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | br.eq L5         ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | br.ltu __rango0_ok ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
__rango0_ok:
    // Nova fuente: linea 6
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | br.ltu __rango1_ok ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
__rango1_ok:
    // Nova fuente: linea 6
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
L4:
    // Nova fuente: linea 5
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L3         ;
    -                          | -          | -                      | -                  | -                ;
L5:
L1:
    // Nova fuente: linea 4
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L0         ;
    -                          | -          | -                      | -                  | -                ;
L2:
    // Nova fuente: linea 9
    -                          | -          | lw r6, #8(r14)         | -                  | -                ;
    // Nova fuente: linea 9
    addi r14, r14, #32         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // functio promedio
promedio:
    // marco de 32 bytes, guarda R15 en #28(r14)
    subi r14, r14, #32         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #28(r14)       | -                  | -                ;
    -                          | -          | sw r6, #4(r14)         | -                  | -                ;
    -                          | -          | sw r7, #8(r14)         | -                  | -                ;
    -                          | -          | sw r8, #12(r14)        | -                  | -                ;
__promedio_cuerpo:
    // Nova fuente: linea 12
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | jal.al total     ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r6, #16(r14)        | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r7, #0(r14)         | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | jal.al __nova_div32 ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r6, #20(r14)        | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r15, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    addi r14, r14, #32         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // functio maximo
maximo:
    // marco de 40 bytes
    subi r14, r14, #40         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #12(r14)        | -                  | -                ;
    -                          | -          | sw r7, #16(r14)        | -                  | -                ;
    -                          | -          | sw r8, #20(r14)        | -                  | -                ;
__maximo_cuerpo:
    // Nova fuente: linea 16
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #28(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango2_ok ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
__rango2_ok:
    // Nova fuente: linea 16
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango3_ok ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
__rango3_ok:
    // Nova fuente: linea 16
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L6:
    // Nova fuente: linea 17
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | br.lt __c2_si    ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | br.al __c2_fin   ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
__c2_si:
    // Nova fuente: linea 17
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
__c2_fin:
    // Nova fuente: linea 17
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | br.eq L8         ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L9:
    // Nova fuente: linea 18
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | br.lt __c3_si    ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | br.al __c3_fin   ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
__c3_si:
    // Nova fuente: linea 18
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
__c3_fin:
    // Nova fuente: linea 18
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | br.eq L11        ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | br.ltu __rango4_ok ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
__rango4_ok:
    // Nova fuente: linea 19
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | br.ltu __rango5_ok ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
__rango5_ok:
    // Nova fuente: linea 19
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    cmp r11, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | br.lt __c4_si    ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | br.al __c4_fin   ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
__c4_si:
    // Nova fuente: linea 19
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
__c4_fin:
    // Nova fuente: linea 19
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | br.eq L12        ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango6_ok ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
__rango6_ok:
    // Nova fuente: linea 20
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango7_ok ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
__rango7_ok:
    // Nova fuente: linea 20
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
L12:
L10:
    // Nova fuente: linea 18
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L9         ;
    -                          | -          | -                      | -                  | -                ;
L11:
L7:
    // Nova fuente: linea 17
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L6         ;
    -                          | -          | -                      | -                  | -                ;
L8:
    // Nova fuente: linea 24
    -                          | -          | lw r6, #8(r14)         | -                  | -                ;
    // Nova fuente: linea 24
    addi r14, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // __nova_div32(R6 = a, R7 = b) -> R6 = a/b, R7 = a%b, con signo
__nova_div32:
    cmpi r7, #0                | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | br.ne __dv_ok    ;
    -                          | -          | -                      | -                  | -                ;
    movi r6, #136              | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | halt             ;
    -                          | -          | -                      | -                  | -                ;
__dv_ok:
    subi r14, r14, #8          | -          | -                      | -                  | -                ;
    movi r10, #0               | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    cmpi r6, #0                | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | br.ge __dv_a_pos ;
    -                          | -          | -                      | -                  | -                ;
    movi r10, #0               | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    sub r6, r10, r6            | -          | -                      | -                  | -                ;
    movi r10, #1               | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
__dv_a_pos:
    cmpi r7, #0                | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | br.ge __dv_b_pos ;
    -                          | -          | -                      | -                  | -                ;
    movi r10, #0               | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    sub r7, r10, r7            | -          | -                      | -                  | -                ;
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    xori r10, r10, #1          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
__dv_b_pos:
    movi r8, #0                | -          | -                      | -                  | -                ;
    movi r9, #0                | -          | -                      | -                  | -                ;
    movi r10, #31              | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
__dv_bucle:
    srl r11, r6, r10           | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    andi r11, r11, #1          | -          | -                      | -                  | -                ;
    slli r9, r9, #1            | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    or r9, r9, r11             | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    cmp r9, r7                 | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | br.ltu __dv_sigue ;
    -                          | -          | -                      | -                  | -                ;
    sub r9, r9, r7             | -          | -                      | -                  | -                ;
    movi r11, #1               | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    sll r11, r11, r10          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    or r8, r8, r11             | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
__dv_sigue:
    subi r10, r10, #1          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | br.ge __dv_bucle ;
    -                          | -          | -                      | -                  | -                ;
    mov r6, r8                 | -          | -                      | -                  | -                ;
    mov r7, r9                 | -          | -                      | -                  | -                ;
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | br.eq __dv_c_pos ;
    -                          | -          | -                      | -                  | -                ;
    movi r11, #0               | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    sub r6, r11, r6            | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
__dv_c_pos:
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | br.eq __dv_r_pos ;
    -                          | -          | -                      | -                  | -                ;
    movi r11, #0               | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    sub r7, r11, r7            | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
__dv_r_pos:
    addi r14, r14, #8          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | jr.al r15        ;
    -                          | -          | -                      | -                  | -                ;

// fin del programa
