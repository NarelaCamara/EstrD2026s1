#include <iostream>
#include "Ronda.h"
using namespace std;

//Los invariantes de las siguiente estructuras estan bien? 
struct RondaNode {
    int value;
    RondaNode* next;
    RondaNode* prev;
}; 

/*
INV. REP.:
            *Los nodos Next y Prev no pueden ser NULL.

*/

struct RondaStr {
    RondaNode* current;
};
//typedef RondaStr* Ronda;
/*
INV. REP.:
            *Ronda no puede ser NULL.
            *Para cualquier nodo existe una secuencia de nodos que permite alcanzar al nodo inicial a travez de los atributos 
            "next" y "prev", es decir, la estructura de nodos es un ciclo.
            *Todo nodo es previo de su siguiente.
            *Todo nodo es siguiente de su previo.

*/

Ronda mkRonda(){
    RondaStr* ronda = new RondaStr;
    ronda->current = NULL;
    return ronda;
}

int current(Ronda ronda){
    if(ronda->current == NULL){
        cerr<<"Ronda vacia";
        exit(1);
    }
    return ronda->current->value;
}

void move(int pos, Ronda ronda){
    if(ronda->current == NULL){
        cerr<<"Ronda vacia";
        exit(1);
    }
    else {
        for(int i = 0; i < pos; i++){
            ronda->current = ronda->current->next;
        }
    }
}

void insert(int value, Ronda ronda){
    RondaNode* node = new RondaNode;
    node->value = value;
    if(ronda->current == NULL){
        node->next = node;
        node->prev = node;
        ronda->current = node;
    }
    else {
        RondaNode* nextNode = ronda->current->next;
        node->next = nextNode;
        node->prev = ronda->current;
        ronda->current->next = node;
        nextNode->prev = node;
        ronda->current = node; 
    }
}

void remove(Ronda ronda){
    RondaNode* actual = ronda->current;
    if(actual == NULL){
        cerr<<"Ronda vacia";
        exit(1);
    }
    else {
        if(actual->next == actual){
            ronda->current = NULL;
            delete actual;
        }
        else {
            actual->next->prev = actual->prev;
            actual->prev->next = actual->next;
            ronda->current = actual->prev;
            delete actual;
        }
    }
}

int length(Ronda ronda){
    if(ronda->current == NULL){
        return 0;
    }
    int cantidadNodos = 1;
    RondaNode* recorrido = ronda->current->next;
    while(recorrido != ronda->current){
        cantidadNodos ++;
        recorrido = recorrido->next;
    }
    return cantidadNodos;
}

int lenghtProfe(Ronda ronda){
    int cont = 0;
    RondaNode* actual = ronda->current;
    if(actual != NULL){
        cont++;
        actual->next;
        while(actual != ronda->current){
            cont++;
            actual = actual->next;
        }
    }    
    return cont;
}

int lenght(Ronda ronda){
    int cantidadNodos = 0;
    RondaNode* actual = ronda->current;
    RondaNode* siguiente = NULL;
    while(actual != siguiente){
        cantidadNodos++;
        siguiente = actual->next;
    }    
    return cantidadNodos;
}

int lenghtMio(Ronda ronda){
    if (ronda->current == NULL){
        return 0;
    }  
    int cont = 0;
    RondaNode* actual = ronda->current;
    while(actual != ronda->current){
        cont++;
        actual = actual->next;
    } 
    return cont;
}

int lengthGPT(Ronda ronda){
    if (ronda->current == NULL) {
        return 0;
    }

    int cont = 0;
    RondaNode* actual = ronda->current->next;  // empieza desde el siguiente
    cont = 1;  // contamos el nodo actual (ronda->current)

    while (actual != ronda->current) {
        cont++;
        actual = actual->next;
    }

    return cont;
}

/*
int main(){
    Ronda l = mkRonda();
    cout << "Lenght profe: " << lenghtProfe(l) << endl;
    cout << "Lenght mio: " << lenghtMio(l) << endl;
    insert(1,l);
    cout << "Lenght profe: " << lenghtProfe(l) << endl;
    cout << "Lenght mio: " << lenghtMio(l) << endl;
    insert(2,l);
    cout << "Lenght profe: " << lenghtProfe(l) << endl;
    cout << "Lenght GPT: " << lengthGPT(l) << endl;
    insert(3,l);
    for (int i = 0; i < 3; i++){
        move(1,l);
        cout << current(l) << endl;
    }    
}
*/