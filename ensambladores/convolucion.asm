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
    .word 38
    .byte 0x65, 0x72, 0x72, 0x6F, 0x72, 0x3A, 0x20, 0x65, 0x6C, 0x20, 0x6B, 0x65
    .byte 0x72, 0x6E, 0x65, 0x6C, 0x20, 0x64, 0x65, 0x62, 0x65, 0x20, 0x74, 0x65
    .byte 0x6E, 0x65, 0x72, 0x20, 0x6C, 0x61, 0x64, 0x6F, 0x20, 0x69, 0x6D, 0x70
    .byte 0x61, 0x72
    .space 2   // alineacion a palabra
__str1:
    .word 10
    .byte 0x72, 0x65, 0x73, 0x75, 0x6C, 0x74, 0x61, 0x64, 0x6F, 0x3A
    .space 2   // alineacion a palabra
__str2:
    .word 10
    .byte 0x70, 0x72, 0x6F, 0x6D, 0x65, 0x64, 0x69, 0x6F, 0x20, 0x3D
    .space 2   // alineacion a palabra
__str3:
    .word 8
    .byte 0x6D, 0x61, 0x78, 0x69, 0x6D, 0x6F, 0x20, 0x3D
__str4:
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
    movi r11, #8864            | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | jalr.al r11      ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | halt             ;
    -                          | -          | -                      | -                  | -                ;
    // functio convolucionar
convolucionar:
    // marco de 100 bytes, guarda R15 en #96(r14)
    subi r14, r14, #100        | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #96(r14)       | -                  | -                ;
    -                          | -          | sw r6, #64(r14)        | -                  | -                ;
    -                          | -          | sw r7, #68(r14)        | -                  | -                ;
    -                          | -          | sw r8, #72(r14)        | -                  | -                ;
    -                          | -          | sw r9, #52(r14)        | -                  | -                ;
    -                          | -          | lw r10, #100(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #56(r14)       | -                  | -                ;
    -                          | -          | lw r10, #104(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #60(r14)       | -                  | -                ;
    -                          | -          | lw r10, #108(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #40(r14)       | -                  | -                ;
    -                          | -          | lw r10, #112(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #44(r14)       | -                  | -                ;
    -                          | -          | lw r10, #116(r14)      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r10, #48(r14)       | -                  | -                ;
__convolucionar_cuerpo:
    // Nova fuente: linea 7
    -                          | -          | lw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | lw r6, #76(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    movi r11, #36448           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r6, #84(r14)        | -                  | -                ;
    // Nova fuente: linea 9
    mov r10, r6                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 9
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
L0:
    // Nova fuente: linea 10
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c14_si   ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | br.al __c14_fin  ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
__c14_si:
    // Nova fuente: linea 10
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
__c14_fin:
    // Nova fuente: linea 10
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | br.eq L2         ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
L3:
    // Nova fuente: linea 11
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #32(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.lt __c15_si   ;
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
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | br.eq L5         ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    neg r10, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
L6:
    // Nova fuente: linea 13
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    cmp r11, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | br.ge __c16_si   ;
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
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
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
    -                          | -          | lw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    neg r10, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
L9:
    // Nova fuente: linea 14
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r11, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    cmp r11, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | br.ge __c17_si   ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | br.al __c17_fin  ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
__c17_si:
    // Nova fuente: linea 14
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
__c17_fin:
    // Nova fuente: linea 14
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | br.eq L11        ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #12(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r10, #36(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    sub r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    movi r11, #22320           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r6, #76(r14)        | -                  | -                ;
    // Nova fuente: linea 15
    mov r10, r6                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 15
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #8(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r10, #32(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    sub r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    movi r11, #22320           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r6, #76(r14)        | -                  | -                ;
    // Nova fuente: linea 16
    mov r10, r6                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #68(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango16_ok ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
__rango16_ok:
    // Nova fuente: linea 17
    -                          | -          | lw r10, #72(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango17_ok ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
__rango17_ok:
    // Nova fuente: linea 17
    -                          | -          | lw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #0(r14)        | -                  | -                ;
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
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #64(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #28(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #56(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #84(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango18_ok ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
__rango18_ok:
    // Nova fuente: linea 17
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #28(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #60(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango19_ok ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    movi r6, #134              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
__rango19_ok:
    // Nova fuente: linea 17
    -                          | -          | lw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #88(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #92(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #84(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #52(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #84(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    mul r10, r10, r11          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
