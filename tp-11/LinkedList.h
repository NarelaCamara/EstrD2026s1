#ifndef TP11_LINKEDLIST_H
#define TP11_LINKEDLIST_H

#include <iostream>
using namespace std;

//cantidad cuenta apartir del uno
struct NodoL{
    int elem;         // valor del nodo
    NodoL* siguiente; // puntero al siguiente nodo
}; 

struct LinkedListSt {
    // INV.REP.: cantidad indica la cantidad de nodos que se pueden recorrer
    // desde primero por siguiente hasta alcanzar a NULL
    int cantidad;                   // cantidad de elementos
    NodoL* primero;                 // puntero al primer nodo
}; 
typedef LinkedListSt* LinkedList; // INV.REP.: el puntero NO es NULL

struct IteratorSt{
    NodoL *current;
};

typedef IteratorSt* ListIterator; // INV.REP.: el puntero NO es NULL


LinkedList nil();
//Crea una lista vacía.

bool isEmpty(LinkedList xs);
//Indica si la lista está vacía.

int head(LinkedList xs);
//Devuelve el primer elemento.

void Cons(int x, LinkedList xs);
//Agrega un elemento al principio de la lista.

void Tail(LinkedList xs);
//Quita el primer elemento.

int length(LinkedList xs);
//Devuelve la cantidad de elementos.

void Snoc(int x, LinkedList xs);
//Agrega un elemento al final de la lista.

ListIterator getIterator(LinkedList xs);
//Apunta el recorrido al primer elemento.

int current(ListIterator ixs);
//Devuelve el elemento actual en el recorrido.

void SetCurrent(int x, ListIterator ixs);
//Reemplaza el elemento actual por otro elemento.

void Next(ListIterator ixs);
//Pasa al siguiente elemento.

bool atEnd(ListIterator ixs);
//Indica si el recorrido ha terminado.

void DisposeIterator(ListIterator ixs);
//Libera la memoria ocupada por el iterador.

void DestroyL(LinkedList xs);
//Libera la memoria ocupada por la lista.

/*Agrega to dos los elementos de la segunda lista al final de los de la primera.
La segunda lista se destruye.
Nota: notar que el costo mejoraría si Snoc fuese O(1), ¾cómo p o dría serlo?*/
void AppendI(LinkedList xs, LinkedList ys);

#endif // TP11_LINKEDLIST_H
