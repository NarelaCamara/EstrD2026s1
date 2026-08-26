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

    JerarquiaBST jerarquia = new JBSTStr;
    jerarquia->root = raiz;
    return jerarquia;
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
//Modifica la jerarquia t agregando a la persona de nombre nuevo como subordinado directo de la persona cuyo nombre es superior.
//PRECONDICIONES: 
//Existe una persona en la jerarquia t con el nombre del superior dado.
//No existe una persona en la jerarquia t con el nombre nuevo dado. 
    JBSTNodeStr* nodoRaiz = find(superior,t->root);
    if(nodoRaiz == NULL){
        cerr<<"Error, el Superior dado no se encuentra en la jerarquia dada";
        exit(1);
    }
    if(find(nuevo,t->root) != NULL){
        cerr<<"Error, el nombre dado ya se encuentra en la jerarquia dada";
        exit(1);
    }
    JBSTNodeStr* nuevoN = new JBSTNodeStr;
    nuevoN->name = nuevo;
    nuevoN->parent = nodoRaiz;
    if(nuevo < nodoRaiz->name){
        if(nuevo < nodoRaiz->left->name){
        nuevoN->left = NULL;
        nuevoN->right = nodoRaiz->left;
        }
        else{
            nuevoN->left = nodoRaiz->left;
            nuevoN->right = NULL;
        }
        nodoRaiz->left->parent = nuevoN;
        nodoRaiz->left = nuevoN;
    }
    else{
        if(nuevo < nodoRaiz->right->name){
            nuevoN->left = NULL;
            nuevoN->right = nodoRaiz->right;
        }
        else{
            nuevoN->left = nodoRaiz->right;
            nuevoN->right = NULL;
        }
        nodoRaiz->right->parent = nuevoN;
        nodoRaiz->right = nuevoN;
    }
}

bool esSubordinadoDe(int empleado, int superior, JerarquiaBST bst){
//Indica si la persona con nombre empleado dado es subordinada (directa o indirectamente) de la persona con nombre superior dado.
//PRECONDICIONES:
//Existe una persona en la jerarquia dada con el nombre del empleado dado.
//Existe una persona en la jerarquia dada con el nombre del superior dado.
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
    while(nodoEmpleado->parent->name != superior){
        nodoEmpleado = nodoEmpleado->parent;
    }
    return nodoEmpleado->parent->name == superior;
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