L10:
    // Nova fuente: linea 14
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L9         ;
    -                          | -          | -                      | -                  | -                ;
L11:
L7:
    // Nova fuente: linea 13
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L6         ;
    -                          | -          | -                      | -                  | -                ;
L8:
    // Nova fuente: linea 20
    -                          | -          | lw r10, #44(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango20_ok ;
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
__rango20_ok:
    // Nova fuente: linea 20
    -                          | -          | lw r10, #48(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
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
    -                          | -          | -                      | -                  | br.ltu __rango21_ok ;
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
__rango21_ok:
    // Nova fuente: linea 20
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #20(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r11, #40(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | lw r10, #16(r14)       | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
L4:
    // Nova fuente: linea 11
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r10, #20(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 11
    -                          | -          | sw r10, #20(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L3         ;
    -                          | -          | -                      | -                  | -                ;
L5:
L1:
    // Nova fuente: linea 10
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #76(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | lw r11, #76(r14)       | -                  | -                ;
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
    -                          | -          | sw r10, #80(r14)       | -                  | -                ;
    // Nova fuente: linea 10
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    -                          | -          | -                      | -                  | br.al L0         ;
    -                          | -          | -                      | -                  | -                ;
L2:
    // Nova fuente: linea 5
    -                          | -          | lw r15, #96(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    addi r14, r14, #100        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | jr.al r15        ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // functio principale
principale:
    // marco de 268 bytes, guarda R15 en #264(r14)
    subi r14, r14, #268        | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #264(r14)      | -                  | -                ;
__principale_cuerpo:
    // Nova fuente: linea 25
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 25
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 26
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 26
    movi r10, #50              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    movi r10, #6               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 26
    movi r10, #50              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    movi r10, #7               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 26
    movi r10, #50              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    movi r10, #8               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 26
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    movi r10, #9               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 26
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 27
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 27
    movi r10, #50              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    movi r10, #11              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 27
    movi r10, #90              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    movi r10, #12              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 27
    movi r10, #50              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    movi r10, #13              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 27
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    movi r10, #14              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 27
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 28
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    movi r10, #15              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 28
    movi r10, #50              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    movi r10, #16              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 28
    movi r10, #50              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    movi r10, #17              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 28
    movi r10, #50              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    movi r10, #18              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 28
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    movi r10, #19              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 28
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #20              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #21              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #22              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #23              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #10              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    movi r10, #24              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    addi r11, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 29
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 30
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    addi r11, r14, #120        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 30
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    neg r10, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    addi r11, r14, #120        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | lw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 30
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    movi r10, #2               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    addi r11, r14, #120        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 30
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    neg r10, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #120        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #4               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #120        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    neg r10, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    addi r11, r14, #120        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | lw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 31
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 32
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 32
    movi r10, #6               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 32
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    addi r11, r14, #120        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 32
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 32
    neg r10, r10               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 32
    movi r10, #7               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 32
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    addi r11, r14, #120        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | lw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 32
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 32
    movi r10, #8               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 32
    slli r10, r10, #2          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    addi r11, r14, #120        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    add r11, r11, r10          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | lw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 32
    -                          | -          | sw r10, #0(r11)        | -                  | -                ;
    // Nova fuente: linea 34
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | jal.al m_matriz_97f8eec4$es_impar ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | sw r6, #256(r14)       | -                  | -                ;
    // Nova fuente: linea 34
    mov r10, r6                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | br.eq __n1_si    ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | br.al __n1_fin   ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
__n1_si:
    // Nova fuente: linea 34
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
__n1_fin:
    // Nova fuente: linea 34
    -                          | -          | sw r10, #260(r14)      | -                  | -                ;
    // Nova fuente: linea 34
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | br.eq L12        ;
    // Nova fuente: linea 34
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    movi r10, #8192            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    movi r11, #40208           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    movi r11, #42528           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 35
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 36
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 36
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 36
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 36
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 36
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 36
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 36
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 36
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 36
    -                          | -          | -                      | -                  | -                ;
