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
    // marco de 72 bytes
    subi r14, r14, #72         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
__principale_cuerpo:
    // Nova fuente: linea 3
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L0:
    // Nova fuente: linea 4
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L3:
    // Nova fuente: linea 6
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
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
    // Nova fuente: linea 7
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
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
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #64(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    addi r11, r14, #12         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | lw r10, #64(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 6
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L6:
    // Nova fuente: linea 10
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L9:
    // Nova fuente: linea 11
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    addi r11, r14, #12         | -          | -                      | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #64(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
L10:
    // Nova fuente: linea 11
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r11, #60(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L6         ;
    -                          | -          | -                      | -                  | -                ;
L8:
    // Nova fuente: linea 15
    -                          | -          | lw r6, #8(r14)         | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;

// fin del programa
