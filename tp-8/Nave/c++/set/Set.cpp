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

//Crea un conjunto vacío.
Set emptyS(){
    Set s = new SetSt;
    s->cantidad = 0;
    s->primero = NULL;
    return s;
}

//Indica si el conjunto está vacío.
bool isEmptyS(Set s){
    return s->cantidad == 0;
}

//Indica si el elemento pertenece al conjunto.
bool belongsS(int x, Set s){
    NodoS* acc = s->primero;
    for(int i = 0; i < s->cantidad; i++){
        if(acc->elem == x){
            return true;
        }
        acc = acc->siguiente;
    }
    return false;
}

//Agrega un elemento al conjunto.
void addS(int x, Set s){
     NodoS* n = new NodoS;
     n->elem =x;
     n->siguiente = s->primero;
     s->primero = n;
     s->cantidad++;
};

//Quita un elemento dado.
void RemoveS(int x, Set s){
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

//Devuelve la cantidad de elementos.
int sizeS(Set s){
    return s->cantidad;
};

//Devuelve una lista con los lementos del conjunto.
LinkedList setToList(Set s){
    LinkedList l = nil();
    NodoS* acc = s->primero;
    for(int i=1;i < s->cantidad; i++){
        Cons(acc->elem, l);
        acc = acc->siguiente;
    }
    return l;
}

//Lib era la memoria o cupada p or el conjunto
void DestroyS(Set s){
    NodoS* acc = s->primero;
    for(int i=1; i < s->cantidad; i++){
        NodoS* tmp = acc->siguiente;
        delete acc;
        acc = tmp;
    };
    delete s;
};


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

    Set s = emptyS();
    std::cout << "Conjunto vacío: ";
    showSet(s);
    std::cout << std::endl;
    std::cout << "Agregando elementos al conjunto..." << std::endl;
    addS(5, s);
    addS(10, s);
    addS(5, s); // Intento de agregar un elemento duplicado
    addS(15, s);
    std::cout << "Conjunto después de agregar elementos: ";
    showSet(s);
    std::cout << std::endl;
    std::cout << "Pertenece 10 al conjunto? " << (belongsS(10, s) ? "Sí" : "No") << std::endl;
    std::cout << "Pertenece 20 al conjunto? " << (belongsS(20, s) ? "Sí" : "No") << std::endl;

    std::cout << "Eliminando el elemento 10 del conjunto..." << std::endl;
    RemoveS(10, s);
    std::cout << "Conjunto después de eliminar el elemento 10: ";
    showSet(s);

    std::cout << std::endl;

    isEmptyS(s) ? std::cout << "El conjunto está vacío." : std::cout << "El conjunto no está vacío.";
    std::cout << std::endl;

    std::cout << "El conjunto tiene: "  << sizeS(s) << std::endl;
    std::cout << std::endl;

    std::vector<int> list = setToList(s);
    std::cout << "Elementos del conjunto como lista: ";
    for (const auto& elem : list) {
        std::cout << elem << " ";
    }
    std::cout << std::endl;

    unionset s2 = emptyS();
    addS(20, s2);
    addS(30, s2);
    Set unionSet = unionS(s, s2);
    std::cout << "Conjunto resultante de la unión: ";
    showSet(unionSet);

    destroyS(s2);
    showSet(unionSet);
    destroyS(unionSet);

    std::cout << "=== Fin del ejemplo ===" << std::endl;

    return 0;
}