#include <iostream>
#include "Queue.h"

//Definir la siguiente interfaz de este tip o de colas, resp etando el costo de las op eraciones:
Queue emptyQ(){
    Queue q = new QueueSt;
    q->cantidad = 0;
    q->primero= NULL;
    q->ultimo= NULL;
};
//Crea una cola vacía.
//Costo: O(1).
bool isEmptyQ(Queue q){
   return q->cantidad == 0;
};
//Indica si la cola está vacía.
//Costo: O(1).
int firstQ(Queue q){
    return 
};
//Devuelve el primer elemento.
//Costo: O(1).
void Enqueue(int x, Queue q);
//Agrega un elemento al final de la cola.
//Costo: O(1).
void Dequeue(Queue q);
//Quita el primer elemento de la cola.
//Costo: O(1).
int lengthQ(Queue q);
//Devuelve la cantidad de elementos de la cola.
//Costo: O(1).
void MergeQ(Queue q1, Queue q2);
//Anexa q2 al final de q1, lib erando la memoria inservible de q2 en el pro ceso.
//Nota: Si bien se lib era memoria de q2, no necesariamente la de sus no dos.
//Costo: O(1).
void DestroyQ(Queue q);
//Lib era la memoria o cupada p or la cola.
//Costo: O(n).

