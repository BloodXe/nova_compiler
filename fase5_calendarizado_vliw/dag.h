#ifndef DAG_H
#define DAG_H

#include <stdbool.h>
#include "tac.h"

// Tipos de dependencias
typedef enum { DEP_RAW, DEP_WAR, DEP_WAW, DEP_MEM } DepType;

// Arista dirigida en el grafo (representa la dependencia)
typedef struct DAGEdge {
    struct DAGNode* to;
    DepType type;
    int latency;          // Latencia requerida (ej. 3 para RAW en CERBERO-1)
    struct DAGEdge* next;
} DAGEdge;

// Nodo del grafo (Representa una instrucción TAC)
typedef struct DAGNode {
    TACInst* instr;
    int node_id;
    DAGEdge* out_edges;   // Aristas salientes (instrucciones que dependen de este nodo)
    int in_degree;        // Grado de entrada (cantidad de dependencias pendientes)
    struct DAGNode* next; // Lista enlazada de todos los nodos en el bloque
} DAGNode;

// Estructura contenedora del grafo para el bloque básico
typedef struct {
    DAGNode* head;
    DAGNode* tail;
    int node_count;
} DAG;

// Funciones principales
DAG* build_dag_for_basic_block(TACInst* first_instr, TACInst* last_instr);
void free_dag(DAG* dag);

#endif