#include <iostream>
using namespace std;
#include "LinkedList.cpp"


//Devuelve la suma de to dos los elementos
int sumatoria (LinkedList xs){
    int sum = 0;
    while(xs->cantidad > 0){
        sum = sum + head(xs);
        Tail(xs);
    }
    cout << endl;
    return sum;
}


//Incrementa en uno to dos los elementos.
void Sucesores (LinkedList xs){
    LinkedList nll =nil();
    while(xs->cantidad > 0){
        int h = head(xs) +1;
        Tail(xs);
        Snoc(h, nll);
        DestroyL(xs);
        xs= nll;

    };
};

//Indica si el elemento p ertenece a la lista.
bool pertence (int x, LinkedList xs){};

//Indica la cantidad de elementos iguales a x.
int apariciones(int x, LinkedList xs){};

//Devuelve el elemento más chico de la lista.
int minimo(LinkedList xs){};

/*Dada una lista genera otra con los mismos elementos, en el mismo orden.
Nota: notar que el costo mejoraría si Snoc fuese O(1), ¾cómo p o dría serlo?*/
LinkedList copy(LinkedList xs){};

/*Agrega to dos los elementos de la segunda lista al final de los de la primera.
La segunda lista se destruye.
Nota: notar que el costo mejoraría si Snoc fuese O(1), ¾cómo p o dría serlo?*/
void Append(LinkedList xs, LinkedList ys){};

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
    Snoc(5,l); //falto 5 donde esta???
    Snoc(6,l);
    cout << "length: " << length(l)<< endl; //deberia ser 5
    showList(l);

    cout << "ListIterator ----------------------------------------- " << endl;
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
    /***
    DisposeIterator(li);
    DestroyL(l);
    cout << "DisposeIterator y DestroyL llamados correctamente." << endl; 
    */

    cout << "LinkedList ---- usuario ----------------------------------------- " << endl;
    showList(l);
    cout << "sumatoria: " << sumatoria(l) << endl;
    Sucesores(l);
    cout << "Sucesores: "; showList(l);


    /**Heaps
    Ejercicio 9
    Implementar heaps binarias según el có digo de la teórica, y probarlas con ejemplos */

    return 0;
};