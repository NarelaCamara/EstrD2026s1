#include <iostream>
#include "Set.h"
using namespace std;



void showSet (Set s){
    NodoS* ns = s->primero;
    for(int i = 0; i < s->cantidad; i++){
         cout <<  ns->elem << " - ";
        ns = ns->siguiente;
    }
}

// costo: constante O(1) 
//Crea un conjunto vacío.
Set emptyS(){
    Set s = new SetSt;
    s->cantidad = 0;
    s->primero = NULL;
    return s;
}

//costo: constante O(1)
//Indica si el conjunto está vacío.
bool isEmptyS(Set s){
    return s->cantidad == 0;
}

// costo: O(n) donde n es la cantidad de elementos en el conjunto
//Indica si el elemento pertenece al conjunto.
bool belongsS(string x, Set s){
    NodoS* acc = s->primero;
    for(int i = 0; i < s->cantidad; i++){
        if(acc->elem == x){
            return true;
        }
        acc = acc->siguiente;
    }
    return false;
}

// costo: O(n) donde n es la cantidad de elementos en el conjunto
//Agrega un elemento al conjunto.
void addS(string x, Set s){

    NodoS* acc = s->primero;
    while(acc != nullptr){
        if(acc->elem == x){
            return;
        }
        acc = acc->siguiente;
    }
    NodoS* n = new NodoS;
    n->elem =x;
    n->siguiente = s->primero;
    s->primero = n;
    s->cantidad++;
};

// costo: O(n) donde n es la cantidad de elementos en el conjunto
//Quita un elemento dado.
void RemoveS(string x, Set s){
    NodoS* acc = s->primero;
    for(int i=1; i < s->cantidad; i++){
        if(acc->elem == x){
            acc->elem = acc->siguiente->elem;
            acc->siguiente = acc->siguiente->siguiente;
        }else{
            acc = acc->siguiente;
        }
        s->cantidad--;
    }
};

//costo: constante O(1)
//Devuelve la cantidad de elementos.
int sizeS(Set s){
    return s->cantidad;
};

//costo: O(n) donde n es la cantidad de elementos en el conjunto
//Devuelve una lista con los lementos del conjunto.
int* setToList(Set s){
    int* list = new int[s->cantidad];
    NodoS* acc = s->primero;
    for(int i=0;i < s->cantidad; i++){
        list[i] = acc->elem;
        acc = acc->siguiente;
    }
    return list;
}

// costo: O(n) donde n es la cantidad de elementos en el conjunto
//Libera la memoria ocupada por el conjunto
void destroyS(Set s){
    NodoS* acc = s->primero;
    for(int i=1; i < s->cantidad; i++){
        NodoS* tmp = acc->siguiente;
        delete acc;
        acc = tmp;
    };
    delete s;
};


//costo: O(n) donde n es la cantidad de elementos en el conjunto
//Devuelve la unión de dos conjuntos.
Set unionS (Set s1, Set s2){
    if(s1 != nullptr && s2 != nullptr){
        NodoS* acc = s2->primero;
        for(int i=0; i < s2->cantidad; i++){
            if(!belongsS(acc->elem, s1)){
                addS(acc->elem, s1);
            }
            acc = acc->siguiente;
        }
        return s1;
    }
}

 

int testSet() {
    std::cout << "=== Ejemplo de uso de Set ===" << std::endl;

    Set s = emptyS();
    std::cout << "Conjunto vacio: ";
    showSet(s);
    std::cout << std::endl;
    std::cout << "Agregando elementos al conjunto..." << std::endl;
    addS(5, s);
    addS(10, s);
    addS(5, s); // Intento de agregar un elemento duplicado
    addS(15, s);
    std::cout << "Conjunto despues de agregar elementos: ";
    showSet(s);
    std::cout << std::endl;
    std::cout << "Pertenece 10 al conjunto? " << (belongsS(10, s) ? "Sí" : "No") << std::endl;
    std::cout << "Pertenece 20 al conjunto? " << (belongsS(20, s) ? "Sí" : "No") << std::endl;

    std::cout << "Eliminando el elemento 10 del conjunto..." << std::endl;
    RemoveS(10, s);
    std::cout << "Conjunto despues de eliminar el elemento 10: ";
    showSet(s);

    std::cout << std::endl;

    isEmptyS(s) ? std::cout << "El conjunto está vacio." : std::cout << "El conjunto no esta vacio.";
    std::cout << std::endl;

    std::cout << "El conjunto tiene: "  << sizeS(s) << std::endl;
    std::cout << std::endl;

    int* list = setToList(s);
    std::cout << "Elementos del conjunto como lista: ";
    for (int i = 0; i < sizeS(s); i++) {
        std::cout << list[i] << " ";
    }
    std::cout << std::endl;

    Set s2 = emptyS();
    addS(20, s2);
    addS(30, s2);
    Set unionSet = unionS(s, s2);
    std::cout << "Conjunto 2: ";
    showSet(s2);
    std::cout << "Conjunto resultante de la union: ";
    showSet(unionSet);
    destroyS(s2); 
    destroyS(unionSet);
    std::cout << std::endl;

    std::cout << "=== Fin del ejemplo ===" << std::endl;

    return 0;
}