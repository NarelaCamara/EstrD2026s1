#pragma once

#include <iostream>
#include "../tripulante/Tripulante.h"

struct NodoMH {
    Tripulante elem;
    NodoMH* siguiente;
};

struct MaxHeapSt {
    int cantidad;
    NodoMH* primero;
};

typedef MaxHeapSt* MaxHeap;

MaxHeap emptyH();
bool isEmptyH(MaxHeap mh);
void insertH(Tripulante t, MaxHeap mh);
Tripulante maxH(MaxHeap mh);
void deleteMaxH(MaxHeap mh);
void showMH(MaxHeap mh);
int testMaxHeap();
