#include <iostream>
#include <iomanip>
using namespace std;
#include "Tree.h"





//Definir la siguiente interfaz de este tip o de colas, resp etando el costo de las op eraciones:
QueueTree emptyQT();
//Crea una cola vacía.
//Costo: O(1).
bool isEmptyQT(QueueTree q);
//Indica si la cola está vacía.
//Costo: O(1).
int firstQT(QueueTree q);
//Devuelve el primer elemento.
//Costo: O(1).
void EnqueueT(int x, QueueTree q);
//Agrega un elemento al final de la cola.
//Costo: O(1).
void DequeueT(QueueTree q);
// Muestra el contenido de la cola (para debugging)
void showQueueT(QueueTree q);
//Quita el primer elemento de la cola.
//Costo: O(1).
int lengthQT(QueueTree q);
//Devuelve la cantidad de elementos de la cola.
//Costo: O(1).
void MergeQT(QueueTree q1, QueueTree q2);
//Anexa q2 al final de q1, lib erando la memoria inservible de q2 en el pro ceso.
//Nota: Si bien se lib era memoria de q2, no necesariamente la de sus no dos.
//Costo: O(1).
void DestroyQT(QueueTree q){};
//Lib era la memoria o cupada p or la cola.
//Costo: O(n).

