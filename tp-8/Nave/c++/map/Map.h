#include <vector>
#include <string>
/*
INVARIANTES DE REPRESENTACION:
    - Si el tipo int cantidad es igual a cero, tipo NodoM primero es nullptr
    - Todas las key del tipo NodoM son diferentes univocas
    - si en el NodoM el siguiente es nullptr, quiere decir que es el ultimo elemento de Map.
*/

struct NodoM {
    std::string key;
    std::string value;
    NodoM* siguiente;
};

struct MapSt {
    int cantidad;
    NodoM* primero;
};

typedef MapSt* Map;

Map emptyM();
void assocM(std::string k, std::string v, Map m);
std::string lookupM(std::string k, Map m);
void deleteM(std::string k, Map m);
std::vector<std::string> domM(Map m);
void showMap(Map m);
int testMap();