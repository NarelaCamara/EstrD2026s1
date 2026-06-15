#include <iostream>
using namespace std;
#include "LinkedList.cpp"
#include "Set.cpp"



//Devuelve la suma de to dos los elementos
int sumatoria (LinkedList xs){
    int sum = 0;
    if (!isEmpty(xs)) {
        ListIterator li = getIterator(xs);
        while (!atEnd(li)) {
            sum = sum + current(li);
            Next(li);
        }
        DisposeIterator(li);
    }
    return sum;
}

/*
STACK
+------------------------------------------------------+
| sumatoria frame                                      |
|   - xs (850): LinkedList --> HEAP (1050)             |
|   - sum (851): int                                   |
|   - li (852): ListIterator --> HEAP NodoL (1550)     |
+------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedList                                            |
|  - cantidad (1050): int                               |
|  - primero (1051): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| ListIterator                                          |
|  - current (1550): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1151): --> HEAP NodoL (1250)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250): int                                   |
|  - siguiente (1251): --> HEAP NodoL (1350)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1350): int                                   |
|  - siguiente (1350): NULL                             |
+-------------------------------------------------------+
*/


//Incrementa en uno to dos los elementos.
void Sucesores (LinkedList xs){
    if (isEmpty(xs)) return;
    ListIterator li = getIterator(xs);
    while (!atEnd(li)) {
        SetCurrent(current(li) + 1, li);
        Next(li);
    }
    DisposeIterator(li);
}
/*
STACK
+------------------------------------------------------+
| Sucesores frame                                      |
|   - xs (850): LinkedList --> HEAP (1050)             |
|   - li (852): ListIterator --> HEAP NodoL (1550)     |
+------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedList                                            |
|  - cantidad (1050): int                               |
|  - primero (1051): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| ListIterator                                          |
|  - current (1550): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1151): --> HEAP NodoL (1250)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250): int                                   |
|  - siguiente (1251): --> HEAP NodoL (1350)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1350): int                                   |
|  - siguiente (1350): NULL                             |
+-------------------------------------------------------+
*/


//Indica si el elemento pertenece a la lista.
bool pertence (int x, LinkedList xs){
    bool p = false;
    if (!isEmpty(xs)) {
        ListIterator li = getIterator(xs);
        while (!atEnd(li)) {
            p = p || current(li) == x;
            Next(li);
        }
        DisposeIterator(li);
    }
    return p;
};

/*
STACK
+------------------------------------------------------+
| pertence frame                                      |
|   - xs (850): LinkedList --> HEAP (1050)             |
|   - li (852): ListIterator --> HEAP (1550)           |
|   - p (853): bool                                    |
|   - x (854): int                                     |
+------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedList                                            |
|  - cantidad (1050): int                               |
|  - primero (1051): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| ListIterator                                          |
|  - current (1550): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1151): --> HEAP NodoL (1250)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250): int                                   |
|  - siguiente (1251): --> HEAP NodoL (1350)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1350): int                                   |
|  - siguiente (1350): NULL                             |
+-------------------------------------------------------+
*/


//Indica la cantidad de elementos iguales a x.
int apariciones(int x, LinkedList xs){
    int p = 0;
    if (!isEmpty(xs)) {
        ListIterator li = getIterator(xs);
        while (!atEnd(li)) {
            p =+ current(li) == x ? 1 : 0;
            Next(li);
        }
        DisposeIterator(li);
    }
    return p;
};

/*
STACK
+------------------------------------------------------+
| apariciones frame                                    |
|   - xs (850): LinkedList --> HEAP (1050)             |
|   - li (852): ListIterator --> HEAP (1550)           |
|   - p (853): int                                     |
|   - x (854): int                                     |
+------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedList                                            |
|  - cantidad (1050): int                               |
|  - primero (1051): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| ListIterator                                          |
|  - current (1550): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1151): --> HEAP NodoL (1250)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250): int                                   |
|  - siguiente (1251): --> HEAP NodoL (1350)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1350): int                                   |
|  - siguiente (1350): NULL                             |
+-------------------------------------------------------+
*/

//Devuelve el elemento más chico de la lista.
int minimo(LinkedList xs){
    int min = 0;
    if (!isEmpty(xs)) {
        ListIterator li = getIterator(xs);
        min = current(li);
        while (!atEnd(li)) {
            int c = current(li);
            min =+ c >= min ? min : c;
            Next(li);
        }
        DisposeIterator(li);
    }
    return min;
};
/*
STACK
+------------------------------------------------------+
| minimo frame                                         |
|   - xs (850): LinkedList --> HEAP (1050)             |
|   - li (852): ListIterator --> HEAP (1550)           |
|   - min (853): int                                   |
+------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedList                                            |
|  - cantidad (1050): int                               |
|  - primero (1051): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| ListIterator                                          |
|  - current (1550): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1151): --> HEAP NodoL (1250)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250): int                                   |
|  - siguiente (1251): --> HEAP NodoL (1350)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1350): int                                   |
|  - siguiente (1350): NULL                             |
+-------------------------------------------------------+
*/



