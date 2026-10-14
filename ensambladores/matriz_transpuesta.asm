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
    // marco de 76 bytes
    subi r14, r14, #76         | -          | -                      | -                  | -                ;
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
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L0:
    // Nova fuente: linea 5
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L3:
    // Nova fuente: linea 7
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c1_si    ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | br.al __c1_fin   ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
__c1_si:
    // Nova fuente: linea 7
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
__c1_fin:
    // Nova fuente: linea 7
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
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
    // Nova fuente: linea 8
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango0_ok ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
__rango0_ok:
    // Nova fuente: linea 8
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango1_ok ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
__rango1_ok:
    // Nova fuente: linea 8
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r11, #64(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    addi r11, r14, #32         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 9
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango2_ok ;
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
__rango2_ok:
    // Nova fuente: linea 9
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango3_ok ;
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
__rango3_ok:
    // Nova fuente: linea 9
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #4(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango4_ok ;
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
__rango4_ok:
    // Nova fuente: linea 9
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango5_ok ;
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
__rango5_ok:
    // Nova fuente: linea 9
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    addi r11, r14, #32         | -          | -                      | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
L4:
    // Nova fuente: linea 7
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L0         ;
    -                          | -          | -                      | -                  | -                ;
L2:
    // Nova fuente: linea 13
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango6_ok ;
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
__rango6_ok:
    // Nova fuente: linea 13
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #64(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango7_ok ;
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
__rango7_ok:
    // Nova fuente: linea 13
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #21              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ne __c2_si    ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | br.al __c2_fin   ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
__c2_si:
    // Nova fuente: linea 13
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
__c2_fin:
    // Nova fuente: linea 13
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | br.ne L6         ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #64(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango8_ok ;
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
__rango8_ok:
    // Nova fuente: linea 13
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #68(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango9_ok ;
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
__rango9_ok:
    // Nova fuente: linea 13
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #64(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #22              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ne __c3_si    ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | br.al __c3_fin   ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
__c3_si:
    // Nova fuente: linea 13
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
__c3_fin:
    // Nova fuente: linea 13
    -                          | -          | sw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | br.al L7         ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
L6:
    // Nova fuente: linea 13
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
L7:
    // Nova fuente: linea 13
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | br.eq L8         ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    neg r10, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
L8:
    // Nova fuente: linea 16
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango10_ok ;
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
__rango10_ok:
    // Nova fuente: linea 16
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #64(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango11_ok ;
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
__rango11_ok:
    // Nova fuente: linea 16
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #64(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #100             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #56(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango12_ok ;
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
__rango12_ok:
    // Nova fuente: linea 16
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #68(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango13_ok ;
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
__rango13_ok:
    // Nova fuente: linea 16
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #68(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;

// fin del programa
