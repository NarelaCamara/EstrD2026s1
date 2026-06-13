#include <iostream>
#include "ArrayList.h"
using namespace std;

struct NodeT {
int elem;
NodeT* left;
NodeT* right;
};
typedef NodeT* Tree;
//definir la siguiente interfaz:
Tree emptyT();

Tree nodeT(int elem, Tree left, Tree right);

bool isEmptyT(Tree t);

int rootT(Tree t);

Tree left(Tree t);

Tree right(Tree t);

int sumarT(Tree t);
//Dado un árb ol binario de enteros devuelve la suma entre sus elementos.
 int sizeT(Tree t);
//Dado un árb ol binario devuelve su cantidad de elementos, es decir, el tamaño del árb ol (size
//en inglés).
 bool perteneceT(int e, Tree t);
//Dados un elemento y un árb ol binario devuelve True si existe un elemento igual a ese en el árbol.
int aparicionesT(int e, Tree t);
//Dados un elemento e y un árb ol binario devuelve la cantidad de elementos del árb ol que son
//iguales a e.
int heightT(Tree t);
//Dado un árb ol devuelve su altura.
ArrayList toList(Tree t);
//Dado un árb ol devuelve una lista con to dos sus elementos.
ArrayList leaves(Tree t);
//Dado un árb ol devuelve los elementos que se encuentran en sus ho jas.
 ArrayList levelN(int n, Tree t);
//Dados un número n y un árb ol devuelve una lista con los no dos de nivel n