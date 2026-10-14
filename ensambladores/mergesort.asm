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
    movi r11, #11824           | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | jalr.al r11      ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | halt             ;
    -                          | -          | -                      | -                  | -                ;
    // functio minimo
minimo:
    // marco de 12 bytes
    subi r14, r14, #12         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #4(r14)         | -                  | -                ;
    -                          | -          | sw r7, #0(r14)         | -                  | -                ;
__minimo_cuerpo:
    // Nova fuente: linea 3
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c11_si   ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | br.al __c11_fin  ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
__c11_si:
    // Nova fuente: linea 3
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
__c11_fin:
    // Nova fuente: linea 3
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 3
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | br.eq L0         ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | lw r6, #4(r14)         | -                  | -                ;
    // Nova fuente: linea 3
    addi r14, r14, #12         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
L0:
    // Nova fuente: linea 4
    -                          | -          | lw r6, #0(r14)         | -                  | -                ;
    // Nova fuente: linea 4
    addi r14, r14, #12         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // functio fusionar
fusionar:
    // marco de 60 bytes
    subi r14, r14, #60         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #32(r14)        | -                  | -                ;
    -                          | -          | sw r7, #36(r14)        | -                  | -                ;
    -                          | -          | sw r8, #24(r14)        | -                  | -                ;
    -                          | -          | sw r9, #28(r14)        | -                  | -                ;
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    -                          | -          | lw r10, #64(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    -                          | -          | lw r10, #68(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
__fusionar_cuerpo:
    // Nova fuente: linea 8
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L1:
    // Nova fuente: linea 10
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r11, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | br.lt __c12_si   ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | br.al __c12_fin  ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
__c12_si:
    // Nova fuente: linea 10
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
__c12_fin:
    // Nova fuente: linea 10
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | br.eq L3         ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #16(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c13_si   ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.al __c13_fin  ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
__c13_si:
    // Nova fuente: linea 11
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
__c13_fin:
    // Nova fuente: linea 11
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.eq L4         ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #12(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ge __c14_si   ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.al __c14_fin  ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
__c14_si:
    // Nova fuente: linea 11
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
__c14_fin:
    // Nova fuente: linea 11
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.ne L6         ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #40(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango12_ok ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
__rango12_ok:
    // Nova fuente: linea 11
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango13_ok ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
__rango13_ok:
    // Nova fuente: linea 11
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    cmp r11, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.ge __c15_si   ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.al __c15_fin  ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
__c15_si:
    // Nova fuente: linea 11
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
__c15_fin:
    // Nova fuente: linea 11
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.al L7         ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
L6:
    // Nova fuente: linea 11
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
L7:
    // Nova fuente: linea 11
    -                          | -          | lw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.al L5         ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
L4:
    // Nova fuente: linea 11
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #44(r14)       | -                  | -                ;
L5:
    // Nova fuente: linea 11
    -                          | -          | lw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.eq L8         ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #40(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango14_ok ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
__rango14_ok:
    // Nova fuente: linea 12
    -                          | -          | lw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #40(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango15_ok ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
__rango15_ok:
    // Nova fuente: linea 12
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #40(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L9         ;
    -                          | -          | -                      | -                  | -                ;
L8:
    // Nova fuente: linea 15
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | br.ltu __rango16_ok ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
__rango16_ok:
    // Nova fuente: linea 15
    -                          | -          | lw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | br.ltu __rango17_ok ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
__rango17_ok:
    // Nova fuente: linea 15
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #40(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L9:
L2:
    // Nova fuente: linea 10
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r11, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L1         ;
    -                          | -          | -                      | -                  | -                ;
L3:
    // Nova fuente: linea 19
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L10:
    // Nova fuente: linea 19
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #12(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c16_si   ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | br.al __c16_fin  ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
__c16_si:
    // Nova fuente: linea 19
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
__c16_fin:
    // Nova fuente: linea 19
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
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
    -                          | -          | lw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #40(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango18_ok ;
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
__rango18_ok:
    // Nova fuente: linea 20
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #40(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango19_ok ;
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
__rango19_ok:
    // Nova fuente: linea 20
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
L11:
    // Nova fuente: linea 19
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #40(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L10        ;
    -                          | -          | -                      | -                  | -                ;
L12:
    // Nova fuente: linea 6
    addi r14, r14, #60         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // functio merge_sort
