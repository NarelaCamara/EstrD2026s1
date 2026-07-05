#include <iostream>
#include "MaxHeap.h"

using namespace std;

//costo: constante O(1)
MaxHeap emptyH() {
    MaxHeap mh = new MaxHeapSt;
    mh->cantidad = 0;
    mh->primero = nullptr;
    return mh;
}

//costo: constante O(1)
bool isEmptyH(MaxHeap mh) {
    return mh == nullptr || mh->cantidad == 0;
}

//costo: O(n) donde n es la cantidad de elementos en el heap
void insertH(Tripulante t, MaxHeap mh) {
    if (mh == nullptr || t == nullptr) {
        return;
    }

    NodoMH* nuevo = new NodoMH;
    nuevo->elem = t;
    nuevo->siguiente = nullptr;

    if (mh->primero == nullptr || rango(t) > rango(mh->primero->elem)) {
        nuevo->siguiente = mh->primero;
        mh->primero = nuevo;
    } else {
        NodoMH* actual = mh->primero;
        while (actual->siguiente != nullptr && rango(actual->siguiente->elem) >= rango(t)) {
            actual = actual->siguiente;
        }
        nuevo->siguiente = actual->siguiente;
        actual->siguiente = nuevo;
    }

    mh->cantidad++;
}

//costo: constante O(1)
Tripulante maxH(MaxHeap mh) {
    if (mh == nullptr || mh->primero == nullptr) {
        return nullptr;
    }
    return mh->primero->elem;
}

// costo: constante O(1)
void deleteMaxH(MaxHeap mh) {
    if (mh == nullptr || mh->primero == nullptr) {
        return;
    }

    NodoMH* d = mh->primero;
    mh->primero = mh->primero->siguiente;
    delete d;
    mh->cantidad--;
}

void showMH(MaxHeap mh) {
    cout << "[";
    NodoMH* actual = (mh == nullptr) ? nullptr : mh->primero;
    while (actual != nullptr) {
        cout << nombre(actual->elem) << "(" << rango(actual->elem) << ")";
        if (actual->siguiente != nullptr) {
            cout << ", ";
        }
        actual = actual->siguiente;
    }
    cout << "]" << endl;
}

int testMaxHeap() {
    std::cout << "=== Ejemplo de uso de MaxHeap ===" << std::endl;

    MaxHeap h = emptyH();
    cout << "Is the heap empty? " << (isEmptyH(h) ? "Yes" : "No") << endl;

    Tripulante juan = crearT("Juan", 3);
    Tripulante ana = crearT("Ana", 8);
    Tripulante luis = crearT("Luis", 5);

    insertH(juan, h);
    insertH(ana, h);
    insertH(luis, h);

    Tripulante mayor = maxH(h);
    cout << "Tripulante con mayor rango: " << nombre(mayor) << " (" << rango(mayor) << ")" << endl;
    showMH(h);

    deleteMaxH(h);
    mayor = maxH(h);
    cout << "After deleting max, new max: " << nombre(mayor) << " (" << rango(mayor) << ")" << endl;
    showMH(h);

    return 0;
}