#include <iostream>
#include <iomanip>
using namespace std;
#include "TList.h"
#include "BinaryTree.h"

struct NodeTL {
  Tree    value;        // INV. REP.:
  NodeTL* next;         //  * los punteros internos NO son compartidos
};

struct TListHeaderSt {  // INV. REP.:
  NodeTL* first;        //  * first = NULL sii last  = NULL
  int     size;         //  * size es la cant. de nodos a recorrer
  NodeTL* last;         //  *   hasta llegar a un NULL desde first
};                      //  * si last != NULL, last->next = NULL

TList emptyTL() {    // O(1)  
  TListHeaderSt* xs = new TListHeaderSt;
  xs->first = NULL;
  xs->last  = NULL;
  xs->size  = 0;
  return xs;
}

bool isEmptyTL(TList xs) {  // O(1)
  return (xs->size==0);
}

Tree headTL(TList xs) {  // O(1)
  // PRECOND: lista no vacía
  return (xs->first->value);
}

void ConsTL(Tree t, TList xs) {  // O(1)
  NodeTL* node = new NodeTL;
  node->value = t;
  node->next  = xs->first;
  xs->first   = node;
  if (xs->last == NULL) { xs->last = node; }
  xs->size++;
}

void SnocTL(TList xs, Tree t) {  // O(1)
  NodeTL* node = new NodeTL;
  node->value = t;
  node->next  = NULL;
  if (xs->first == NULL) { xs->first = node;      }
  else                   { xs->last->next = node; }
  xs->last = node;
  xs->size++;
}

void TailTL(TList xs) {  // O(1)
  // PRECOND: lista no vacía
  NodeTL* temp = xs->first;
  xs->first = xs->first->next;
  if(xs->first==NULL) { xs->last==NULL; }
  xs->size--;
  delete temp;
}

int lengthTL(TList xs) {
  return xs->size;
}

void LiberarTL(TList xs) {  // O(n)
  NodeTL* temp = xs->first;
  while (xs->first!=NULL) {  
    xs->first = xs->first->next;
    delete temp;
  }
  delete xs;
}

struct IteratorSt {
    // INV.REP.: el puntero NO es NULL
    NodeTL* current;
};


ListIterator getIterator(TList xs) {
    IteratorSt* ixs = new IteratorSt;
    ixs->current = xs->first; 
    return ixs;
}

// Ef temporal: O(1), acceder a campos de registros en memoria dinámica son operaciones de orden constante
// Ef espacial: O(1), en el stack frame de 'current', 1 espacios para el parámetro 'ixs' (puntero al iterador)
Tree current(ListIterator ixs) {
    return ixs->current->value;
}

// Ef temporal: O(1), acceder a campos de registros en memoria dinámica y asignar un nuevo dato son operaciones de orden constante
// Ef espacial: O(1), en el stack frame de 'SetCurrent', 2 espacios para los parámetros 'x' (elemento a settear) y 'ixs' (puntero al iterador)
// void SetCurrent(int x, ListIterator ixs) {
//     ixs->current->value = x;
// }

// Ef temporal: O(1), acceder a campos de registros en memoria dinámica y asignar un nuevo dato son operaciones de orden constante
// Ef espacial: O(1), en el stack frame de 'Next', 1 espacio para el parámetro 'ixs' (puntero al iterador)
void Next(ListIterator ixs) {
    ixs->current = ixs->current->next;
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