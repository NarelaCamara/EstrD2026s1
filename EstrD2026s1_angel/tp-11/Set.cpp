#include <iostream>
#include "Set.h"
using namespace std;

struct NodoS {
    int elem; // valor del nodo
    NodoS* siguiente; // puntero al siguiente nodo
};

struct SetSt {
    int cantidad; // cantidad de elementos diferentes
    NodoS* primero; // puntero al primer nodo
};

/* INV. REP.:
    * el int cantidad es la cantidad de nodos que tiene el SetSt
    * sii primero = NULL, entonces cantidad = 0
    * para cada struct NodoS n en SetSt, el campo elem de n es un valor diferente a los campo elem demás NodoS
*/

Set emptyS() {
    SetSt* s = new SetSt;
    s->cantidad = 0;
    s->primero = NULL;
    return s;
}

bool isEmptyS(Set s) {
    return s->primero == NULL;
}

bool belongS(int x , Set s) { 
    NodoS* temp = s->primero;
    while (temp != NULL && temp->elem != x) {
        temp = temp->siguiente;
    }
    return temp != NULL;
}

void AddS(int x, Set s) {
    NodoS* temp = s->primero;
    while (temp != NULL && temp->elem == x) {
        temp = temp->siguiente;
    }
    if (temp == NULL) {
        NodoS* newNode = new NodoS;
        newNode->elem = x;
        newNode->siguiente = s->primero;
        s->primero = newNode;
        s->cantidad++;
    }
    
}

void RemoveS(int x, Set s) {
    NodoS* temp = s->primero;
    NodoS* prev = NULL;

    while (temp != NULL && temp->elem != x) {
        prev = temp;
        temp = temp->siguiente;
    }

    if (temp != NULL) {
        if (prev == NULL) {
            s->primero = temp->siguiente;
        } else { 
            prev->siguiente = temp->siguiente;
        }
        delete temp;
        s->cantidad--;
    }
}

int sizeS(Set s) {
    return s->cantidad;
}

LinkedList setToList(Set s) {
    LinkedList list = nil();
    NodoS* temp = s->primero;
    while (temp != NULL) {
        Cons(temp->elem, list);
        temp = temp->siguiente;
    }
    return list;
}

void DestroyS(Set s) {
    NodoS* temp = s->primero;
    while (temp != NULL) {
        NodoS* next = temp->siguiente;
        delete temp;
        temp = next;
    }
    delete s;
}