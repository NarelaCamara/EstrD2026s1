
#include <iostream>
#include "Set.h"
using namespace std;

struct NodoS {
int elem; // valor del nodo
NodoS* siguiente; // puntero al siguiente nodo
};

struct SetSt {
int cantidad; // cantidad de elementos diferentes
NodoS* primero; // puntero al primer nodo
};

typedef SetSt* Set;
/*Definir la siguiente interfaz de este tip o de conjuntos, indicando el costo obtenido (intentar que
sea lo más eficiente p osible):*/

//Crea un conjunto vacío.
Set emptyS();

//Indica si el conjunto está vacío.
bool isEmptyS(Set s);

//Indica si el elemento p ertenece al conjunto.
bool belongsS(int x, Set s);

//Agrega un elemento al conjunto.
void addS(int x, Set s);

//Quita un elemento dado.
void RemoveS(int x, Set s);

//Devuelve la cantidad de elementos.
int sizeS(Set s);

//Devuelve un arreglo con los elementos del conjunto.
int[] setToList(Set s);

//Lib era la memoria o cupada p or el conjunto
void DestroyS(Set s);


Set unionS (Set s1, Set s2);