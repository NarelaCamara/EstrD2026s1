#include <iostream>
#include <iomanip>
using namespace std;
#include "Tree.h"


//Crea una heap vacía.
//Costo: O(1).
MaxHeap emptyH(){
    MaxHeapSt* mh = new MaxHeapSt;
    mh->cantidad = 0;
    mh->primero = nullptr;
    return mh;
};

//Indica si la heap está vacía.
//Costo: O(1).
bool isEmptyH(MaxHeap mh){
    return mh->cantidad == 0;
};


//Inserta un elemento en la heap.
//Costo: O(log M).
void insertH(int x, MaxHeap mh){
     if (mh == nullptr) {
        return;
    }
    NodoMH* actual = mh->primero;
    NodoMH* previo = mh->primero->siguiente;
    while(actual != nullptr){
        if(actual->elem < x ){
            NodoMH* nuevo = new NodoMH;
            nuevo->elem=x;
            nuevo->siguiente= actual;
            previo->siguiente= nuevo;
        }else{
            previo= actual;
            actual= actual->siguiente
        }
    }
};

//Devuelve el elemento máximo de la heap.
//Costo: O(1).
Int maxH(MaxHeap mh){
    return mh->primero->elem;
};

//Elimina el elemento máximo de la heap.
//Costo: O(log M).
void deleteMaxH(MaxHeap mh){
     if (m == nullptr) {
        return;
    }
    if (mh->primero != nullptr) {
        return;
    }else{
        NodoMH* d = mh->primero;
        mh->primero = mh->primero->siguiente;
        delete d;
        mh->cantidad--;
    }
};



void showMH(MaxHeap mh){

};

