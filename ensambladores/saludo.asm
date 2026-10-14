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
    .word 12
    .byte 0x53, 0x61, 0x6C, 0x76, 0x65, 0x2C, 0x20, 0x6D, 0x75, 0x6E, 0x64, 0x65

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
    // marco de 8 bytes, guarda R15 en #4(r14)
    subi r14, r14, #8          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | -                      | -                  | -                ;
    -                          | -          | sw r15, #4(r14)        | -                  | -                ;
__principale_cuerpo:
    // Nova fuente: linea 6
    movi r10, #8192            | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | jal.al __scribe_txt ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | jal.al __dic_fin ;
    // Nova fuente: linea 6
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    movi r10, #42              | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | jal.al __scribe_int ;
    // Nova fuente: linea 7
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    movi r10, #0               | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | sw r10, #0(r14)        | -                  | -                ;
    // Nova fuente: linea 8
    mov r6, r10                | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | -                ;
    // Nova fuente: linea 8
    -                          | -          | -                      | -                  | halt             ;
    // Nova fuente: linea 8
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
    -                          | -          | -                      | -                  | br.al __scribe_int ;
    -                          | -          | -                      | -                  | -                ;

// fin del programa
