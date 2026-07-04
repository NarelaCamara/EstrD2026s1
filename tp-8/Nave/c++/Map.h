#include <iostream>
using namespace std;

/*
INVARIANTES DE REPRESENTACION:
    - Si el tipo int cantidad es igual a cero, tipo NodoS primero es NULL
    - Todas las key del tipo NodoS son diferentes univocas
    - si en el NodoS el siguiente es NULL, quiere decir que es el ultimo elemento de Map.
*/

struct NodoS {
    string key;
    string value;
    NodoS* siguiente; // puntero al siguiente nodo
};

struct MapSt {
    int cantidad; // cantidad de elementos diferentes
    NodoS* primero; // puntero al primer nodo
};
 
typedef Map *MapSt;


Map emptyM (); 

void assocM (String k, String v, Map m);

String lookupM(String k, Map m);

void deleteM (String k, Map m); 

String domM(Map m);

void showMap(Map m);
