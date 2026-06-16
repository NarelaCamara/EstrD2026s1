#include <iostream>
#include "Queue.h"


void showQueue (Queue q) {
    NodoQ* n= q->primero;
    for(int i =0; i < q->cantidad; i++){
        cout << n->elem << "-";
        n = n->siguiente;
    }
    cout << endl;
}


//Definir la siguiente interfaz de este tip o de colas, resp etando el costo de las op eraciones:
Queue emptyQ(){
    Queue q = new QueueSt;
    q->cantidad = 0;
    q->primero= NULL;
    q->ultimo= NULL;
    return q;
}

//Crea una cola vacía.
//Costo: O(1).
//Indica si la cola está vacía.
bool isEmptyQ(Queue q){
   return q->cantidad == 0;
};

//Costo: O(1).
//Devuelve el primer elemento.
int firstQ(Queue q){
    return q->primero->elem; 
};
//Costo: O(1).
//Agrega un elemento al final de la cola.
void Enqueue(int x, Queue q){
    NodoQ* n= new NodoQ;
    n->elem= x;
    n->siguiente = NULL;

    if(q->cantidad == 0){
        q->primero= n;
    }else{
        q->ultimo->siguiente = n;
    }
    q->ultimo = n;
    q->cantidad++;
};

//Costo: O(1).
//Quita el primer elemento de la cola.
void Dequeue(Queue q){
    if (q->primero == NULL) return;
    NodoQ* tmp = q->primero;
    q->primero = q->primero->siguiente;
    delete tmp;
    q->cantidad--;
    if (q->primero == NULL) q->ultimo = NULL;
};

//Costo: O(1).
//Devuelve la cantidad de elementos de la cola.
int lengthQ(Queue q){
    return q->cantidad;
};

//Costo: O(1).
void MergeQ(Queue q1, Queue q2){
    if (q2 == NULL || q2->cantidad == 0) return;
    if (q1 == NULL) return;
    if (q1->cantidad == 0) {
        q1->primero = q2->primero;
        q1->ultimo = q2->ultimo;
    } else {
        q1->ultimo->siguiente = q2->primero;
        q1->ultimo = q2->ultimo;
    }
    q1->cantidad += q2->cantidad;
    delete q2;

};
//Anexa q2 al final de q1, lib erando la memoria inservible de q2 en el pro ceso.
//Nota: Si bien se lib era memoria de q2, no necesariamente la de sus no dos.

//Lib era la memoria o cupada p or la cola.
//Costo: O(n).
void DestroyQ(Queue q){
    NodoQ* acc = q->primero;
    for(int i = 0; i < q->cantidad; i++){
        acc= q->primero->siguiente;
        delete q->primero;
    }
    delete q;
};

