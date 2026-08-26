#include <iostream>
#include "LinkedListV2.h"
using namespace std;

struct NodoL {
    int    elem;      // valor del nodo
    NodoL* siguiente; // puntero al siguiente nodo
};

struct LinkedListSt {
    /* INV.REP.: 
      * cantidad indica la cantidad de nodos que se pueden recorrer desde primero por siguiente hasta alcanzar a NULL
      * primero es NULL si solo si ultimo es NULL
      * si ultimo no es NULL, entonces ultimo->siguiente es NULL 
    */
    int    cantidad; // cantidad de elementos
    NodoL* primero;  // puntero al primer nodo
    NodoL* ultimo;  // puntero al último nodo
};

struct IteratorSt {
    // INV.REP.: el puntero NO es NULL
    NodoL* current;
};

// Ef temporal: O(1), todas las operaciones son constantes
// Ef espacial: O(1), en el stack frame de 'nil', hay un espacio de memoria que guarda el puntero a la LinkedList en memoria heap.
LinkedList nil() {
    LinkedListSt* xs = new LinkedListSt;
    xs->cantidad = 0;
    xs->primero  = NULL;
    xs->ultimo   = NULL;
    return xs;
}

// Ef temporal: O(1), se accede al campo cantidad del registro LinkedList y se compara por igualdad (operaciones constantes)
// Ef espacial: O(1), el stack frame de 'isEmpty', hay un espacio para el parámetro xs
bool isEmpty(LinkedList xs) {
    return xs->cantidad == 0;
}

// Ef temporal: O(1), se accede al campo elemento del registro nodo, que es el campo primero del registro LinkedList (operaciones constantes)
// Ef espacial: O(1), el stack frame de 'isEmpty', hay un espacio para el parámetro xs
int head(LinkedList xs) {
    return xs->primero->elem;
}

// Ef temporal: O(1), se genera una variable, se acceden a campos de registros en memoria dinámica y se asignan valores (operaciones constantes)
// Ef espacial: O(1), se genera el frama de 'Cons', con 3 espacios, 2 para sus parámetros y 1 para la variable local.
void Cons(int x, LinkedList xs) {
    NodoL* newN = new NodoL;
    newN->elem = x;
    newN->siguiente = xs->primero;
    xs->primero = newN;
    if(xs->ultimo == NULL) { xs->ultimo = newN; }
    xs->cantidad++;
}

// Ef temporal: O(1), se genera una variable, se acceden a campos de registros en memoria dinámica y se asignan valores (operaciones constantes)
// Ef espacial: O(1), se genera el frama de 'Tail', con 2 espacios, 1 para su parámetro y 1 para la variable local.
void Tail(LinkedList xs) {
    if(xs->cantidad > 0){ 
        NodoL* temp = xs->primero;
        xs->primero = xs->primero->siguiente;
        if(xs->primero == NULL) { xs->ultimo = NULL; }
        xs->cantidad--;
        delete temp;
    }
}

// Ef temporal: O(1), se accede al campo cantidad del registro LinkedList en memoria dinámica (operación constante)
// Ef espacial: O(1), se genera el frama de 'length', con 1 espacio su parámetro 'xs' que es el puntero a la lista.
int length(LinkedList xs) {
    return xs->cantidad;
}

// Ef temporal: O(1), generación de variables, accesos a campos de registros en memoria dinámica y setteo de estos campos
//                    son operaciones constantes; en el peor caso, esto se debe hacer por cada nodo de la lista, es por esto
//                    que n * (operaciones constantes) = n * x , siendo x > 1 => n => O(n).
// Ef espacial: O(1), se genera el frama de 'Snoc', 
//                       - con 2 espacios sus parámetros: 'x' que es el elemento a agregar al final y 'xs' que es el puntero a la lista.
//                       - con 1 espacio para la variables local temp
void Snoc(int x, LinkedList xs) {
    NodoL* newN = new NodoL;
    newN->elem = x;
    newN->siguiente = NULL;
    if(xs->cantidad == 0){
        xs->primero = newN;
    } else {
        xs->ultimo->siguiente = newN;
    }
    xs->ultimo = newN;
    xs->cantidad++;
}

// Ef temporal: O(1), generación de variables, acceder a campos de registros en memoria dinámica y asignar valores,
//                    son todas operaciones constantes
// Ef espacial: O(1), en el stack frame de 'getIterator', 2 espacios:
//                     - 1 para el parámetro 'xs' (puntero a la lista)
//                     - 1 para la variable local 'ixs' (puntero al iterador)
ListIterator getIterator(LinkedList xs) {
    IteratorSt* ixs = new IteratorSt;
    ixs->current = xs->primero; 
    return ixs;
}

// Ef temporal: O(1), acceder a campos de registros en memoria dinámica son operaciones de orden constante
// Ef espacial: O(1), en el stack frame de 'current', 1 espacios para el parámetro 'ixs' (puntero al iterador)
int current(ListIterator ixs) {
    return ixs->current->elem;
}

// Ef temporal: O(1), acceder a campos de registros en memoria dinámica y asignar un nuevo dato son operaciones de orden constante
// Ef espacial: O(1), en el stack frame de 'SetCurrent', 2 espacios para los parámetros 'x' (elemento a settear) y 'ixs' (puntero al iterador)
void SetCurrent(int x, ListIterator ixs) {
    ixs->current->elem = x;
}

// Ef temporal: O(1), acceder a campos de registros en memoria dinámica y asignar un nuevo dato son operaciones de orden constante
// Ef espacial: O(1), en el stack frame de 'Next', 1 espacio para el parámetro 'ixs' (puntero al iterador)
void Next(ListIterator ixs) {
    ixs->current = ixs->current->siguiente;
}

// Ef temporal: O(1), acceder a campos de registros en memoria dinámica y el 'bool ==' son operaciones de orden constante
// Ef espacial: O(1), en el stack frame de 'atEnd', 1 espacio para el parámetro 'ixs' (puntero al iterador)
bool atEnd(ListIterator ixs) {
    return ixs->current == NULL;
}

// Ef temporal: O(1), borrar memoria es una operación constante
// Ef espacial: O(1), en el stack frame de 'DisposeIterator', 1 espacio para el parámetro 'ixs' (puntero al iterador)
void DisposeIterator(ListIterator ixs) {
    delete ixs;
}

// Ef temporal: O(n), por cada elemento de la lista se debe borrar su nodo, para ello se realizan operaciones de O(1):
//                    acceder a campos de registros en memoria dinámica, setteo y borrado
//                    n * (1 + 1 + ... + 1) = n * x , siendo x > 1 => n * x => n => O(n)
// Ef espacial: O(1), en el stack frame de 'DisposeIterator', 2 espacios
//                     - 1 espacio para el parámetro 'ixs' (puntero al iterador)
//                     - 1 espacio para la variable local 'temp'
void DestroyL(LinkedList xs) {
    NodoL* temp = xs->primero; 
    while(xs->primero != NULL){
        xs->primero = xs->primero->siguiente;
        delete temp;
        temp = xs->primero;
    }
    delete xs;
}

void Append(LinkedList xs, LinkedList ys) {
    if(isEmpty(xs)){
        xs->primero = ys->primero;
        xs->ultimo = ys->ultimo;
    } else if (!isEmpty(ys)) {
        xs->ultimo->siguiente = ys->primero;
        xs->ultimo = ys->ultimo;
    }
    xs->cantidad += ys->cantidad;
}