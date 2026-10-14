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
    .word 8
    .byte 0x6E, 0x65, 0x67, 0x61, 0x74, 0x69, 0x76, 0x6F
__str1:
    .word 11
    .byte 0x6E, 0x6F, 0x20, 0x6E, 0x65, 0x67, 0x61, 0x74, 0x69, 0x76, 0x6F
    .space 1   // alineacion a palabra
__str2:
    .word 0

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
    // functio etiqueta
etiqueta:
    // marco de 12 bytes
    subi r14, r14, #12         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #0(r14)         | -                  | -                ;
__etiqueta_cuerpo:
    // Nova fuente: linea 6
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r11, #4(r14)        | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c9_si    ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | br.al __c9_fin   ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
__c9_si:
    // Nova fuente: linea 6
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
__c9_fin:
    // Nova fuente: linea 6
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 6
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | br.eq L0         ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    movi r10, #8192            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 7
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    addi r14, r14, #12         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
L0:
    // Nova fuente: linea 9
    movi r10, #8204            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    addi r14, r14, #12         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // functio reduce
reduce:
    // marco de 36 bytes, guarda R15 en #32(r14)
    subi r14, r14, #36         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #32(r14)       | -                  | -                ;
    -                          | -          | sw r6, #12(r14)        | -                  | -                ;
    -                          | -          | sw r7, #16(r14)        | -                  | -                ;
    -                          | -          | sw r8, #8(r14)         | -                  | -                ;
__reduce_cuerpo:
    // Nova fuente: linea 13
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 14
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L1:
    // Nova fuente: linea 14
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c10_si   ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | br.al __c10_fin  ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
__c10_si:
    // Nova fuente: linea 14
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
__c10_fin:
    // Nova fuente: linea 14
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | br.eq L3         ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango5_ok ;
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
__rango5_ok:
    // Nova fuente: linea 15
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #12(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #24(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.eq __c11_si   ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | br.al __c11_fin  ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
__c11_si:
    // Nova fuente: linea 15
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
__c11_fin:
    // Nova fuente: linea 15
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | br.eq L4         ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | br.al L2         ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
L4:
    // Nova fuente: linea 18
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango6_ok ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
__rango6_ok:
    // Nova fuente: linea 18
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r11, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    cmp r11, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | br.lt __c12_si   ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | br.al __c12_fin  ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
__c12_si:
    // Nova fuente: linea 18
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
__c12_fin:
    // Nova fuente: linea 18
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | br.eq L5         ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | br.al L3         ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
L5:
    // Nova fuente: linea 21
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango7_ok ;
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
__rango7_ok:
    // Nova fuente: linea 21
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 21
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 22
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    sub r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 22
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 23
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 23
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 24
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | lw r6, #4(r14)         | -                  | -                ;
    // Nova fuente: linea 24
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    movi r11, #13872           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r6, #24(r14)        | -                  | -                ;
    // Nova fuente: linea 24
    mov r10, r6                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 24
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #1000            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r6, #4(r14)         | -                  | -                ;
    // Nova fuente: linea 25
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    movi r11, #13872           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r7, #24(r14)        | -                  | -                ;
    // Nova fuente: linea 25
    mov r10, r7                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L2:
    // Nova fuente: linea 14
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L1         ;
    -                          | -          | -                      | -                  | -                ;
L3:
    // Nova fuente: linea 27
    -                          | -          | lw r6, #4(r14)         | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | lw r15, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 27
    addi r14, r14, #36         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // functio principale
principale:
    // marco de 44 bytes, guarda R15 en #40(r14)
    subi r14, r14, #44         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #40(r14)       | -                  | -                ;
__principale_cuerpo:
    // Nova fuente: linea 31
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #8          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 32
    movi r10, #240             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 32
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    sra r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 33
    movi r10, #256             | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 33
    neg r10, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 33
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | lw r11, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    sra r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 33
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 34
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 34
    neg r10, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | jal.al etiqueta  ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | sw r6, #28(r14)        | -                  | -                ;
    // Nova fuente: linea 34
    movi r11, #17632           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    movi r11, #19952           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    addi r10, r14, #8          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | jal.al reduce    ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | sw r6, #28(r14)        | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | jal.al __scribe_int ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | lw r6, #4(r14)         | -                  | -                ;
    // Nova fuente: linea 36
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 36
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 36
    -                          | -          | -                      | -                  | jal.al __scribe_int ;
    // Nova fuente: linea 36
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | lw r6, #0(r14)         | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | jal.al __scribe_int ;
    // Nova fuente: linea 37
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | jal.al m_matriz_97f8eec4$limitar ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r6, #28(r14)        | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | jal.al __scribe_int ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
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
    // functio m_matriz_97f8eec4$limitar
