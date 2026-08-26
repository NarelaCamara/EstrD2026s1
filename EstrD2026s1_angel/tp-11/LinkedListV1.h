#include <iostream>
using namespace std;

struct  LinkedListSt; 
typedef LinkedListSt* LinkedList; 

struct  IteratorSt;
typedef IteratorSt* ListIterator; 

// Ef temporal: O(1) - Ef espacial: O(1)
LinkedList nil();
// Crea una lista vacía.

// Ef temporal: O(1) - Ef espacial: O(1)
bool isEmpty(LinkedList xs);
// Indica si la lista está vacía.

// Ef temporal: O(1) - Ef espacial: O(1)
int head(LinkedList xs);
// Devuelve el primer elemento.

// Ef temporal: O(1) - Ef espacial: O(1)   
void Cons(int x, LinkedList xs);
// Agrega un elemento al principio de la lista.

// Ef temporal: O(1) - Ef espacial: O(1)
void Tail(LinkedList xs);
// Quita el primer elemento.

// Ef temporal: O(1) - Ef espacial: O(1)
int length(LinkedList xs);       
// Devuelve la cantidad de elementos.

// Ef temporal: O(n) - Ef espacial: O(1)
void Snoc(int x, LinkedList xs);
//  Agrega un elemento al final de la lista.

// Ef temporal: O(1) - Ef espacial: O(1)
ListIterator getIterator(LinkedList xs);
// Apunta el recorrido al primer elemento.
 
// Ef temporal: O(1) - Ef espacial: O(1)
int current(ListIterator ixs);
// Devuelve el elemento actual en el recorrido.

// Ef temporal: O(1) - Ef espacial: O(1)
void SetCurrent(int x, ListIterator ixs);
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

// Ef temporal: O(n) - Ef espacial: O(1)
void DestroyL(LinkedList xs); 
// Libera la memoria ocupada por la lista.