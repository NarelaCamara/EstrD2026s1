#include <iostream>
#include "Queue.h"
using namespace std;

struct NodoQ {
    int     elem;     // valor del nodo
    NodoQ* siguiente; // puntero al siguiente nodo
};

struct QueueSt {
    int    cantidad;  // cantidad de elementos
    NodoQ* primero;  // puntero al primer nodo
    NodoQ* ultimo;   // puntero al ultimo nodo
};

    /*
     INV. REP.:
     * cantidad >= 0
     * cantidad == 0  => primero == NULL && ultimo == NULL
     * desde primero se recorren exactamente cantidad nodos hasta NULL
     * ultimo->siguiente == NULL
    */

// Costo: O(1).
Queue emptyQ() {
    QueueSt* q = new QueueSt;
    q->primero = NULL; q->ultimo = NULL; q->cantidad = 0;
    return q;
}

// Costo: O(1).
bool isEmptyQ(Queue q) { return q->cantidad == 0; }

// Costo: O(1).
int firstQ(Queue q) { 
// PRECOND.: la cola tiene que tener al menos un elemento.
    return q->primero->elem ; 
}

// Costo: O(1).
void Enqueue(int x, Queue q) {
    NodoQ* nuevoN = new NodoQ;
    nuevoN->elem = x;
    nuevoN->siguiente = NULL;
    if(q->primero == NULL) { 
        q->primero = nuevoN;
        q->ultimo  = nuevoN;
    } else { 
        q->ultimo->siguiente = nuevoN;
        q->ultimo = nuevoN;
    }
    q->cantidad++;
}

// Costo: O(1).
void Dequeue(Queue q) {
    if(q->primero != NULL) { 
        NodoQ* temp = q->primero;
        q->primero = q->primero->siguiente;
        if(q->primero == NULL) { q->ultimo = NULL; }
        q->cantidad--;
        delete temp;
    }
}


// Costo: O(1).
int lengthQ(Queue q) { return q->cantidad; }

// Costo: O(1).
void MergeQ(Queue q1, Queue q2) {
    if(q1->primero == NULL){
        q1->primero = q2->primero;
        q1->ultimo  = q2->ultimo;
    } else {
        if(q2->primero != NULL){
            q1->ultimo->siguiente = q2->primero;
            q1->ultimo = q2->ultimo;
        }
    }
    q1->cantidad += q2->cantidad;
    delete q2;
}

// Costo: O(n).
void DestroyQ(Queue q) {
    NodoQ* temp = q->primero;
    while(q->primero != NULL){
        q->primero = q->primero->siguiente;
        delete temp;
        temp = q->primero;
    }
    delete q;
}
