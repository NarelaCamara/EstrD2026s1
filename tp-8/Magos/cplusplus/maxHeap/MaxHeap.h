#pragma once

#include "../mago/Mago.h"
#include <iostream>

struct NodoMH {
    Mago elem;
    NodoMH* siguiente;
};

struct MaxHeapSt {
    int cantidad;
    NodoMH* primero;
};

typedef MaxHeapSt* MaxHeap;

MaxHeap emptyH();
bool isEmptyH(MaxHeap mh);
void insertH(Mago x, MaxHeap mh);
Mago maxH(MaxHeap mh);
void deleteMaxH(MaxHeap mh);
void showMH(MaxHeap mh);
int testMaxHeap();