/*Dada una lista genera otra con los mismos elementos, en el mismo orden.
Nota: notar que el costo mejoraría si Snoc fuese O(1), ¾cómo p o dría serlo?*/
LinkedList copy(LinkedList xs){
    LinkedList c = new LinkedListSt;
    ListIterator li = getIterator(xs);
    if(!isEmpty(xs)){
        while(!atEnd(li)){
            Snoc(current(li), c);
            Next(li);
        }
        DisposeIterator(li);
    }
    return c;
};

/*
STACK
+------------------------------------------------------+
| copy frame                                           |
|   - xs (850): LinkedList --> HEAP (1050)             |
|   - c (851): LinkedList --> HEAP (2050)              |
|   - li (852): ListIterator --> HEAP (1550)           |
+------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedList                                            |
|  - cantidad (2050): int                               |
|  - primero (2051): --> HEAP NodoL (...)               |
+-------------------------------------------------------+
| LinkedList                                            |
|  - cantidad (1050): int                               |
|  - primero (1051): --> HEAP NodoL (...)               |
+-------------------------------------------------------+
| ListIterator                                          |
|  - current (1550): --> HEAP NodoL (...)               |
+-------------------------------------------------------+
*/



/*Agrega to dos los elementos de la segunda lista al final de los de la primera.
La segunda lista se destruye.
Nota: notar que el costo mejoraría si Snoc fuese O(1), ¾cómo p o dría serlo?*/
void Append(LinkedList xs, LinkedList ys){};

/*
STACK
+------------------------------------------------------+
| Append frame                                         |
|   - xs (850): LinkedList --> HEAP (1050)             |
|   - ys (851): LinkedList --> HEAP (1150)             |
+------------------------------------------------------+

HEAP
+-------------------------------------------------------+
| LinkedList                                            |
|  - cantidad (1050): int                               |
|  - primero (1051): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| LinkedList                                            |
|  - cantidad (1050): int                               |
|  - primero (1051): --> HEAP NodoL (1150)              |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1150): int                                   |
|  - siguiente (1151): --> HEAP NodoL (1250)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1250): int                                   |
|  - siguiente (1251): --> HEAP NodoL (1350)            |
+-------------------------------------------------------+
| NodoL:                                                |
|  - elem (1350): int                                   |
|  - siguiente (1350): NULL                             |
+-------------------------------------------------------+
*/



//cero es falso y uno es verdadero
int main() {
    cout << "LinkedList ----------------------------------------- " << endl;
    LinkedList l = nil();
    Cons(1,l);
    Cons(2,l);
    Cons(3,l);
    Cons(4,l);
    showList(l);
    cout << "Head: " << head(l) << endl;
    Tail(l);
    showList(l);
    cout << "Second: " << head(l) << endl;
    cout << "isEmpty: " << (isEmpty(l) ? "true" : "false") << endl;
    Snoc(5,l); 
    Snoc(6,l);
    cout << "length: " << length(l)<< endl;
    showList(l);

    cout << "ListIterator ----implementador ------------------------------------- " << endl;
    ListIterator li = getIterator(l);
    cout << "getIterator: ";
    showIterator(li);
    cout << "current: " << current(li) << endl;
    SetCurrent(6, li);
    cout << "setCurrent: " << current(li) << endl;
    showIterator(li);
    Next(li);
    cout << "setCurrent: " << current(li) << endl;
    showIterator(li);
    cout << "atEnd: " << (atEnd(li) ? "true" : "false")<< endl;
    DisposeIterator(li);
    DestroyL(l);
    cout << "DisposeIterator y DestroyL llamados correctamente." << endl; 

    l = nil();
    Cons(1,l);
    Cons(3,l);
    Cons(4,l);  
    li = getIterator(l);
    
    cout << "LinkedList ---- usuario ----------------------------------------- " << endl;
    showList(l);
    cout << "sumatoria: " << sumatoria(l) << endl;
    Sucesores(l);
    cout << "Sucesores: "; showList(l);
    cout << "pertenece: " << (pertence(2,l) ? "true" : "false" ) << endl;
    cout << "apariciones: " << apariciones(2, l) << endl;
    cout << "minimo: " << minimo(l) << endl;

    LinkedList c = copy(l);
    cout << "copy: ";
    showList(c); cout << endl;

    Sucesores(c);
    Append(l, c);
    cout << "append: "; showList(l);

    cout << "Ejercicio LinkedList ---- implementador ----------------------------------------- " << endl;
    AppendI(l, c);
    cout << "appendI: "; showList(l);
    
    cout << "Ejercicio Set ---- implementador ----------------------------------------- " << endl;

    cout << "Ejercicio Set ---- usuario ----------------------------------------- " << endl;

    cout << "Ejercicio Queues ---- implementador ----------------------------------------- " << endl;

    cout << "Ejercicio Tree ---- implementador ----------------------------------------- " << endl;
    /**Heaps
    Ejercicio 9
    Implementar heaps binarias según el có digo de la teórica, y probarlas con ejemplos */

    return 0;
};