#include <iostream>
#include "Jerarquia.h"
using namespace std;

struct JBSTNodeStr{
    int name;
    JBSTNodeStr* left;
    JBSTNodeStr* right;
    JBSTNodeStr* parent;
};

/*
INV. REP.:
            *El nodo raiz debe tener como parent un nodo NULL.
            *No existes dos nodos con el mismo nombre.
            *Todo nodo presente en el arbol es alcanzable desde root siguiente los punteros left y right.
            *No existe una secuencia finita de punteros left, right o parent que retorne al mismo nodo.
            *El nombre del hijo derecho de un nodo debe ser mayor que el nombre del padre.
            *El nombre del hijo izquierdo de un nodo debe ser menor que el nombre del padre.
            *El hijo derecho e hijo izquierdo de un nodo deben cumplir la propiedad de BST. 
            *Todos los nodos deben tener un parent excepto el nodo raiz.
            *El nodo parent de un nodo debe estar en el BST. 
*/

struct JBSTStr{
    JBSTNodeStr* root;  
};

JerarquiaBST fundar(int p){
//crea la jerarquia, colocando a la persona p como presidente.
    JBSTNodeStr* raiz = new JBSTNodeStr;
    raiz->name = p;
    raiz->left = NULL;
    raiz->right = NULL;
    raiz->parent = NULL;

    JerarquiaBST arbol = new JBSTStr;
    arbol->root = raiz;
    return arbol;
}

JBSTNodeStr* find(int nombre, JBSTNodeStr* t){
//busca el nombre dado en la jerarquia dada
    JBSTNodeStr* actual = t;
    while (actual != NULL && actual->name != nombre) {
        if (nombre > actual->name) {
            actual = actual->right;
        } else {
            actual = actual->left;
        }
    }
    return actual;
}

void insertar(int nuevo, int superior, JerarquiaBST t){
//PRECONDICION: Existe la persona superior en la jerarquia y no existe la persona nueva 
//inserta a la persona nuevo en la jerarquia t como subordinado directo de la persona superior
    JBSTNodeStr* nuevoN = new JBSTNodeStr;
    nuevoN->name = nuevo;
    nuevoN->left = NULL;
    nuevoN->right = NULL;
    nuevoN->parent = find(superior, t->root);
    JBSTNodeStr* actual = t->root;
    JBSTNodeStr* previo = NULL;
    while(actual != NULL){
        previo = actual;
        if(nuevo < actual->name){
            actual = actual->left;
        }
        else {
            actual = actual->right;
        }
    }
    if(nuevo < previo->name){
        previo->left = nuevoN;
    } 
    else{
        previo->right = nuevoN;
    }
}

bool esSubordinadoDe(int empleado, int superior, JerarquiaBST bst){
//PRECONDICION: Existe empleado y superior en la jerarquia bst
//indica si el empleado es subordinado de superior en la jerarquia bst 
    JBSTNodeStr* nodoRaiz = find(superior, bst->root);
    JBSTNodeStr* nodoEmpleado = find(empleado, bst->root);
    if(nodoRaiz == NULL){
        cerr<<"Error, el superior dado no existe en la jerarquia dada";
        exit(1);
    }
    if(nodoEmpleado == NULL){
        cerr<<"Error, el empleado dado no existe en la jerarquia dada";
        exit(1);
    }   
    while(nodoEmpleado->parent != NULL && nodoEmpleado->parent->name != superior){
        nodoEmpleado = nodoEmpleado->parent;
    }
    return nodoEmpleado->parent != NULL && nodoEmpleado->parent->name == superior;
}

int main() {
    // Fundar con "Maria" como presidenta
    JerarquiaBST jerarquia = fundar(1);

    // Insertar subordinados
    insertar(2, 1, jerarquia);
    insertar(3, 1, jerarquia);
    insertar(4, 3, jerarquia);
    insertar(5, 2, jerarquia);

    // Pruebas

    cout << "Carlos subordinado de Maria: " << esSubordinadoDe(2, 1, jerarquia) << endl;
    cout << "Ana subordinada de Pedro: " << esSubordinadoDe(4, 3, jerarquia) << endl;
    cout << "Ana subordinada de Maria: " << esSubordinadoDe(4, 1, jerarquia) << endl;
    cout << "Lucia subordinada de Pedro: " << esSubordinadoDe(5, 3, jerarquia) << endl;
    cout << "Maria subordinada de Ana: " << esSubordinadoDe(1, 4, jerarquia) << endl;

}