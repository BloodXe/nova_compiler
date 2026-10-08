#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "codegen.h"

// FUNCIONES AUXILIARES DE EMISIÓN DE BUNDLES Y PADDING

// Emite un bundle VLIW posicional de 5 slots terminado en punto y coma
// Formato: <S0: ALU-0> | <S1: ALU-1> | <S2: LSU> | <S3: CRP> | <S4: BRU> ;
static void emit_bundle(FILE *f, const char *s0, const char *s1, const char *s2, const char *s3, const char *s4) {
    fprintf(f, "%s | %s | %s | %s | %s ;\n",
            s0 ? s0 : "-",
            s1 ? s1 : "-",
            s2 ? s2 : "-",
            s3 ? s3 : "-",
            s4 ? s4 : "-");
}

// Modo conservador: Emite 2 bundles NOP vacíos tras instrucciones con latencia de datos
static void emit_latency_nop_padding(FILE *f) {
    emit_bundle(f, "-", "-", "-", "-", "-");
    emit_bundle(f, "-", "-", "-", "-", "-");
}

// Branch delay slot: Emite 1 bundle NOP vacío tras instrucciones de salto
static void emit_branch_delay_slot(FILE *f) {
    emit_bundle(f, "-", "-", "-", "-", "-");
}

// GENERACIÓN PRINCIPAL DE ENSAMBLADOR VLIW

