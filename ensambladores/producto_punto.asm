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
    // functio producto_punto
producto_punto:
    // marco de 36 bytes
    subi r14, r14, #36         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #16(r14)        | -                  | -                ;
    -                          | -          | sw r7, #20(r14)        | -                  | -                ;
    -                          | -          | sw r8, #8(r14)         | -                  | -                ;
    -                          | -          | sw r9, #12(r14)        | -                  | -                ;
__producto_punto_cuerpo:
    // Nova fuente: linea 2
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 3
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L0:
    // Nova fuente: linea 3
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c0_si    ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | br.al __c0_fin   ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
__c0_si:
    // Nova fuente: linea 3
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
__c0_fin:
    // Nova fuente: linea 3
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
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
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango0_ok ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
__rango0_ok:
    // Nova fuente: linea 4
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r11, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r11, #28(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango1_ok ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
__rango1_ok:
    // Nova fuente: linea 4
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r11, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L1:
    // Nova fuente: linea 3
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L0         ;
    -                          | -          | -                      | -                  | -                ;
L2:
    // Nova fuente: linea 6
    -                          | -          | lw r6, #4(r14)         | -                  | -                ;
    // Nova fuente: linea 6
    addi r14, r14, #36         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // functio principale
principale:
    // marco de 68 bytes, guarda R15 en #64(r14)
    subi r14, r14, #68         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #64(r14)       | -                  | -                ;
__principale_cuerpo:
    // Nova fuente: linea 12
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L3:
    // Nova fuente: linea 12
    movi r10, #6               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | br.lt __c1_si    ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | br.al __c1_fin   ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
__c1_si:
    // Nova fuente: linea 12
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
__c1_fin:
    // Nova fuente: linea 12
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | br.eq L5         ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #6               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango2_ok ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
__rango2_ok:
    // Nova fuente: linea 13
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    addi r11, r14, #28         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 14
    movi r10, #6               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | br.ltu __rango3_ok ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
__rango3_ok:
    // Nova fuente: linea 14
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    addi r11, r14, #4          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
L4:
    // Nova fuente: linea 12
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L3         ;
    -                          | -          | -                      | -                  | -                ;
L5:
    // Nova fuente: linea 16
    addi r10, r14, #28         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #6               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    addi r10, r14, #4          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #6               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    mov r9, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | jal.al producto_punto ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r6, #52(r14)        | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;

// fin del programa