merge_sort:
    // marco de 60 bytes, guarda R15 en #56(r14)
    subi r14, r14, #60         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #56(r14)       | -                  | -                ;
    -                          | -          | sw r6, #40(r14)        | -                  | -                ;
    -                          | -          | sw r7, #44(r14)        | -                  | -                ;
    -                          | -          | sw r8, #32(r14)        | -                  | -                ;
    -                          | -          | sw r9, #36(r14)        | -                  | -                ;
__merge_sort_cuerpo:
    // Nova fuente: linea 24
    -                          | -          | lw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
L13:
    // Nova fuente: linea 26
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | lw r11, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | br.lt __c17_si   ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | br.al __c17_fin  ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
__c17_si:
    // Nova fuente: linea 26
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
__c17_fin:
    // Nova fuente: linea 26
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 26
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | br.eq L14        ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
L15:
    // Nova fuente: linea 28
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | lw r11, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | br.lt __c18_si   ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | br.al __c18_fin  ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
__c18_si:
    // Nova fuente: linea 28
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
__c18_fin:
    // Nova fuente: linea 28
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 28
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | br.eq L16        ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    -                          | -          | lw r7, #28(r14)        | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    movi r11, #160             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r6, #48(r14)        | -                  | -                ;
    // Nova fuente: linea 29
    mov r10, r6                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 30
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    -                          | -          | lw r7, #28(r14)        | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    movi r11, #160             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r6, #48(r14)        | -                  | -                ;
    // Nova fuente: linea 30
    mov r10, r6                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    mov r9, r10                | -          | -                      | -                  | -                ;
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 31
    movi r11, #800             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L15        ;
    -                          | -          | -                      | -                  | -                ;
L16:
    // Nova fuente: linea 34
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | lw r11, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L13        ;
    -                          | -          | -                      | -                  | -                ;
L14:
    // Nova fuente: linea 23
    -                          | -          | lw r15, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 23
    addi r14, r14, #60         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | -                ;
    // functio principale
principale:
    // marco de 92 bytes, guarda R15 en #88(r14)
    subi r14, r14, #92         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #88(r14)       | -                  | -                ;
__principale_cuerpo:
    // Nova fuente: linea 38
    movi r10, #38              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    addi r11, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #27              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    addi r11, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #43              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    addi r11, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    addi r11, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #9               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    addi r11, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #82              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    addi r11, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #6               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    addi r11, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #7               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    addi r11, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 40
    addi r10, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    movi r10, #8               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    addi r10, r14, #8          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    movi r10, #8               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    mov r9, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | jal.al merge_sort ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 42
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L17:
    // Nova fuente: linea 42
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | lw r11, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 42
    movi r10, #8               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | lw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | lw r11, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | br.lt __c19_si   ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | br.al __c19_fin  ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
__c19_si:
    // Nova fuente: linea 42
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
__c19_fin:
    // Nova fuente: linea 42
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 42
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | br.eq L19        ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    movi r10, #8               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | lw r11, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | br.ltu __rango20_ok ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
__rango20_ok:
    // Nova fuente: linea 43
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    addi r11, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    movi r10, #8               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | br.ltu __rango21_ok ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
__rango21_ok:
    // Nova fuente: linea 43
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    addi r11, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    cmp r11, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | br.lt __c20_si   ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | br.al __c20_fin  ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
__c20_si:
    // Nova fuente: linea 43
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
__c20_fin:
    // Nova fuente: linea 43
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | br.eq L20        ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L20:
L18:
    // Nova fuente: linea 42
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | lw r11, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L17        ;
    -                          | -          | -                      | -                  | -                ;
L19:
    // Nova fuente: linea 45
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r11, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | br.eq __c21_si   ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | br.al __c21_fin  ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
__c21_si:
    // Nova fuente: linea 45
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
__c21_fin:
    // Nova fuente: linea 45
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | br.eq L21        ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    movi r10, #100             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    movi r10, #8               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | br.ltu __rango22_ok ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
__rango22_ok:
    // Nova fuente: linea 45
    -                          | -          | lw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    addi r11, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r11, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    movi r10, #7               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    movi r10, #8               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | br.ltu __rango23_ok ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
__rango23_ok:
    // Nova fuente: linea 45
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    addi r11, r14, #40         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 45
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 45
    -                          | -          | -                      | -                  | -                ;
L21:
    // Nova fuente: linea 46
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 46
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 46
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 46
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 46
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 46
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 46
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 46
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 46
    -                          | -          | -                      | -                  | -                ;

// fin del programa
