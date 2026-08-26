#include <iostream>
#include "LinkedList.h"
using namespace std;

struct NodoL {
  int elem; // valor del nodo
  NodoL* siguiente; // puntero al siguiente nodo
};

struct LinkedListSt {
// INV.REP.: cantidad indica la cantidad de nodos que se pueden recorrer
// desde primero por siguiente hasta alcanzar a NULL
  int cantidad; // cantidad de elementos
  NodoL* primero; // puntero al primer nodo
};

struct IteratorSt {
  NodoL* current;
};
//si me dan una funcion como usaurio puedo recorrer los nodos de forma iterativa, en snoc tengo que hacerlo de esa forma, por ejemplo con un while

LinkedList nil(){
//Crea una lista vacía.
    LinkedListSt* ll = new LinkedListSt;
    ll->cantidad = 0;
    ll->primero = NULL;
return ll;
}

bool isEmpty(LinkedList xs){
//Indica si la lista está vacía.
return xs->primero == NULL;
}

int head(LinkedList xs){
//Devuelve el primer elemento.
return xs->primero->elem;
}

bool haySiguiente(LinkedList xs){
  return (xs->primero != NULL && xs->primero->siguiente != NULL);
}

void Cons(int x, LinkedList xs){
//Agrega un elemento al principio de la lista.
  NodoL* nodo = new NodoL;
  nodo->elem = x;
  nodo->siguiente = xs->primero;
  xs->primero = nodo;
  xs->cantidad++;
}

void Tail(LinkedList xs){
//Quita el primer elemento.
    NodoL* temp = xs->primero;
    xs->primero = xs->primero->siguiente;
    xs->cantidad--;
    delete temp;
}

int length(LinkedList xs){
//Devuelve la cantidad de elementos.
return xs->cantidad;
}

void Snoc(int x, LinkedList xs){
//Agrega un elemento al final de la lista.
  NodoL* nodo = new NodoL;
  nodo->elem = x;
  nodo->siguiente  = NULL;
  if (xs->primero == NULL) {
    xs->primero = nodo;
  }
  else {
    NodoL* nodoAux = xs->primero;
    while(nodoAux->siguiente != NULL){
      nodoAux = nodoAux->siguiente;
    }  
    nodoAux->siguiente = nodo;
  }
  xs->cantidad++;
}

//Ejercicio 3
void Append(LinkedList xs, LinkedList ys){
  NodoL* nodoAux = ys->primero;
  while(nodoAux->siguiente != NULL){
    Snoc(nodoAux->elem, xs);
    nodoAux = nodoAux->siguiente;
  }
  Snoc(nodoAux->elem, xs);
  delete ys;
}

/*void Append(List xs, List ys) { append con ultimo
  if (isEmpty(xs)){ 
    xs->primero = ys->primero;
  } 
  else{
   xs->ultimo->siguiente = ys->primero; 
  }
  if (!isEmpty(ys)){
   xs->ultimo = ys->ultimo;        
  }
  xs->cantidad += ys->cantidad;
  delete ys;
}*/

ListIterator getIterator(LinkedList xs){
//Apunta el recorrido al primer elemento.
  IteratorSt* ixs = new IteratorSt;
  ixs->current = xs->primero;
  return ixs;
}

int current(ListIterator ixs){
//Devuelve el elemento actual en el recorrido.
return ixs->current->elem;
}

void SetCurrent(int x, ListIterator ixs){
//Reemplaza el elemento actual por otro elemento.
  ixs->current->elem = x;
}

void Next(ListIterator ixs){
//Pasa al siguiente elemento.
  ixs->current = ixs->current->siguiente;  
}

bool atEnd(ListIterator ixs){
//Indica si el recorrido ha terminado.
return (ixs->current == NULL);
}

void DisposeIterator(ListIterator ixs){
//Libera la memoria ocupada por el iterador.
delete ixs;
}

void DestroyL(LinkedList xs){
//Libera la memoria ocupada por la lista.
  while (xs->primero != NULL) {
    NodoL* temp = xs->primero;
    xs->primero = xs->primero->siguiente;
    delete temp;
  }
  delete xs;
}

void ShowList(LinkedListSt* xs) {
  NodoL* current = xs->primero;
  cout << "[";
  if (current!=NULL) {
    cout << " " << current->elem;
    current = current->siguiente;
  }
  while (current!=NULL) {  
    cout << ", " << current->elem;
    current = current->siguiente;
  }
  cout << " ]";
  delete current;
}
  
/*
int main(){
LinkedList lista = nil();
ShowList(lista);
Cons(1,lista);
cout << head(lista) << endl;
Cons(2,lista);
ShowList(lista);
Snoc(3,lista);
ShowList(lista);
DestroyL(lista);
ShowList(lista);
}
*/