L12:
    // Nova fuente: linea 38
    addi r10, r14, #156        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    addi r10, r14, #120        | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r9, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #3               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    -                          | -          | sw r10, #4(r14)        | -                  | -                ;
    // Nova fuente: linea 38
    addi r10, r14, #20         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    -                          | -          | sw r10, #8(r14)        | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 38
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 38
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    -                          | -          | sw r10, #16(r14)       | -                  | -                ;
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
    movi r10, #8236            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    movi r11, #40208           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    movi r11, #42528           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 39
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    addi r10, r14, #20         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | jal.al m_matriz_97f8eec4$imprimir ;
    // Nova fuente: linea 40
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    movi r10, #8252            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    movi r11, #40208           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    addi r10, r14, #20         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    movi r11, #30368           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | sw r6, #256(r14)       | -                  | -                ;
    // Nova fuente: linea 41
    movi r11, #38352           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    movi r11, #42528           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 41
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    movi r10, #8268            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    movi r11, #40208           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    addi r10, r14, #20         | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r7, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    movi r10, #5               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    mov r8, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    movi r11, #31264           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | sw r6, #256(r14)       | -                  | -                ;
    // Nova fuente: linea 42
    movi r11, #38352           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    movi r11, #42528           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 42
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | sw r10, #256(r14)      | -                  | -                ;
    // Nova fuente: linea 43
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 43
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 43
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
    -                          | -          | -                      | -                  | br.lt __c18_si   ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | br.al __c18_fin  ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
__c18_si:
    // Nova fuente: linea 3
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
__c18_fin:
    // Nova fuente: linea 3
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 3
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 3
    -                          | -          | -                      | -                  | br.eq L13        ;
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
    -                          | -          | -                      | -                  | br.al L14        ;
    -                          | -          | -                      | -                  | -                ;
L13:
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
    -                          | -          | -                      | -                  | br.lt __c19_si   ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | br.al __c19_fin  ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
__c19_si:
    // Nova fuente: linea 5
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
__c19_fin:
    // Nova fuente: linea 5
    -                          | -          | sw r10, #12(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | br.eq L15        ;
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
    -                          | -          | -                      | -                  | br.al L16        ;
    -                          | -          | -                      | -                  | -                ;
L15:
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
L16:
L14:
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
L17:
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
    -                          | -          | -                      | -                  | br.lt __c20_si   ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | br.al __c20_fin  ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
__c20_si:
    // Nova fuente: linea 12
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
__c20_fin:
    // Nova fuente: linea 12
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 12
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 12
    -                          | -          | -                      | -                  | br.eq L19        ;
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
L20:
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
    -                          | -          | -                      | -                  | br.lt __c21_si   ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | br.al __c21_fin  ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
__c21_si:
    // Nova fuente: linea 13
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
__c21_fin:
    // Nova fuente: linea 13
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 13
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 13
    -                          | -          | -                      | -                  | br.eq L22        ;
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
    -                          | -          | -                      | -                  | br.ltu __rango22_ok ;
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
__rango22_ok:
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
    -                          | -          | -                      | -                  | br.ltu __rango23_ok ;
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
__rango23_ok:
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
    movi r11, #38352           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 14
    -                          | -          | -                      | -                  | -                ;
L21:
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
    -                          | -          | -                      | -                  | br.al L20        ;
    -                          | -          | -                      | -                  | -                ;
L22:
    // Nova fuente: linea 16
    movi r10, #8280            | -          | -                      | -                  | -                ;
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
    movi r11, #40208           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    movi r11, #42528           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | jalr.al r11      ;
    // Nova fuente: linea 16
    -                          | -          | -                      | -                  | -                ;
L18:
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
    -                          | -          | -                      | -                  | br.al L17        ;
    -                          | -          | -                      | -                  | -                ;
L19:
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
    movi r11, #36448           | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | jalr.al r11      ;
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
    -                          | -          | -                      | -                  | br.eq __c22_si   ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | br.al __c22_fin  ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
__c22_si:
    // Nova fuente: linea 20
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 20
    -                          | -          | -                      | -                  | -                ;
__c22_fin:
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
    // functio m_estadistica_bef03ac1$total
m_estadistica_bef03ac1$total:
    // marco de 32 bytes
    subi r14, r14, #32         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #12(r14)        | -                  | -                ;
    -                          | -          | sw r7, #16(r14)        | -                  | -                ;
    -                          | -          | sw r8, #20(r14)        | -                  | -                ;
__m_estadistica_bef03ac1$total_cuerpo:
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
L23:
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
    -                          | -          | -                      | -                  | br.lt __c23_si   ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | br.al __c23_fin  ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
