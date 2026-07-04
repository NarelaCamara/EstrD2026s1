#pragma once

#include <iostream>

struct NodoMH {
    int elem;
    NodoMH* siguiente;
};

struct MaxHeapSt {
    int cantidad;
    NodoMH* primero;
};

typedef MaxHeapSt* MaxHeap;

MaxHeap emptyH();
bool isEmptyH(MaxHeap mh);
void insertH(int x, MaxHeap mh);
int maxH(MaxHeap mh);
void deleteMaxH(MaxHeap mh);
void showMH(MaxHeap mh);

