#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tac.h" 
#include "dag.h"


// Estructura para rastrear qué nodos del DAG leyeron una variable/registro
typedef struct UseNode {
    DAGNode *node;
    struct UseNode *next;
} UseNode;

#define MAX_VARS 512

// Tabla de símbolos local para mapear nombres de temporales/variables a índices de tabla
static char *var_map[MAX_VARS];
static int var_count = 0;

static int get_var_index(const char *name) {
    if (!name) return -1;
    for (int i = 0; i < var_count; i++) {
        if (strcmp(var_map[i], name) == 0) return i;
    }
    if (var_count < MAX_VARS) {
        var_map[var_count] = strdup(name);
        return var_count++;
    }
    return -1;
}

static void reset_var_map(void) {
    for (int i = 0; i < var_count; i++) {
        free(var_map[i]);
        var_map[i] = NULL;
    }
    var_count = 0;
}

// Prototipos locales
DAGNode *create_dag_node(TACInst *instr);
void add_dag_edge(DAGNode *from, DAGNode *to, DepType type, int latency);
void add_use(UseNode **use_list, DAGNode *node);
void clear_uses(UseNode **use_list);

// ============================================================================
// CONSTRUCCIÓN DEL DAG
// ============================================================================
DAG *build_dag_for_basic_block(TACInst *first_instr, TACInst *last_instr) {
    reset_var_map();

    DAG *dag = malloc(sizeof(DAG));
    dag->head = NULL;
    dag->tail = NULL;
    dag->node_count = 0;

    // Tablas de seguimiento de registros temporales/físicos
    DAGNode *last_def[MAX_VARS] = {NULL};
    UseNode *last_uses[MAX_VARS] = {NULL};

    // Rastreo para serializar accesos a memoria (LSU)
    DAGNode *last_mem_write = NULL;
    DAGNode *last_mem_read = NULL;

    TACInst *current_tac = first_instr;

    while (current_tac != NULL) {
        DAGNode *current_node = create_dag_node(current_tac);

        // Agregar nodo a la lista global del DAG
        if (!dag->head) dag->head = current_node;
        if (dag->tail) dag->tail->next = current_node;
        dag->tail = current_node;
        dag->node_count++;

        int res_idx  = get_var_index(current_tac->result);
        int arg1_idx = get_var_index(current_tac->arg1);
        int arg2_idx = get_var_index(current_tac->arg2);

        // 1. Dependencias RAW (Read After Write)
        // Carga de memoria: lee arg1 (base) y arg2 (índice)
        // Almacenamiento: lee result (base), arg1 (índice) y arg2 (valor)
        if (current_tac->op == TAC_STORE) {
            if (res_idx >= 0 && last_def[res_idx]) {
                add_dag_edge(last_def[res_idx], current_node, DEP_RAW, 3);
            }
            if (res_idx >= 0) add_use(&last_uses[res_idx], current_node);

            if (arg1_idx >= 0 && last_def[arg1_idx]) {
                add_dag_edge(last_def[arg1_idx], current_node, DEP_RAW, 3);
            }
            if (arg1_idx >= 0) add_use(&last_uses[arg1_idx], current_node);

            if (arg2_idx >= 0 && last_def[arg2_idx]) {
                add_dag_edge(last_def[arg2_idx], current_node, DEP_RAW, 3);
            }
            if (arg2_idx >= 0) add_use(&last_uses[arg2_idx], current_node);
        } else {
            if (arg1_idx >= 0 && last_def[arg1_idx]) {
                add_dag_edge(last_def[arg1_idx], current_node, DEP_RAW, 3);
            }
            if (arg1_idx >= 0) add_use(&last_uses[arg1_idx], current_node);

            if (arg2_idx >= 0 && last_def[arg2_idx]) {
                add_dag_edge(last_def[arg2_idx], current_node, DEP_RAW, 3);
            }
            if (arg2_idx >= 0) add_use(&last_uses[arg2_idx], current_node);
        }

        // 2. Dependencias WAW y WAR
        if (current_tac->op != TAC_STORE && res_idx >= 0) {
            // WAW
            if (last_def[res_idx]) {
                add_dag_edge(last_def[res_idx], current_node, DEP_WAW, 1);
            }

            // WAR
            UseNode *use = last_uses[res_idx];
            while (use != NULL) {
                if (use->node != current_node) {
                    add_dag_edge(use->node, current_node, DEP_WAR, 1);
                }
                use = use->next;
            }

            last_def[res_idx] = current_node;
            clear_uses(&last_uses[res_idx]);
        }

        // 3. Dependencias de Memoria (LSU - Slot S2)
        if (current_tac->op == TAC_LOAD) {
            if (last_mem_write) {
                add_dag_edge(last_mem_write, current_node, DEP_MEM, 3);
            }
            last_mem_read = current_node;
        } else if (current_tac->op == TAC_STORE) {
            if (last_mem_write) {
                add_dag_edge(last_mem_write, current_node, DEP_MEM, 1);
            }
            if (last_mem_read) {
                add_dag_edge(last_mem_read, current_node, DEP_MEM, 1);
            }
            last_mem_write = current_node;
        }

        if (current_tac == last_instr) break;
        current_tac = current_tac->next;
    }

    for (int i = 0; i < MAX_VARS; i++) {
        clear_uses(&last_uses[i]);
    }

    return dag;
}

// ============================================================================
// FUNCIONES AUXILIARES
// ============================================================================
DAGNode *create_dag_node(TACInst *instr) {
    static int global_id = 0;
    DAGNode *node = malloc(sizeof(DAGNode));
    node->instr = instr;
    node->node_id = global_id++;
    node->out_edges = NULL;
    node->in_degree = 0;
    node->next = NULL;
    return node;
}

void add_dag_edge(DAGNode *from, DAGNode *to, DepType type, int latency) {
    // Evita aristas duplicadas entre los mismos dos nodos
    DAGEdge *current = from->out_edges;
    while (current != NULL) {
        if (current->to == to) {
            // Actualiza la latencia si la nueva dependencia requiere más tiempo (ej. una RAW tras una WAR)
            if (latency > current->latency) current->latency = latency;
            return;
        }
        current = current->next;
    }

    DAGEdge *edge = malloc(sizeof(DAGEdge));
    edge->to = to;
    edge->type = type;
    edge->latency = latency;
    edge->next = from->out_edges;
    from->out_edges = edge;

    to->in_degree++; // Clave para el Algoritmo de List Scheduling
}

void add_use(UseNode **use_list, DAGNode *node) {
    UseNode *new_use = malloc(sizeof(UseNode));
    new_use->node = node;
    new_use->next = *use_list;
    *use_list = new_use;
}

void clear_uses(UseNode **use_list) {
    UseNode *current = *use_list;
    while (current != NULL) {
        UseNode *temp = current;
        current = current->next;
        free(temp);
    }
    *use_list = NULL;
}