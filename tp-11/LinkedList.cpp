#include <iostream>
#include "LinkedList.h"
using namespace std;

void showIterator(ListIterator xs)
{
    NodoL *acc = xs->current;
    while (acc != NULL)
    {
        cout << acc->elem;
        if (acc->siguiente != NULL)
        {
            cout << " - ";
        }
        acc = acc->siguiente;
    }
    cout << endl;
}

void showList(LinkedList xs)
{
    NodoL *acc = xs->primero;
    while (acc != NULL)
    {
        cout << acc->elem;
        if (acc->siguiente != NULL)
        {
            cout << " - ";
        }
        acc = acc->siguiente;
    }
    cout << endl;
}

// Crea una lista vacía.
LinkedList nil()
{
    LinkedList ln = new LinkedListSt; // porque ya es un puntero
    ln->cantidad = 0;
    ln->primero = NULL;
    return ln;
};

/*
STACK
+---------------------------------------------------------------------------+
| nil frame                                                                 |
|   - ln : HEAP LinkedList (850)                                            |
+---------------------------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedListSt (850)                                    |
|  - cantidad: int (851)                                |
|  - primero: NodoL (852)                               |
+-------------------------------------------------------+
*/

// Indica si la lista está vacía.
bool isEmpty(LinkedList xs)
{
    return xs->cantidad == 0;
};

/*
STACK
+---------------------------------------------------------------------------+
| isEmpty frame                                                             |
|   - xs : HEAP LinkedList (850)                                            |
+---------------------------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedListSt                                          |
|  - cantidad: int = 0 (850)                            |
|  - primero: NULL   (851)                              |
+-------------------------------------------------------+
*/

// Devuelve el primer elemento.
int head(LinkedList xs)
{
    return xs->primero->elem;
};

/*
STACK
+---------------------------------------------------------------------------+
| head frame                                                                |
|   - xs : HEAP LinkedList (850)                                            |
+---------------------------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedListSt                                          |
|  - cantidad: int (850)                                |
|  - primero: NodoL (851)                               |
+-------------------------------------------------------+
*/

// Agrega un elemento al principio de la lista.
void Cons(int x, LinkedList xs)
{
    NodoL* n = new NodoL;
    n->elem = x;
    n->siguiente = xs->primero;
    xs->primero = n;
    xs->cantidad++;
};

/*
STACK
+-------------------------------------------------------+
| Cons frame                                            |
|  - xs (850): HEAP LinkedList (950)                    |
|  - x (851): int                                       |
|  - n (852): NodoL* --> HEAP NodoL (1050)              |
+-------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedListSt                                          |
|  - cantidad (950): int                                |
|  - primero (951): --> Heap NodoL (1050)               |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1050)                                        |
|  - siguiente (1051) --> HEAP NodoL (1250)             |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250)                                        |
|  - siguiente --> HEAP NodoL (1251)                    |
+-------------------------------------------------------+

*/

void Tail(LinkedList xs)
{
    if (xs->cantidad > 0)
    {
        NodoL* n = xs->primero->siguiente;
        delete xs->primero;
        xs->primero = n;
        xs->cantidad--;
    }
};
/*
STACK (despues)
+------------------------------------------------------+
| Tail frame                                           |                       |
|   - xs (850): LinkedList --> HEAP (950)              |
|   - n (851): --> HEAP NodoL (1250)                   |                   |
+------------------------------------------------------+

HEAP (antes)
+-------------------------------------------------------+
| LinkedListSt                                          |
|  - cantidad (950): int                                |
|  - primero (951) --> HEAP NodoL (1150)                |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1150): --> HEAP NodoL (1250)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250): int                                   |
|  - siguiente (1251): --> HEAP NodoL (1350)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1350): int                                   |
|  - siguiente (1350) --> HEAP NodoL (...)              |                                  |
+-------------------------------------------------------+

STACK (despues)
+------------------------------------------------------+
| Tail frame                                           |                       |
|   - xs (850): LinkedList --> HEAP (950)              |
|   - n (851): --> HEAP NodoL (1250)                   |                   |
+------------------------------------------------------+

HEAP (después)
+-------------------------------------------------------+
| LinkedListSt                                          |
|  - cantidad (950): int                                |
|  - primero (951) --> HEAP NodoL (1250)                |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250): int                                   |
|  - siguiente (1251): --> HEAP NodoL (1350)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1350): int                                   |
|  - siguiente (1350) --> HEAP NodoL (...)              |                                  |
+-------------------------------------------------------+

Nota: el nodo original apuntado por xs->primero (Nodo1) es liberado con delete.
*/

