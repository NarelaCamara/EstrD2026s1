
#include "Tree.cpp"

/**Definir las funciones del punto anterior utilizando BFS (recorrido iterativo a lo ancho), a excep ción
de heightT, leaves y levelN. Para esto, utilizar una Queue de Tree. */

struct NodoQ {
Tree elem; // valor del nodo
NodoQ* siguiente; // puntero al siguiente nodo
};

struct QueueTreeSt {
int cantidad; // cantidad de elementos
NodoQ* primero; // puntero al primer nodo
NodoQ* ultimo; // puntero al ultimo nodo
};


typedef QueueTreeSt* QueueTree;