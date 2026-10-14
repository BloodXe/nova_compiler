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
    // marco de 4028 bytes
    subi r14, r14, #4028       | -          | -                      | -                  | -                ;
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
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 4
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L0:
    // Nova fuente: linea 6
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c0_si    ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | br.al __c0_fin   ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
__c0_si:
    // Nova fuente: linea 6
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
__c0_fin:
    // Nova fuente: linea 6
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 6
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | br.eq L2         ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L3:
    // Nova fuente: linea 8
    movi r10, #100             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c1_si    ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | br.al __c1_fin   ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
__c1_si:
    // Nova fuente: linea 8
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
__c1_fin:
    // Nova fuente: linea 8
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 7
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | br.eq L5         ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango0_ok ;
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
__rango0_ok:
    // Nova fuente: linea 9
    movi r10, #100             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango1_ok ;
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
__rango1_ok:
    // Nova fuente: linea 9
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 9
    movi r10, #100             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r11, #4012(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4016(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #4008(r14)     | -                  | -                ;
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
    -                          | -          | lw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 10
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.eq __c2_si    ;
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
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 10
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | br.eq L6         ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    movi r10, #37              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r11, #4012(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.eq __c3_si    ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | br.al __c3_fin   ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
__c3_si:
    // Nova fuente: linea 10
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
__c3_fin:
    // Nova fuente: linea 10
    -                          | -          | sw r10, #4016(r14)     | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | br.al L7         ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
L6:
    // Nova fuente: linea 10
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
L7:
    // Nova fuente: linea 10
    -                          | -          | lw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
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
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango2_ok ;
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
__rango2_ok:
    // Nova fuente: linea 11
    movi r10, #100             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango3_ok ;
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
__rango3_ok:
    // Nova fuente: linea 11
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 11
    movi r10, #5000            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
L8:
L4:
    // Nova fuente: linea 8
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L3         ;
    -                          | -          | -                      | -                  | -                ;
L5:
L1:
    // Nova fuente: linea 6
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 6
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
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L9:
    // Nova fuente: linea 16
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c4_si    ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | br.al __c4_fin   ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
__c4_si:
    // Nova fuente: linea 16
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
__c4_fin:
    // Nova fuente: linea 16
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 16
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | br.eq L11        ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L12:
    // Nova fuente: linea 18
    movi r10, #100             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c5_si    ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | br.al __c5_fin   ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
__c5_si:
    // Nova fuente: linea 18
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
__c5_fin:
    // Nova fuente: linea 18
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 17
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | br.eq L14        ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    movi r10, #100             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
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
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #4016(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #4016(r14)     | -                  | -                ;
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
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #4016(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    movi r10, #100             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | sw r10, #4020(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #4016(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #4020(r14)     | -                  | -                ;
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
    -                          | -          | lw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #4020(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4024(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #4016(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
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
    -                          | -          | sw r10, #4016(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | lw r11, #4016(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c6_si    ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | br.al __c6_fin   ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
__c6_si:
    // Nova fuente: linea 19
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
__c6_fin:
    // Nova fuente: linea 19
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 19
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | br.eq L15        ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #4012(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango8_ok ;
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
__rango8_ok:
    // Nova fuente: linea 20
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #100             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #4016(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #4016(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango9_ok ;
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
__rango9_ok:
    // Nova fuente: linea 20
    -                          | -          | lw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #4016(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4020(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #4012(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #4012(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango10_ok ;
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
__rango10_ok:
    // Nova fuente: linea 20
    movi r10, #100             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #4012(r14)     | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango11_ok ;
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
__rango11_ok:
    // Nova fuente: linea 20
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #4012(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4016(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
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
    -                          | -          | sw r10, #4016(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #4016(r14)     | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
L15:
L13:
    // Nova fuente: linea 18
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L12        ;
    -                          | -          | -                      | -                  | -                ;
L14:
L10:
    // Nova fuente: linea 16
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #4008(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L9         ;
    -                          | -          | -                      | -                  | -                ;
L11:
    // Nova fuente: linea 25
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #4012(r14)     | -                  | -                ;
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
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #100             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #4016(r14)     | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #4012(r14)     | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #4016(r14)     | -                  | -                ;
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
    -                          | -          | lw r10, #4008(r14)     | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #4016(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4020(r14)     | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r11, #4012(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4008(r14)     | -                  | -                ;
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
    -                          | -          | sw r10, #4012(r14)     | -                  | -                ;
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

// fin del programa
