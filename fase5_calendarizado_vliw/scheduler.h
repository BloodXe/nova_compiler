#ifndef SCHEDULER_H
#define SCHEDULER_H

/*
 * Planificación de instrucciones VLIW (Fase 5).
 *
 * Toma el Grafo de Dependencias Acíclico (DAG) de un bloque básico
 * construido a partir del código intermedio y empaqueta las instrucciones
 * TAC en bundles de 128 bits para el procesador CERBERO.
 *
 * Cada bundle tiene cinco slots de emisión paralela:
 *   <S0: ALU-0> | <S1: ALU-1> | <S2: LSU> | <S3: CRP> | <S4: BRU> ;
 *
 * El planificador (List Scheduling) respeta la latencia arquitectónica
 * de 3 bundles entre productores y consumidores, evitando riesgos de datos
 * (RAW, WAW, WAR, MEM) y colisiones estructurales en los slots.
 */

#include "tac.h"
#include "dag.h"

/*
 * Representación de un paquete VLIW a nivel intermedio (TAC).
 * Nota de diseño: codegen.c maneja internamente una estructura homónima
 * 'Bundle' exclusiva para strings de ensamblador. Esta estructura es
 * paralela pero orientada a los nodos TACInst antes de la emisión pura.
 */
typedef struct Bundle {
    int cycle;          // Ciclo de reloj asignado
    TACInst* slots[5];      // S0: ALU0, S1: ALU1, S2: LSU, S3: CRP/ShortALU, S4: BRU
    struct Bundle* next;   // Siguiente bundle en el bloque básico
} Bundle;

/* 
 * Lista enlazada de bundles que representa el bloque básico 
 * ya calendarizado y con los huecos de latencia resueltos.
 */
typedef struct {
    Bundle* head;
    Bundle* tail;
    int bundle_count;
} BundleList;

/*
 * Aplica el algoritmo de List Scheduling sobre el DAG de un bloque básico.
 * Devuelve la lista enlazada de bundles VLIW ordenados por ciclo de reloj,
 * insertando huecos (NOPs en los slots NULL) automáticamente donde las 
 * latencias arquitectónicas lo exijan.
 */
BundleList* schedule_basic_block(DAG* dag);

#endif