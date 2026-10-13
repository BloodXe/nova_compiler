/*
 * Planificación de instrucciones VLIW (Fase 5).
 * Toma el Grafo de Dependencias Acíclico (DAG) de un bloque básico
 * construido a partir del código intermedio y empaqueta las instrucciones
 * TAC en bundles de 128 bits para el procesador CERBERO.
 * Implementa List Scheduling sobre el Grafo de Dependencias Acíclico (DAG).
 */

#include <stdio.h>
#include <stdlib.h>
#include "scheduler.h"
#include "tac.h"

//Prototipos locales
static Bundle* create_empty_bundle(int cycle);
static int assign_to_slot(TACInst* instr, Bundle* bundle);
static bool is_alu(TACInst* instr);
static bool is_lsu(TACInst* instr);
static bool is_bru(TACInst* instr);
static bool is_crp(TACInst* instr);

static void sin_memoria_sched(void) {
    fprintf(stderr, "novac: sin memoria en el planificador\n");
    exit(3);
}

// =========================================================
// FUNCIÓN PRINCIPAL: Planificación VLIW (List Scheduling)
// =========================================================
BundleList* schedule_basic_block(DAG* dag) {
    if (dag == NULL) return NULL;

    BundleList* list = calloc(1, sizeof(BundleList));
    if (list == NULL) sin_memoria_sched();

    //Inicializar nodos
    DAGNode* current = dag->head;
    while (current != NULL) {
        current->scheduled = false;
        current->scheduled_cycle = -1;
        current->max_ready_cycle = 0;
        current = current->next;
    }

    int current_cycle = 0;
    int nodes_scheduled = 0;

    // Bucle principal: avanza ciclo por ciclo hasta empaquetar todas las instrucciones
    while (nodes_scheduled < dag->node_count) {
        Bundle* bundle = create_empty_bundle(current_cycle);
        bool bundle_used = false;

        // Itera sobre todos los nodos buscando instrucciones listas (Ready List implícita)
        DAGNode* n = dag->head;
        while (n != NULL) {
            // Condición para estar listo: no planificado, sin dependencias previas, 
            // y con la latencia arquitectónica transcurrida. 
            if (!n->scheduled && n->in_degree == 0 && n->max_ready_cycle <= current_cycle) {
                
                // Intenta ubicar la instrucción en uno de los 5 slots libres del bundle actual
                int slot = assign_to_slot(n->instr, bundle);
                
                if (slot != -1) {
                    bundle->slots[slot] = n->instr;
                    n->scheduled = true;
                    n->scheduled_cycle = current_cycle;
                    bundle_used = true;
                    nodes_scheduled++;

                    // Libera a los sucesores (Disminuir in_degree y actualizar latencias)
                    DAGEdge* edge = n->out_edges;
                    while (edge != NULL) {
                        edge->to->in_degree--;
                        
                        // Calcula cuándo el sucesor podrá ejecutarse sin violar dependencias
                        int ready_time = current_cycle + edge->latency;
                        if (ready_time > edge->to->max_ready_cycle) {
                            edge->to->max_ready_cycle = ready_time;
                        }
                        edge = edge->next;
                    }
                }
            }
            n = n->next;
        }

        // Si se asignó al menos una instrucción, agregamos el bundle a la lista 
        if (bundle_used) {
            if (list->head == NULL) list->head = bundle;
            if (list->tail != NULL) list->tail->next = bundle;
            list->tail = bundle;
            list->bundle_count++;
        } else {
            free(bundle);
        }
        
        current_cycle++; //Avanza el reloj
    }

    return list;
}

// ==================================================
// FUNCIONES AUXILIARES DE HARDWARE (CERBERO-1 ISA)
// ==================================================

static Bundle* create_empty_bundle(int cycle) {
    Bundle* b = calloc(1, sizeof(Bundle));
    if (b == NULL) sin_memoria_sched();
    b->cycle = cycle;
    return b;
}

// Lógica de asignación a los Slots VLIW 
static int assign_to_slot(TACInst* instr, Bundle* bundle) {
    if (instr == NULL || instr->op == TAC_NOP) return -1;

    if (is_alu(instr)) {
        if (bundle->slots[0] == NULL) return 0;      // S0: ALU-0 (Única que escribe banderas)
        if (bundle->slots[1] == NULL) return 1;      // S1: ALU-1 
        // La conversión a ShortALU (S3) si S0 y S1 están ocupados se implementará aquí
        return -1; 
    }
    else if (is_lsu(instr)) {
        if (bundle->slots[2] == NULL) return 2;      // S2: LSU (Load/Store)
        return -1;
    }
    else if (is_crp(instr)) {
        if (bundle->slots[3] == NULL) return 3;      // S3: Criptografía / Bóveda / ALU Corta
        return -1;
    }
    else if (is_bru(instr)) {
        if (bundle->slots[4] == NULL) return 4;      // S4: Branch Unit (Saltos/Retornos)
        return -1;
    }
    
    // Fallback por defecto a S0 para pseudo-instrucciones si forman parte del DAG
    return (bundle->slots[0] == NULL) ? 0 : -1; 
}

// Funciones de clasificación alineadas con las enumeraciones TACOp en tac_4.h 
static bool is_alu(TACInst* instr) {
    TACOp op = instr->op;
    return (op >= TAC_ADD && op <= TAC_USHR) ||  // Aritmética y desplazamiento
           (op >= TAC_EQ && op <= TAC_GE) ||     // Comparaciones
           (op >= TAC_NEG && op <= TAC_NOT) ||   // Unarias
           op == TAC_ASSIGN || op == TAC_CONST || 
           op == TAC_STR || op == TAC_ADDR || 
           op == TAC_LEN || op == TAC_CHECK || op == TAC_PARAM;
}

static bool is_lsu(TACInst* instr) {
    return (instr->op == TAC_LOAD || instr->op == TAC_STORE); 
}

static bool is_bru(TACInst* instr) {
    TACOp op = instr->op;
    return (op == TAC_LABEL || op == TAC_GOTO || 
            op == TAC_IF_FALSE || op == TAC_IF_TRUE || 
            op == TAC_CALL || op == TAC_TAILCALL || 
            op == TAC_RET || op == TAC_RET_VAL || op == TAC_HALT); 
}

static bool is_crp(TACInst* instr) {
    TACOp op = instr->op;
    return (op == TAC_AUTHW || op == TAC_VAULT_LOGIN || 
            op == TAC_VAULT_LOGOUT || op == TAC_KSETW || 
            op == TAC_FEISTEL); // Operaciones de bóveda y unidad criptográfica
}