// Devuelve la cantidad de elementos.
int length(LinkedList xs)
{
    return xs->cantidad;
};

/*
STACK
+------------------------------------------------------+
| length frame                                         |
|   - xs (850) : HEAP LinkedList (950)                 |
+------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedListSt                                          |
|  - cantidad (950): int                                |
|  - primero (951) --> HEAP NodoL (...)                 |
+-------------------------------------------------------+
*/

// Agrega un elemento al final de la lista.
void Snoc(int x, LinkedList xs)
{
    NodoL* acc = xs->primero;
    for (int i=1; i < xs->cantidad; i++)
    {
        acc = acc->siguiente;
    }
    NodoL* n = new NodoL;
    n->elem = x;
    n->siguiente = NULL;
    acc->siguiente = n;
    xs->cantidad++;
};

/*
STACK
+------------------------------------------------------+
| Snoc frame                                           |
|   - xs (850): LinkedList --> HEAP (1050)             |
|   - x (851): int                                     |
|   - last (852): NodoL* --> HEAP NodoL (1150)         |
|   - n (853): NodoL* --> HEAP NodoL (1350)            |
+-------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedListSt                                          |
|  - cantidad (1050): int                               |
|  - primero (1051): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| Nodo1:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1151): --> HEAP NodoL (1250)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250): int                                   |
|  - siguiente (1251): --> HEAP Nodo3 (1350)            |
+-------------------------------------------------------+
| Nodo3:                                                |
|  - elem (1350): int                                   |
|  - siguiente (1350): NULL                             |
+-------------------------------------------------------+
*/

// Apunta el recorrido al primer elemento.
ListIterator getIterator(LinkedList xs)
{
    ListIterator li = new IteratorSt;
    NodoL* n = xs->primero;
    li->current = n;
    return li;
};

/*
STACK
+------------------------------------------------------+
| getIterator frame                                    |
|   - xs (850): LinkedList --> HEAP (1050)             |
|   - li (851): ListIterator --> HEAP (1150)           |
|   - n (853): NodoL* --> HEAP NodoL (1250)            |
+------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedListSt                                          |
|  - cantidad (1050): int                               |
|  - primero (1051): --> HEAP NodoL (1250)              |
+-------------------------------------------------------+
| ListIterator:                                         |
|  - current (1150): --> HEAP NodoL (1250)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250): int                                   |
|  - siguiente (1251): --> HEAP NodoL (...)             |
+-------------------------------------------------------+
*/

// Devuelve el elemento actual en el recorrido.
int current(ListIterator ixs)
{
    return ixs->current->elem;
};

/*
STACK
+------------------------------------------------------+
| current frame                                        |
|   - ixs (851): ListIterator --> HEAP (1150)          |
+------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| ListIterator:                                         |
|  - current (1150): --> HEAP NodoL (1250)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250): int                                   |
|  - siguiente (1251): --> HEAP NodoL (...)             |
+-------------------------------------------------------+
*/


// Reemplaza el elemento actual por otro elemento.
void SetCurrent(int x, ListIterator ixs)
{
    ixs->current->elem = x;
};
/*
STACK
+------------------------------------------------------+
| SetCurrent frame                                     |
|   - ixs (850): ListIterator --> HEAP (1050)          |
|   - x (851): int                                     |
+------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| ListIterator                                          |
|  - current (1051): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1151): --> HEAP NodoL (...)             |
+-------------------------------------------------------+
*/



// Pasa al siguiente elemento.
void Next(ListIterator ixs)
{
    ixs->current = ixs->current->siguiente;
};

/*
STACK
+------------------------------------------------------+
| Next frame                                           |
|   - ixs (850): ListIterator --> HEAP (1050)          |
+------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| ListIterator                                          |
|  - current (1051): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| Nodo1:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1151): --> HEAP NodoL (...)             |
+-------------------------------------------------------+
*/

