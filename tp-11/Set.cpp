#include <iostream>
#include "LinkedList.h"
#include "Set.h"
using namespace std;


//Crea un conjunto vacío.
Set emptyS(){
    Set s = new SetSt;
    s->cantidad = 0;
    s->primero = NULL;
    return s;
}

//Indica si el conjunto está vacío.
bool isEmptyS(Set s){
    return s->cantidad == 0;
}

//Indica si el elemento pertenece al conjunto.
bool belongsS(int x, Set s){
    NodoS* acc = s->primero;
    for(int i = 0; i < s->cantidad; i++){
        if(acc->elem == x){
            return true;
        }
        acc = acc->siguiente;
    }
    return false;
}

//Agrega un elemento al conjunto.
void AddS(int x, Set s){
     NodoS* n = new NodoS;
     n->elem =x;
     n->siguiente = s->primero;
     s->primero = n;
};

//Quita un elemento dado.
void RemoveS(int x, Set s){
    NodoS* acc = s->primero;
    int c = s->cantidad;
    while(c > 0){
        if(acc->elem == x){
            acc->elem = acc->siguiente->elem;
            acc->siguiente = acc->siguiente->siguiente;
        }else{
            acc = acc->siguiente;
        }
        c--;
    }
};

//Devuelve la cantidad de elementos.
int sizeS(Set s){
    return s->cantidad;
};

//Devuelve una lista con los lementos del conjunto.
LinkedList setToList(Set s){
    LinkedList l = nil();
    NodoS* acc = s->primero;
    for(int i=0;i < s->cantidad; i++){
        Snoc(acc->elem, l);
        acc = acc->siguiente;
    }
    return l;
}

//Lib era la memoria o cupada p or el conjunto
void DestroyS(Set s){
    NodoS* acc = s->primero;
    int c = s->cantidad;
    while(c > 0){
        NodoS* tmp = acc->siguiente;
        delete acc;
        acc = tmp;
        c--;
    }
    delete s;
};