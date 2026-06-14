#include <iostream>
#include "LinkedList.h" 
using namespace std;

void showIterator (ListIterator xs){
    NodoL* acc = xs->current;
    while (acc != NULL) {
        cout << acc->elem;
        if (acc->siguiente != NULL) {
            cout << " - ";
        }
        acc = acc->siguiente;
    }
    cout << endl;
}

void showList (LinkedList xs){
    NodoL* acc = xs->primero;
    while (acc != NULL) {
        cout << acc->elem;
        if (acc->siguiente != NULL) {
            cout << " - ";
        }
        acc = acc->siguiente;
    }
    cout << endl;
}

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
    NodoL* n = new NodoL;
    n->elem = x;
    n->siguiente = xs->primero;
    xs->primero = n;
    xs->cantidad++;
};

//Quita el primer elemento.
void Tail(LinkedList xs){
    if(xs->cantidad > 0){
        NodoL* n = xs->primero->siguiente;
        delete xs->primero;
        xs->primero=n;
        xs->cantidad--;
    }
};

//Devuelve la cantidad de elementos.
int length(LinkedList xs){
    return xs->cantidad;
};

//Agrega un elemento al final de la lista.
void Snoc(int x, LinkedList xs){
    NodoL* last = xs->primero;
    for(int i = 1; i < xs->cantidad; i++){
        last = last->siguiente;
    }
    NodoL* n = new NodoL;
    n->elem=x;
    n->siguiente=NULL;
    last->siguiente=n;
    xs->cantidad++;
};

//Apunta el recorrido al primer elemento.
ListIterator getIterator(LinkedList xs){
    ListIterator li = new IteratorSt;
    NodoL* n = xs->primero;
    li->current =n;
    return li;
};

//Devuelve el elemento actual en el recorrido.
int current(ListIterator ixs){
    return ixs->current->elem;
};

//Reemplaza el elemento actual por otro elemento.
void SetCurrent(int x, ListIterator ixs){
    ixs->current->elem = x;
};

//Pasa al siguiente elemento.
void Next(ListIterator ixs){
    ixs->current= ixs->current->siguiente;
};

//Indica si el recorrido ha terminado.
bool atEnd(ListIterator ixs){
    return ixs->current->siguiente == NULL;
};

//Libera la memoria ocupada por el iterador.
/** como elimina en destroyL ya el nodo current esta eliminado, no necesario borrarlo otra vez.  */
void DisposeIterator(ListIterator ixs){
    delete ixs;
}

//Libera la memoria ocupada por la lista.
void DestroyL(LinkedList xs){
    NodoL* acc = xs->primero;
    while (acc != NULL) {   
            NodoL* tmp = acc->siguiente;
            delete acc;
            acc=tmp;
        }
    delete xs;
};