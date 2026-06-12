#include <iostream>
#include "LinkedList.h" 
using namespace std;

//Crea una lista vacía.
LinkedList nil(){
    LinkedList ln = new LinkedListSt;//porque ya es un puntero
    ln->cantidad = 0;
    ln->primero = NULL;
    return ln;
};

//Indica si la lista está vacía.
bool isEmpty(LinkedList xs){
    return xs->cantidad == 0;
};

//Devuelve el primer elemento.
int head(LinkedList xs){
    return xs->primero->elem;
};

//Agrega un elemento al principio de la lista.
void Cons(int x, LinkedList xs){
    if(xs->cantidad == 0){
        NodoL* n = new NodoL;
        n->elem =x;
        n->siguiente = NULL;
        xs->primero= n;
    }else{
        NodoL* n = new NodoL;
        n->elem = x;
        n->siguiente = xs->primero;
        xs->primero = n;
        xs->cantidad++;
    }
    xs->cantidad++;

};

void Tail(LinkedList xs){
    if(xs->cantidad > 0){
        NodoL* n = xs->primero->siguiente;
        delete xs->primero;
        xs->primero=n;
        xs->cantidad--;
    }
};
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