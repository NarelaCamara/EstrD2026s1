#pragma once

#include <string>
using std::string;
#include "../tripulante/Tripulante.h"
#include "../sector/Sector.h"
#include "../value/Value.h"
/*
INVARIANTES DE REPRESENTACION:
    - Si el tipo int cantidad es igual a cero, tipo NodoM primero es nullptr
    - Todas las key del tipo NodoM son diferentes univocas
    - si en el NodoM el siguiente es nullptr, quiere decir que es el ultimo elemento de Map.
*/


struct NodoM {
    string key;
    Value value;
    NodoM* siguiente;
};

struct MapSt {
    int cantidad;
    NodoM* primero;
};

typedef MapSt* Map;

Map emptyM();
void assocM(string k, Value v, Map m);
string lookupM(string k, Map m);
void deleteM(string k, Map m);
string* domM(Map m);
void showMap(Map m);
int testMap();