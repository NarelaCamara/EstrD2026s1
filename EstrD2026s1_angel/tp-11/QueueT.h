#include <iostream>
#include "BinaryTree.h"
using namespace std;

struct QueueSt;
typedef QueueSt* QueueT;

QueueT emptyQT();
// Crea una cola vacía.
// Costo: O(1).

bool isEmptyQT(QueueT q);
// Indica si la cola está vacía.
// Costo: O(1).

Tree firstQT(QueueT q);
// Devuelve el primer elemento.
// Costo: O(1).

void EnqueueT(Tree x, QueueT q);
// Agrega un elemento al final de la cola.
// Costo: O(1).

void DequeueT(QueueT q);
// Quita el primer elemento de la cola.
// Costo: O(1).

int lengthQT(QueueT q);
// Devuelve la cantidad de elementos de la cola.
// Costo: O(1).

void MergeQT(QueueT q1, QueueT q2);
// Anexa q2 al final de q1, liberando la memoria inservible de q2 en el proceso.
// Nota: Si bien se libera memoria de q2, no necesariamente la de sus nodos.
// Costo: O(1).

void DestroyQT(QueueT q);
// Libera la memoria ocupada por la cola.
// Costo: O(n).