// Indica si el recorrido ha terminado.
bool atEnd(ListIterator ixs)
{
    return ixs->current == NULL;
};

/*
STACK
+------------------------------------------------------+
| atEnd frame                                          |
|   - ixs (850): ListIterator --> HEAP (1050)          |
+------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| ListIterator                                          |
|  - current (1051): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1151): --> HEAP NodoL (...)             |
+-------------------------------------------------------+
*/

// Libera la memoria ocupada por el iterador.
/** como elimina en destroyL ya el nodo current esta eliminado, no necesario borrarlo otra vez.  */
void DisposeIterator(ListIterator ixs)
{
    delete ixs;
}

/*
STACK (antes)
+------------------------------------------------------+
| DisposeIterator frame                                |
|   - ixs (850): ListIterator --> HEAP (1050)          |
+------------------------------------------------------+

HEAP (antes)
+-------------------------------------------------------+
| ListIterator                                          |
|  - current (1051): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1151): --> HEAP NodoL (...)             |
+-------------------------------------------------------+


STACK (despues)
+------------------------------------------------------+
| DisposeIterator frame                                |
|   - ixs (850): ListIterator --> HEAP (1050)          |
+------------------------------------------------------+

HEAP (despues) --memory leak?
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1151): --> HEAP NodoL (...)             |
+-------------------------------------------------------+
*/

// Libera la memoria ocupada por la lista.
void DestroyL(LinkedList xs)
{
    NodoL *acc = xs->primero;
    while (acc != NULL)
    {
        NodoL *tmp = acc->siguiente;
        delete acc;
        acc = tmp;
    }
    delete xs;
};

/*
STACK (antes)
+------------------------------------------------------+
| DestroyL frame                                       |
|   - ixs (850): LinkedList --> HEAP (1050)            |
+------------------------------------------------------+

HEAP (antes)
+-------------------------------------------------------+
| LinkedList                                            |
|  - cantidad (1050): int                               | 
|  - primero (1051): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1151): --> HEAP NodoL (...)             |
+-------------------------------------------------------+


STACK (despues)
+------------------------------------------------------+
| DestroyL frame                                       |
|   - ixs (850): ListIterator --> HEAP (1050)          |
+------------------------------------------------------+

HEAP (despues) --memory leak?
+-------------------------------------------------------+
|  - ... (vacia)                                        |
+-------------------------------------------------------+
*/

/**
 * Agregar la op eración de Append a la interfaz de LinkedList, e implementarla como implementador
en O(1). */
void AppendI(LinkedList xs, LinkedList ys)
{
    NodoL *last = xs->primero;
    for (int i=1; i < xs->cantidad; i++)
    {
        last = last->siguiente;
    }
    last->siguiente = ys->primero;
    xs->cantidad = +ys->cantidad;
    delete ys;
};

/*
STACK (antes)
+------------------------------------------------------+
| AppendI frame                                        |
|   - xs (850): LinkedList --> HEAP (1050)             |
|   - ys (851): LinkedList --> HEAP (1150)             |
+------------------------------------------------------+

HEAP (antes)
+-------------------------------------------------------+
| LinkedList                                            |
|  - cantidad (1050): int                               | 
|  - primero (1051): --> HEAP NodoL (1250)              |
+-------------------------------------------------------+
| LinkedList                                            |
|  - cantidad (1150): int                               | 
|  - primero (1151): --> HEAP NodoL (1350)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250): int                                   |
|  - siguiente (1251): --> HEAP NodoL (...)             |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1350): int                                   |
|  - siguiente (1351): --> HEAP NodoL (...)             |
+-------------------------------------------------------+



STACK (despues)
+------------------------------------------------------+
| AppendI frame                                        |
|   - xs (850): LinkedList --> HEAP (1050)             |
+------------------------------------------------------+

HEAP (despues)
+-------------------------------------------------------+
| LinkedList                                            |
|  - cantidad (1050): int                               | 
|  - primero (1051): --> HEAP NodoL (1250)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250): int                                   |
|  - siguiente (1251): --> HEAP NodoL (1350)             |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1350): int                                   |
|  - siguiente (1351): --> HEAP NodoL (...)             |
+-------------------------------------------------------+

*/