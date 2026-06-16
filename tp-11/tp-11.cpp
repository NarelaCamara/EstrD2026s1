#include <iostream>
using namespace std;
#include "LinkedList.cpp"
#include "Set.cpp"
#include "Queue.cpp"


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
    LinkedList c = xs;
    c= xs;
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
void Append(LinkedList xs, LinkedList ys){
    if(!isEmpty(xs)){
        ListIterator li = getIterator(ys);
        while(!atEnd(li)){
            Snoc(current(li), xs);
            Next(li);
        }
        DisposeIterator(li);
    }
    delete ys;
};

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
    /*
    cout << "LinkedList ----------------------------------------- " << endl;
    LinkedList l = nil();
    Cons(4,l);
    Cons(5,l);
    Cons(6,l);
    Cons(7,l);
    showList(l);
    cout << "Head: " << head(l) << endl;
    Tail(l);
    showList(l);
    cout << "Second: " << head(l) << endl;
    cout << "isEmpty: " << (isEmpty(l) ? "true" : "false") << endl;
    Snoc(3,l); 
    Snoc(2,l);
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

    cout << "copy: ";
    showList(copy(l));

    LinkedList c = nil();
    Cons(50, c);
    Cons(51, c);
    Cons(52, c);

    Sucesores(c);
    Append(c, l);
    cout << "append: "; showList(c);

     
    cout << "Ejercicio LinkedList ---- implementador ----------------------------------------- " << endl;
    LinkedList c1 = nil();
    Cons(50, c);
    Cons(51, c);
    Cons(52, c);

    LinkedList c2 = nil();
    Cons(53, c);
    Cons(54, c);
    Cons(55, c);

    AppendI(c1, c2);
    cout << "AppendI: No funciona :("; showList(c1);
    cout << "Ejercicio Set ---- implementador ----------------------------------------- " << endl;
    Set s = emptyS();
    AddS(1,s);
    AddS(2,s);
    AddS(3,s);
    AddS(4,s);
    cout << "isEmptyS "<< (isEmptyS(s)? "true" : "false") << endl;
    cout << "belongsS: " << (belongsS(4, s) ? "true" : "false") << endl;
    RemoveS(4,s);
    cout << "sizes: " << sizeS(s) << endl;
    cout << "showSet: "; showSet(s); cout << endl;
    cout << "setToList: No funciona correctamente :("; showList(setToList(s));
    DestroyS(s);
    cout << "DestroyS fue llamado correctamente." << endl;

    */

    cout << "Ejercicio Queues ---- implementador ----------------------------------------- " << endl;

    Queue q = emptyQ();
    Enqueue(1, q);
    Enqueue(2, q);
    Enqueue(3, q);
    Enqueue(4, q);
    cout << "isEmptyQ: " << (isEmptyQ(q) ? "true" : "false") << endl;
    cout << "first: " << firstQ(q) << endl;
    cout << "ShowQueue: "; showQueue(q);
    Dequeue(q);
    cout << "ShowQueue: "; showQueue(q);
    cout << "lengthQ: "; lengthQ(q);

    Queue q1 = emptyQ();
    Enqueue(11, q1);
    Enqueue(12, q1);
    Enqueue(13, q1);
    Enqueue(14, q1);

    MergeQ(q1,q);
    cout << "MergeQ: "; showQueue(q1);

    DestroyQ(q);
    cout << "DestroyQ fue llamado correctamente." << endl;


    cout << "Ejercicio Tree ---- implementador ----------------------------------------- " << endl;
    
    
    /**Heaps
    Ejercicio 9
    Implementar heaps binarias según el có digo de la teórica, y probarlas con ejemplos */

    return 0;
};