void codegen_generate_vliw(TACList *tac, SymbolTable *st, FILE *out) {
    (void)st;
    if (!tac || !out) return;

    fprintf(out, "// ==========================================================\n");
    fprintf(out, "// Código Ensamblador VLIW para Arquitectura CERBERO-1\n");
    fprintf(out, "// Formato: <S0:ALU0> | <S1:ALU1> | <S2:LSU> | <S3:CRP> | <S4:BRU> ;\n");
    fprintf(out, "// ==========================================================\n\n");
    fprintf(out, ".text\n");
    fprintf(out, ".org 0x0000\n\n");

    for (TACInst *i = tac->head; i != NULL; i = i->next) {
        switch (i->op) {
            // ----------------------------------------------------------------
            // CONTROL DE FLUJO Y ETIQUETAS (Slot S4 - BRU)
            // ----------------------------------------------------------------
            case TAC_LABEL: {
                fprintf(out, "%s:\n", i->result);
                break;
            }
            case TAC_GOTO: {
                char buf[64];
                snprintf(buf, sizeof(buf), "br.al %s", i->result);
                emit_bundle(out, "-", "-", "-", "-", buf);
                emit_branch_delay_slot(out);
                break;
            }
            case TAC_IF_FALSE: {
                // Comparación en S0 (ALU-0) y salto condicional en S4 (BRU)
                char cmp_buf[64], br_buf[64];
                snprintf(cmp_buf, sizeof(cmp_buf), "cmpi %s, #0", i->arg1);
                emit_bundle(out, cmp_buf, "-", "-", "-", "-");
                emit_latency_nop_padding(out);

                snprintf(br_buf, sizeof(br_buf), "br.eq %s", i->result);
                emit_bundle(out, "-", "-", "-", "-", br_buf);
                emit_branch_delay_slot(out);
                break;
            }

            // ----------------------------------------------------------------
            // FUNCIONES Y LLAMADAS (Slot S4 - BRU / Slot S0 - ALU)
            // ----------------------------------------------------------------
            case TAC_PARAM: {
                char buf[64];
                snprintf(buf, sizeof(buf), "mov r0, %s", i->result);
                emit_bundle(out, buf, "-", "-", "-", "-");
                emit_latency_nop_padding(out);
                break;
            }
            case TAC_CALL: {
                char buf[64];
                snprintf(buf, sizeof(buf), "jal %s", i->result);
                emit_bundle(out, "-", "-", "-", "-", buf);
                emit_branch_delay_slot(out);
                break;
            }
            case TAC_RETURN: {
                emit_bundle(out, "-", "-", "-", "-", "jr r15");
                emit_branch_delay_slot(out);
                break;
            }

            // ----------------------------------------------------------------
            // ACCESO A MEMORIA (Slot S2 - LSU)
            // ----------------------------------------------------------------
            case TAC_LOAD: {
                char buf[64];
                snprintf(buf, sizeof(buf), "lw %s, 0(%s)", i->result, i->arg1);
                emit_bundle(out, "-", "-", buf, "-", "-");
                emit_latency_nop_padding(out);
                break;
            }
            case TAC_STORE: {
                char buf[64];
                snprintf(buf, sizeof(buf), "sw %s, 0(%s)", i->arg1, i->result);
                emit_bundle(out, "-", "-", buf, "-", "-");
                emit_latency_nop_padding(out);
                break;
            }

            // ----------------------------------------------------------------
            // ARITMÉTICA Y LÓGICA (Slot S0 / S1 - ALU)
            // ----------------------------------------------------------------
            case TAC_ASSIGN: {
                char buf[64];
                if (i->arg1 && (i->arg1[0] >= '0' && i->arg1[0] <= '9')) {
                    snprintf(buf, sizeof(buf), "movi %s, #%s", i->result, i->arg1);
                } else {
                    snprintf(buf, sizeof(buf), "mov %s, %s", i->result, i->arg1 ? i->arg1 : "r0");
                }
                emit_bundle(out, buf, "-", "-", "-", "-");
                emit_latency_nop_padding(out);
                break;
            }
            case TAC_ADD: {
                char buf[64];
                snprintf(buf, sizeof(buf), "add %s, %s, %s", i->result, i->arg1, i->arg2);
                emit_bundle(out, buf, "-", "-", "-", "-");
                emit_latency_nop_padding(out);
                break;
            }
            case TAC_SUB: {
                char buf[64];
                snprintf(buf, sizeof(buf), "sub %s, %s, %s", i->result, i->arg1, i->arg2);
                emit_bundle(out, buf, "-", "-", "-", "-");
                emit_latency_nop_padding(out);
                break;
            }
            case TAC_AND: {
                char buf[64];
                snprintf(buf, sizeof(buf), "and %s, %s, %s", i->result, i->arg1, i->arg2);
                emit_bundle(out, buf, "-", "-", "-", "-");
                emit_latency_nop_padding(out);
                break;
            }
            case TAC_OR: {
                char buf[64];
                snprintf(buf, sizeof(buf), "or %s, %s, %s", i->result, i->arg1, i->arg2);
                emit_bundle(out, buf, "-", "-", "-", "-");
                emit_latency_nop_padding(out);
                break;
            }
            case TAC_XOR: {
                char buf[64];
                snprintf(buf, sizeof(buf), "xor %s, %s, %s", i->result, i->arg1, i->arg2);
                emit_bundle(out, buf, "-", "-", "-", "-");
                emit_latency_nop_padding(out);
                break;
            }
            case TAC_SHL: {
                char buf[64];
                snprintf(buf, sizeof(buf), "lsl %s, %s, %s", i->result, i->arg1, i->arg2);
                emit_bundle(out, buf, "-", "-", "-", "-");
                emit_latency_nop_padding(out);
                break;
            }
            case TAC_SHR: {
                char buf[64];
                snprintf(buf, sizeof(buf), "lsr %s, %s, %s", i->result, i->arg1, i->arg2);
                emit_bundle(out, buf, "-", "-", "-", "-");
                emit_latency_nop_padding(out);
                break;
            }

            // ----------------------------------------------------------------
            // CRIPTOGRAFÍA Y BÓVEDA (Slot S3 - CRP)
            // ----------------------------------------------------------------
            case TAC_VAULT_LOGIN: {
                emit_bundle(out, "-", "-", "-", "login", "-");
                emit_latency_nop_padding(out);
                break;
            }
            case TAC_VAULT_LOGOUT: {
                emit_bundle(out, "-", "-", "-", "logout", "-");
                emit_latency_nop_padding(out);
                break;
            }
            case TAC_VAULT_KSETW: {
                char buf[64];
                snprintf(buf, sizeof(buf), "ksetw %s", i->arg1 ? i->arg1 : "r0");
                emit_bundle(out, "-", "-", "-", buf, "-");
                emit_latency_nop_padding(out);
                break;
            }
            case TAC_FEISTEL_ROUND: {
                char buf[64];
                snprintf(buf, sizeof(buf), "f4e %s, %s", i->result, i->arg1);
                emit_bundle(out, "-", "-", "-", buf, "-");
                emit_latency_nop_padding(out);
                break;
            }

            default: {
                emit_bundle(out, "-", "-", "-", "-", "-");
                break;
            }
        }
    }
}