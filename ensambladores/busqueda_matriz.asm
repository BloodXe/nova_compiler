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
    // functio buscar
buscar:
    // marco de 44 bytes
    subi r14, r14, #44         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #20(r14)        | -                  | -                ;
    -                          | -          | sw r7, #24(r14)        | -                  | -                ;
    -                          | -          | sw r8, #28(r14)        | -                  | -                ;
    -                          | -          | sw r9, #16(r14)        | -                  | -                ;
    -                          | -          | lw r10, #44(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    -                          | -          | lw r10, #48(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
__buscar_cuerpo:
    // Nova fuente: linea 5
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #36(r14)       | -                  | -                ;
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
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    neg r10, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
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
    -                          | -          | lw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 6
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #36(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango9_ok ;
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
__rango9_ok:
    // Nova fuente: linea 6
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    neg r10, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 7
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L0:
    // Nova fuente: linea 7
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c3_si    ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | br.al __c3_fin   ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
__c3_si:
    // Nova fuente: linea 7
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
__c3_fin:
    // Nova fuente: linea 7
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | br.eq L2         ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L3:
    // Nova fuente: linea 8
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | br.lt __c4_si    ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | br.al __c4_fin   ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
__c4_si:
    // Nova fuente: linea 8
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
__c4_fin:
    // Nova fuente: linea 8
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | br.eq L5         ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | br.ltu __rango10_ok ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
__rango10_ok:
    // Nova fuente: linea 9
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | br.ltu __rango11_ok ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
__rango11_ok:
    // Nova fuente: linea 9
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    add r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    cmp r10, r11               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | br.eq __c5_si    ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | br.al __c5_fin   ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
__c5_si:
    // Nova fuente: linea 9
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
__c5_fin:
    // Nova fuente: linea 9
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | br.eq L6         ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r11, #36(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango12_ok ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
__rango12_ok:
    // Nova fuente: linea 10
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 11
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #36(r14)       | -                  | -                ;
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
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 12
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    addi r14, r14, #44         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
L6:
L4:
    // Nova fuente: linea 8
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L3         ;
    -                          | -          | -                      | -                  | -                ;
L5:
L1:
    // Nova fuente: linea 7
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L0         ;
    -                          | -          | -                      | -                  | -                ;
L2:
    // Nova fuente: linea 16
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    addi r14, r14, #44         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // functio principale
principale:
    // marco de 68 bytes, guarda R15 en #64(r14)
    subi r14, r14, #68         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #64(r14)       | -                  | -                ;
__principale_cuerpo:
    // Nova fuente: linea 20
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    addi r11, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    addi r11, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    addi r11, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 21
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
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
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 21
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
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
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 21
    movi r10, #6               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
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
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 22
    movi r10, #7               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    movi r10, #6               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    addi r11, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 22
    movi r10, #8               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    movi r10, #7               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    addi r11, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 22
    movi r10, #9               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    movi r10, #8               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    addi r11, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 24
    addi r10, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #6               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    mov r9, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    addi r10, r14, #8          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 24
    movi r11, #112             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r6, #52(r14)        | -                  | -                ;
    // Nova fuente: linea 24
    mov r10, r6                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | br.eq L7         ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
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
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | lw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
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
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
L7:
    // Nova fuente: linea 27
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 27
    neg r10, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 27
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;

// fin del programa
