#include <iostream>
#include "QueueT.h"
#include "BinaryTree.h"
using namespace std;

struct NodoQ {
    Tree    elem;     // valor del nodo
    NodoQ* siguiente; // puntero al siguiente nodo
};

struct QueueSt {
    int    cantidad;  // cantidad de elementos
    NodoQ* primero;  // puntero al primer nodo
    NodoQ* ultimo;   // puntero al ultimo nodo
};

/* INV. REP. 
    Para QueueSt q:
    * q->primero->elem es el primer elemento que ingresa en la QueueSt q
    * q->ultimo->elem es el primer elemento que ingresa en la QueueSt q
    * si primero == NULL entonces ultimo == NULL
    * si ultimo != NULL, entonces ultimo->siguiente == NULL.  
    * el int cantidad es la cantidad de elementos/nodos que se pueden recorrer de la queue
      desde primero hasta NULL.
*/


// Costo: O(1).
QueueT emptyQT() {
    QueueSt* q = new QueueSt;
    q->primero = NULL; q->ultimo = NULL; q->cantidad = 0;
    return q;
}

// Costo: O(1).
bool isEmptyQT(QueueT q) { return q->cantidad == 0; }

// Costo: O(1).
Tree firstQT(QueueT q) { 
// PRECOND.: la cola tiene que tener al menos un elemento.
    return q->primero->elem ; 
}

// Costo: O(1).
void EnqueueT(Tree x, QueueT q) {
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
void DequeueT(QueueT q) {
    if(q->primero != NULL) { 
        NodoQ* temp = q->primero;
        q->primero = q->primero->siguiente;
        if(q->primero == NULL) { q->ultimo = NULL; }
        q->cantidad--;
        delete temp;
    }
}


// Costo: O(1).
int lengthQT(QueueT q) { return q->cantidad; }

// Costo: O(1).
void MergeQT(QueueT q1, QueueT q2) {
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
void DestroyQT(QueueT q) {
    NodoQ* temp = q->primero;
    while(q->primero != NULL){
        q->primero = q->primero->siguiente;
        delete temp;
        temp = q->primero;
    }
    delete q;
}
