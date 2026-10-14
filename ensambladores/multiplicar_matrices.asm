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
    // marco de 100 bytes
    subi r14, r14, #100        | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
__principale_cuerpo:
    // Nova fuente: linea 5
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
L0:
    // Nova fuente: linea 5
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c0_si    ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | br.eq L2         ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
L3:
    // Nova fuente: linea 6
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c1_si    ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | br.al __c1_fin   ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
__c1_si:
    // Nova fuente: linea 6
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
__c1_fin:
    // Nova fuente: linea 6
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | br.eq L5         ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | br.ltu __rango0_ok ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
__rango0_ok:
    // Nova fuente: linea 7
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | br.ltu __rango1_ok ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
__rango1_ok:
    // Nova fuente: linea 7
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    addi r11, r14, #56         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
L4:
    // Nova fuente: linea 6
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L3         ;
    -                          | -          | -                      | -                  | -                ;
L5:
L1:
    // Nova fuente: linea 5
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L0         ;
    -                          | -          | -                      | -                  | -                ;
L2:
    // Nova fuente: linea 10
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
L6:
    // Nova fuente: linea 10
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c2_si    ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | br.al __c2_fin   ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
__c2_si:
    // Nova fuente: linea 10
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
__c2_fin:
    // Nova fuente: linea 10
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | br.eq L8         ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
L9:
    // Nova fuente: linea 11
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c3_si    ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.al __c3_fin   ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
__c3_si:
    // Nova fuente: linea 11
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
__c3_fin:
    // Nova fuente: linea 11
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.eq L11        ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango2_ok ;
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
__rango2_ok:
    // Nova fuente: linea 12
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango3_ok ;
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
__rango3_ok:
    // Nova fuente: linea 12
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #84(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    movi r10, #7               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    addi r11, r14, #32         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
L10:
    // Nova fuente: linea 11
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L9         ;
    -                          | -          | -                      | -                  | -                ;
L11:
L7:
    // Nova fuente: linea 10
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L6         ;
    -                          | -          | -                      | -                  | -                ;
L8:
    // Nova fuente: linea 15
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
L12:
    // Nova fuente: linea 15
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c4_si    ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | br.al __c4_fin   ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
__c4_si:
    // Nova fuente: linea 15
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
__c4_fin:
    // Nova fuente: linea 15
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | br.eq L14        ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
L15:
    // Nova fuente: linea 16
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c5_si    ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | br.al __c5_fin   ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
__c5_si:
    // Nova fuente: linea 16
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
__c5_fin:
    // Nova fuente: linea 16
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | br.eq L17        ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 18
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L18:
    // Nova fuente: linea 18
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c6_si    ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | br.al __c6_fin   ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
__c6_si:
    // Nova fuente: linea 18
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
__c6_fin:
    // Nova fuente: linea 18
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | br.eq L20        ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    addi r11, r14, #56         | -          | -                      | -                  | -                ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango6_ok ;
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
__rango6_ok:
    // Nova fuente: linea 19
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango7_ok ;
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
__rango7_ok:
    // Nova fuente: linea 19
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    addi r11, r14, #32         | -          | -                      | -                  | -                ;
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
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L19:
    // Nova fuente: linea 18
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L18        ;
    -                          | -          | -                      | -                  | -                ;
L20:
    // Nova fuente: linea 21
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango8_ok ;
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
__rango8_ok:
    // Nova fuente: linea 21
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango9_ok ;
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
__rango9_ok:
    // Nova fuente: linea 21
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    addi r11, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
L16:
    // Nova fuente: linea 16
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L15        ;
    -                          | -          | -                      | -                  | -                ;
L17:
L13:
    // Nova fuente: linea 15
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #80(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L12        ;
    -                          | -          | -                      | -                  | -                ;
L14:
    // Nova fuente: linea 24
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | br.ltu __rango10_ok ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
__rango10_ok:
    // Nova fuente: linea 24
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | br.ltu __rango11_ok ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
__rango11_ok:
    // Nova fuente: linea 24
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    addi r11, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | br.ltu __rango12_ok ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
__rango12_ok:
    // Nova fuente: linea 24
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | br.ltu __rango13_ok ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
__rango13_ok:
    // Nova fuente: linea 24
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #96(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    addi r11, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | br.ltu __rango14_ok ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
__rango14_ok:
    // Nova fuente: linea 24
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | br.ltu __rango15_ok ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
__rango15_ok:
    // Nova fuente: linea 24
    -                          | -          | lw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #96(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    addi r11, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | br.ltu __rango16_ok ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
__rango16_ok:
    // Nova fuente: linea 24
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | br.ltu __rango17_ok ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
__rango17_ok:
    // Nova fuente: linea 24
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #96(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    addi r11, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
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