m_matriz_97f8eec4$limitar:
    // marco de 16 bytes
    subi r14, r14, #16         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #8(r14)         | -                  | -                ;
    -                          | -          | sw r7, #4(r14)         | -                  | -                ;
    -                          | -          | sw r8, #0(r14)         | -                  | -                ;
__m_matriz_97f8eec4$limitar_cuerpo:
    // Nova fuente: linea 3
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | lw r11, #4(r14)        | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c13_si   ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | br.al __c13_fin  ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
__c13_si:
    // Nova fuente: linea 3
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
__c13_fin:
    // Nova fuente: linea 3
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | br.eq L6         ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | lw r6, #4(r14)         | -                  | -                ;
    // Nova fuente: linea 4
    addi r14, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L7         ;
    -                          | -          | -                      | -                  | -                ;
L6:
    // Nova fuente: linea 5
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    cmp r11, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | br.lt __c14_si   ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | br.al __c14_fin  ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
__c14_si:
    // Nova fuente: linea 5
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
__c14_fin:
    // Nova fuente: linea 5
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | br.eq L8         ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | lw r6, #0(r14)         | -                  | -                ;
    // Nova fuente: linea 6
    addi r14, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L9         ;
    -                          | -          | -                      | -                  | -                ;
L8:
    // Nova fuente: linea 8
    -                          | -          | lw r6, #8(r14)         | -                  | -                ;
    // Nova fuente: linea 8
    addi r14, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
L9:
L7:
    // Nova fuente: linea 2
    addi r14, r14, #16         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 2
    -                          | -          | -                      | -                  | -                ;
    // functio m_matriz_97f8eec4$imprimir
m_matriz_97f8eec4$imprimir:
    // marco de 32 bytes, guarda R15 en #28(r14)
    subi r14, r14, #32         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #28(r14)       | -                  | -                ;
    -                          | -          | sw r6, #8(r14)         | -                  | -                ;
    -                          | -          | sw r7, #12(r14)        | -                  | -                ;
    -                          | -          | sw r8, #16(r14)        | -                  | -                ;
__m_matriz_97f8eec4$imprimir_cuerpo:
    // Nova fuente: linea 12
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
L10:
    // Nova fuente: linea 12
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c15_si   ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | br.al __c15_fin  ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
__c15_si:
    // Nova fuente: linea 12
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
__c15_fin:
    // Nova fuente: linea 12
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | br.eq L12        ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
L13:
    // Nova fuente: linea 13
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c16_si   ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | br.al __c16_fin  ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
__c16_si:
    // Nova fuente: linea 13
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
__c16_fin:
    // Nova fuente: linea 13
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | br.eq L15        ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango8_ok ;
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
__rango8_ok:
    // Nova fuente: linea 14
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango9_ok ;
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
__rango9_ok:
    // Nova fuente: linea 14
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | jal.al __scribe_int ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
L14:
    // Nova fuente: linea 13
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L13        ;
    -                          | -          | -                      | -                  | -                ;
L15:
    // Nova fuente: linea 16
    movi r10, #8220            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | jal.al __scribe_txt ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | jal.al __dic_fin ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
L11:
    // Nova fuente: linea 12
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L10        ;
    -                          | -          | -                      | -                  | -                ;
L12:
    // Nova fuente: linea 11
    -                          | -          | lw r15, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    addi r14, r14, #32         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // functio m_matriz_97f8eec4$es_impar
m_matriz_97f8eec4$es_impar:
    // marco de 20 bytes, guarda R15 en #16(r14)
    subi r14, r14, #20         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #16(r14)       | -                  | -                ;
    -                          | -          | sw r6, #0(r14)         | -                  | -                ;
__m_matriz_97f8eec4$es_impar_cuerpo:
    // Nova fuente: linea 20
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r6, #0(r14)         | -                  | -                ;
    // Nova fuente: linea 20
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | jal.al __nova_div32 ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r7, #8(r14)         | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #4(r14)        | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.eq __c17_si   ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | br.al __c17_fin  ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
__c17_si:
    // Nova fuente: linea 20
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
__c17_fin:
    // Nova fuente: linea 20
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r15, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    addi r14, r14, #20         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 20
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
    -                          | -          | -                      | -                  | jal.al __scribe_int ;
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
    -                          | -          | -                      | -                  | jal.al __scribe_int ;
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
    -                          | -          | -                      | -                  | br.al __scribe_int ;
    -                          | -          | -                      | -                  | -                ;

// fin del programa
