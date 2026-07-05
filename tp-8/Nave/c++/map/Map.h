#include <vector>
#include <string>
/*
INVARIANTES DE REPRESENTACION:
    - Si el tipo int cantidad es igual a cero, tipo NodoS primero es nullptr
    - Todas las key del tipo NodoS son diferentes univocas
    - si en el NodoS el siguiente es nullptr, quiere decir que es el ultimo elemento de Map.
*/

struct NodoS {
    String key;
    String value;
    NodoS* siguiente;
};

struct MapSt {
    int cantidad;
    NodoS* primero;
};

typedef MapSt* Map;

Map emptyM();
void assocM(String k, String v, Map m);
string lookupM(String k, Map m);
void deleteM(String k, Map m);
string[] domM(Map m);
void showMap(Map m);
int testMap();