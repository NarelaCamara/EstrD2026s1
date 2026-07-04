#include <iostream>
using namespace std;

/**
 * INVARIANTES DE REPRESENTACIÓN:
 * - La cantidad de elementos en la heap es igual a la cantidad de nodos en la lista enlazada.
 * - El primer nodo de la lista enlazada contiene el elemento máximo de la heap.
 * - cantidad es la cantidad de elementos en la heap.
 * - primero es un puntero al primer nodo de la lista enlazada.
 * - ultimo es un puntero al último nodo de la lista enlazada.
 * - si siguiente es NULL, significa que no hay más nodos en la lista enlazada.
 */

struct NodoMH{
int elem; // valor del nodo
NodoMH* siguiente; // puntero al siguiente nodo
};

struct MaxHeapSt {
int cantidad; // cantidad de elementos
NodoMH* primero; // puntero al primer nodo
};

typedef MaxHeapSt* MaxHeap;


MaxHeap emptyH();
//Crea una heap vacía.
//Costo: O(1).
bool isEmptyH(MaxHeap mh);
//Indica si la heap está vacía.
//Costo: O(1).

void insertH(int x, MaxHeap mh);
//Inserta un elemento en la heap.
//Costo: O(log M).

Any maxH(MaxHeap mh);
//Devuelve el elemento máximo de la heap.
//Costo: O(1).
void deleteMaxH(MaxHeap mh);
//Elimina el elemento máximo de la heap.
//Costo: O(log M).

void showMH(MaxHeap mh);

