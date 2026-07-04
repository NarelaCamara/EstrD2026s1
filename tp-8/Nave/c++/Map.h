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


//emptyM :: Map k v O(1) --haskell
//costo: constante O(1) 
Map emptyM () {
    MapSt* m = new MapSt;
    m->cantidad=0;
    m->primero=NULL;
    return m;
};

//assocM :: k -> v -> Map k v -> Map k v O(log K) --haskell
//costo: O (log K) donde K es la cantidad de las claves en el map - esta bien?
void assocM (String k, String v, Map m){
    int c = 0;
    NodoS* tmp = map->primero;

    while(c < m->cantidad){

        if(tmp->key == k){
            tmp->value= v;
        }else{
            tmp= tmp->siguiente;
        }
        c++;
    }
    delete tmp;
    cout << "assocM" << showMap(m);
}

//lookupM :: k -> Map k v -> Maybe v O(log K)

String lookupM  (String k, Map m){
    int c = 0;
    NodoS* tmp = map->primero;

    while(c < m->cantidad){

        if(tmp->key == k){
            cout << "lookupM" << showMap(m) << tmp->value;
            return tmp->value;
        }else{
            tmp= tmp->siguiente;
        }
        c++;
    }   
    delete tmp;
    return NULL;
}


//deleteM :: k -> Map k v -> Map k v O(log K)
void deleteM (String k, Map m){
    cout << "before deleteM" << showMap(m);
    int c = 0;
    NodoS* tmp = map->primero;

    while(c < m->cantidad){

        if(tmp->key == k){
           tmp= tmp->siguiente;
        }else{
            tmp= tmp->siguiente;
        }
        c++;
    }   
    delete tmp;
    cout << "aafter deleteM" << showMap(m);
}


//domM :: Map k v -> [k] O(K)

string domM (Map m){
    string[m->cantidad] keysTemp;

    NodoS* tmp = map->primero;

    while(c < m->cantidad){
        keysTemp= tmp->key;
        tmp= tmp->siguiente;
        c++;
    } 
    delete tmp;
}


void showMap (Map m){
    NodoS* tmp = m->primero;
    int i = 0;
    while(i < m->cantidad){
        cout << tmp->key  << " - " << tmp->value << " | " ;
        tmp = tmp->siguiente;
    }
}