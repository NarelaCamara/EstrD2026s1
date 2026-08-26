#include <iostream>
using namespace std;
// #ifndef TREEHEADER
#include "BinaryTree.h"
// #endif


struct  TListHeaderSt;
typedef TListHeaderSt* TList; // INV.REP.: el puntero NO es NULL

struct  IteratorSt;
typedef IteratorSt* ListIterator; 

TList emptyTL();
void ConsTL(Tree n, TList xs);  
void SnocTL(TList xs, Tree t);  
bool isEmptyTL(TList xs);
Tree headTL(TList xs); // PRECOND: lista no vacía
void TailTL(TList xs); // PRECOND: lista no vacía
int  lengthTL(TList xs);
void LiberarTL(TList xs);

// Ef temporal: O(1) - Ef espacial: O(1)
ListIterator getIterator(TList xs);
// Apunta el recorrido al primer elemento.
 
// Ef temporal: O(1) - Ef espacial: O(1)
Tree current(ListIterator ixs);
// Devuelve el elemento actual en el recorrido.

// Ef temporal: O(1) - Ef espacial: O(1)
// void SetCurrent(int x, ListIterator ixs);
// Reemplaza el elemento actual por otro elemento.

// Ef temporal: O(1) - Ef espacial: O(1)
void Next(ListIterator ixs);
// Pasa al siguiente elemento.

// Ef temporal: O(1) - Ef espacial: O(1)
bool atEnd(ListIterator ixs);
// Indica si el recorrido ha terminado.

// Ef temporal: O(1) - Ef espacial: O(1)
void DisposeIterator(ListIterator ixs);
// Libera la memoria ocupada por el iterador.