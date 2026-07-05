#include <iostream>
#include "MaxHeap.h"

using namespace std;

MaxHeap emptyH() {
    MaxHeap mh = new MaxHeapSt;
    mh->cantidad = 0;
    mh->primero = nullptr;
    return mh;
}

bool isEmptyH(MaxHeap mh) {
    return mh == nullptr || mh->cantidad == 0;
}

void insertH(int x, MaxHeap mh) {
    if (mh == nullptr) {
        return;
    }

    NodoMH* nuevo = new NodoMH;
    nuevo->elem = x;
    nuevo->siguiente = nullptr;

    if (mh->primero == nullptr || x > mh->primero->elem) {
        nuevo->siguiente = mh->primero;
        mh->primero = nuevo;
    } else {
        NodoMH* actual = mh->primero;
        while (actual->siguiente != nullptr && actual->siguiente->elem >= x) {
            actual = actual->siguiente;
        }
        nuevo->siguiente = actual->siguiente;
        actual->siguiente = nuevo;
    }

    mh->cantidad++;
}

int maxH(MaxHeap mh) {
    if (mh == nullptr || mh->primero == nullptr) {
        return -1;
    }
    return mh->primero->elem;
}

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
        cout << actual->elem;
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

    insertH(10, h);
    insertH(20, h);
    insertH(5, h);
    insertH(30, h);

    cout << "Max element: " << maxH(h) << endl;
    showMH(h);

    deleteMaxH(h);
    cout << "After deleting max, new max: " << maxH(h) << endl;
    showMH(h);

    return 0;
}