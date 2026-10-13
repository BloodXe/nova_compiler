/*
 * Planificación de instrucciones VLIW (Fase 5).
 * Toma el Grafo de Dependencias Acíclico (DAG) de un bloque básico
 * construido a partir del código intermedio y empaqueta las instrucciones
 * TAC en bundles de 128 bits para el procesador CERBERO.
 * Implementa List Scheduling sobre el DAG, previniendo conflictos WCONF
 * e inyectando latencia explícita mediante NOP Bundles.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "scheduler.h"
#include "tac.h"
#include <string.h>

// Funciones de detección

// Verifica si una instrucción causa un conflicto de escritura (WCONF) en el bundle actual
static bool has_wconf(TACInst* instr, Bundle* bundle) {
    // Si la instrucción no tiene variable/registro de destino (ej. saltos, stores), no hay conflicto
    if (instr->result == NULL) {
        return false;
    }

    // Revisar los 5 slots del bundle actual buscando otra escritura al mismo destino
    for (int i = 0; i < 5; i++) {
        if (bundle->slots[i] != NULL && bundle->slots[i]->result != NULL) {
            // Compara los nombres de los destinos usando strcmp
            if (strcmp(bundle->slots[i]->result, instr->result) == 0) {
                return true; // Conflicto detectado: doble escritura en el mismo bundle
            }
        }
    }
    return false;
}

// Verifica si un bundle está completamente vacío (NOP Bundle)
static bool is_bundle_empty(Bundle* bundle) {
    for (int i = 0; i < 5; i++) {
        if (bundle->slots[i] != NULL) return false;
    }
    return true;
}

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
        bool instruction_added_this_cycle = false;

        // Itera sobre todos los nodos buscando instrucciones listas (Ready List implícita)
        DAGNode* n = dag->head;
        while (n != NULL) {
            // Verifica dependencias resueltas y latencia de 3 ciclos cumplida
            if (!n->scheduled && n->in_degree == 0 && n->max_ready_cycle <= current_cycle) {
                
                // Previene WCONF (Write Conflict)
                if (has_wconf(n->instr, bundle)) {
                    n = n->next;
                    continue; // Pospone esta instrucción al siguiente ciclo/bundle
                }

                int slot = assign_to_slot(n->instr, bundle);
                
                if (slot != -1) {
                    bundle->slots[slot] = n->instr;
                    n->scheduled = true;
                    n->scheduled_cycle = current_cycle;
                    instruction_added_this_cycle = true;
                    nodes_scheduled++;

                    // Actualiza dependientes y propaga la latencia de 3 ciclos
                    DAGEdge* edge = n->out_edges;
                    while (edge != NULL) {
                        edge->to->in_degree--;
                        
                        // La latencia requerida se definió en la construcción del DAG 
                        // (ej. 3 para RAW de la ALU/LSU). Se establece el ciclo mínimo seguro.
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

        // Emisión explícita de latencia (NOPs)
        // Si no se pudo programar ninguna instrucción, pero aún faltan nodos por programar,
        // significa que se esta esperando que se cumpla la latencia de 3 bundles de un productor.
        // Se deben conservar este bundle vacío en la lista para que actúe como un NOP de hardware.
        if (instruction_added_this_cycle || (!instruction_added_this_cycle && nodes_scheduled < dag->node_count)) {
            if (!list->head) list->head = bundle;
            if (list->tail) list->tail->next = bundle;
            list->tail = bundle;
            list->bundle_count++;
        } else {
            // Solo libera el bundle si hemos terminado de programar todo
            free(bundle);
        }
        
        current_cycle++; // Avanza el reloj global
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
        if (bundle->slots[0] == NULL) return 0;      // S0: ALU-0 (Única que escribe banderas))
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