__c23_si:
    // Nova fuente: linea 4
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
__c23_fin:
    // Nova fuente: linea 4
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 4
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 4
    -                          | -          | -                      | -                  | br.eq L25        ;
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
L26:
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
    -                          | -          | -                      | -                  | br.lt __c24_si   ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | br.al __c24_fin  ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
__c24_si:
    // Nova fuente: linea 5
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
__c24_fin:
    // Nova fuente: linea 5
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 5
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 5
    -                          | -          | -                      | -                  | br.eq L28        ;
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
    -                          | -          | -                      | -                  | br.ltu __rango24_ok ;
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
__rango24_ok:
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
    -                          | -          | -                      | -                  | br.ltu __rango25_ok ;
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
__rango25_ok:
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
L27:
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
    -                          | -          | -                      | -                  | br.al L26        ;
    -                          | -          | -                      | -                  | -                ;
L28:
L24:
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
    -                          | -          | -                      | -                  | br.al L23        ;
    -                          | -          | -                      | -                  | -                ;
L25:
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
    // functio m_estadistica_bef03ac1$promedio
m_estadistica_bef03ac1$promedio:
    // marco de 32 bytes, guarda R15 en #28(r14)
    subi r14, r14, #32         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #28(r14)       | -                  | -                ;
    -                          | -          | sw r6, #4(r14)         | -                  | -                ;
    -                          | -          | sw r7, #8(r14)         | -                  | -                ;
    -                          | -          | sw r8, #12(r14)        | -                  | -                ;
__m_estadistica_bef03ac1$promedio_cuerpo:
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
    -                          | -          | -                      | -                  | jal.al m_estadistica_bef03ac1$total ;
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
    // functio m_estadistica_bef03ac1$maximo
m_estadistica_bef03ac1$maximo:
    // marco de 40 bytes
    subi r14, r14, #40         | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r6, #12(r14)        | -                  | -                ;
    -                          | -          | sw r7, #16(r14)        | -                  | -                ;
    -                          | -          | sw r8, #20(r14)        | -                  | -                ;
__m_estadistica_bef03ac1$maximo_cuerpo:
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
    -                          | -          | -                      | -                  | br.ltu __rango26_ok ;
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
__rango26_ok:
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
    -                          | -          | -                      | -                  | br.ltu __rango27_ok ;
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
__rango27_ok:
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
L29:
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
    -                          | -          | -                      | -                  | br.lt __c25_si   ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | br.al __c25_fin  ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
__c25_si:
    // Nova fuente: linea 17
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
__c25_fin:
    // Nova fuente: linea 17
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 17
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 17
    -                          | -          | -                      | -                  | br.eq L31        ;
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
L32:
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
    -                          | -          | -                      | -                  | br.lt __c26_si   ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | br.al __c26_fin  ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
__c26_si:
    // Nova fuente: linea 18
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
__c26_fin:
    // Nova fuente: linea 18
    -                          | -          | sw r10, #28(r14)       | -                  | -                ;
    // Nova fuente: linea 18
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 18
    -                          | -          | -                      | -                  | br.eq L34        ;
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
    -                          | -          | -                      | -                  | br.ltu __rango28_ok ;
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
__rango28_ok:
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
    -                          | -          | -                      | -                  | br.ltu __rango29_ok ;
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
__rango29_ok:
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
    -                          | -          | -                      | -                  | br.lt __c27_si   ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | br.al __c27_fin  ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
__c27_si:
    // Nova fuente: linea 19
    movi r10, #1               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
__c27_fin:
    // Nova fuente: linea 19
    -                          | -          | sw r10, #24(r14)       | -                  | -                ;
    // Nova fuente: linea 19
    cmpi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 19
    -                          | -          | -                      | -                  | br.eq L35        ;
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
    -                          | -          | -                      | -                  | br.ltu __rango30_ok ;
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
__rango30_ok:
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
    -                          | -          | -                      | -                  | br.ltu __rango31_ok ;
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
__rango31_ok:
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
L35:
L33:
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
    -                          | -          | -                      | -                  | br.al L32        ;
    -                          | -          | -                      | -                  | -                ;
L34:
L30:
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
    -                          | -          | -                      | -                  | br.al L29        ;
    -                          | -          | -                      | -                  | -                ;
L31:
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
