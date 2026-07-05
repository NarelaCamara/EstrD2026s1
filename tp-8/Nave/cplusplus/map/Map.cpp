#include <iostream>
#include "Map.h"

using namespace std;

//precondicion: ninguna
//costo: constante O(1)
Map emptyM() {
    Map m = new MapSt;
    m->cantidad = 0;
    m->primero = nullptr;
    return m;
}

//precondicion: ninguna
//costo: O(n) donde n es la cantidad de elementos en el mapa
void assocM(string k, Value v, Map m) {
    if (m == nullptr) {
        return;
    }

    NodoM* actual = m->primero;
    while (actual != nullptr) {
        if (actual->key == k) {
            actual->value = v;
            return;
        }
        actual = actual->siguiente;
    }

    NodoM* nuevo = new NodoM;
    nuevo->key = k;
    nuevo->value = v;
    nuevo->siguiente = m->primero;
    m->primero = nuevo;
    m->cantidad++;
}


//precondicion: ninguna
// costo: O(n) donde n es la cantidad de elementos en el mapa
string lookupM(string k, Map m) {
    if (m == nullptr) {
        return "";
    }

    NodoM* actual = m->primero;
    while (actual != nullptr) {
        if (actual->key == k) {
            return actual->value;
        }
        actual = actual->siguiente;
    }
    return "";
}

//precondicion: ninguna
// costo: O(n) donde n es la cantidad de elementos en el mapa
void deleteM(string k, Map m) {
    if (m == nullptr || m->primero == nullptr) {
        //cout << "[deleteM] El mapa está vacío, no se elimina nada." << endl;
        return;
    }

    //cout << "[deleteM] Buscando la clave '" << k << "'" << endl;

    // El algoritmo recorre la lista desde el inicio y mantiene un puntero al nodo anterior.
    // Cuando encuentra la clave buscada, une el nodo anterior con el siguiente para saltar el nodo a borrar.
    // Si el nodo a borrar es el primero, simplemente mueve el puntero de inicio al siguiente.
    NodoM* actual = m->primero;
    NodoM* anterior = nullptr;

    while (actual != nullptr) {
        //cout << "[deleteM] Revisando nodo: " << actual->key << endl;

        if (actual->key == k) {
            //cout << "[deleteM] Se encontró la clave '" << k << "'" << endl;

            if (anterior == nullptr) {
                //cout << "[deleteM] La clave estaba al inicio, se actualiza el primer nodo" << endl;
                m->primero = actual->siguiente;
            } else {
                //cout << "[deleteM] Se enlaza el nodo anterior con el siguiente" << endl;
                anterior->siguiente = actual->siguiente;
            }

            delete actual;
            m->cantidad--;
            //cout << "[deleteM] Nodo eliminado. Cantidad actual: " << m->cantidad << endl;
            return;
        }

        anterior = actual;
        actual = actual->siguiente;
    }

   // cout << "[deleteM] No se encontró la clave '" << k << "'" << endl;
}

// costo: O(n) donde n es la cantidad de elementos en el mapa
// precondicion: ninguna
vector<string> domM(Map m) {
    vector<string> keys;
    if (m == nullptr) {
        return keys;
    }

    keys.reserve(m->cantidad);
    NodoM* actual = m->primero;
    while (actual != nullptr) {
        keys.push_back(actual->key);
        actual = actual->siguiente;
    }
    return keys;
}

// precondicion: ninguna
// costo: O(n) donde n es la cantidad de elementos en el mapa
void showMap(Map m) {
    if (m == nullptr) {
        cout << "{}";
        return;
    }

    cout << "{";
    NodoM* actual = m->primero;
    while (actual != nullptr) {
        cout << actual->key << " -> " << actual->value;
        if (actual->siguiente != nullptr) {
            cout << ", ";
        }
        actual = actual->siguiente;
    }
    cout << "}";
}


int testMap() {
    std::cout << "=== Ejemplo de uso de Map ===" << std::endl;

    Map m = emptyM();
    std::cout << "1) Mapa vacio: ";
    showMap(m);
    std::cout << std::endl;

    std::cout << "2) assocM('uno', '1')" << std::endl;
    assocM("uno", "1", m);
    showMap(m);
    std::cout << std::endl;

    std::cout << "3) assocM('dos', '2')" << std::endl;
    assocM("dos", "2", m);
    showMap(m);
    std::cout << std::endl;

     std::cout << "4) assocM('tres', '3')" << std::endl;
    assocM("tres", "3", m);
    showMap(m);
    std::cout << std::endl;

    std::cout << "5) lookupM('uno') -> " << lookupM("uno", m) << std::endl;
    std::cout << "6) lookupM('cuatro') -> " << lookupM("cuatro", m) << std::endl;

    std::cout << "7) assocM('uno', '10') para reemplazar el valor" << std::endl;
    assocM("uno", "10", m);
    showMap(m);
    std::cout << std::endl;

    std::cout << "8) domM(m) -> ";
    vector<string> keys = domM(m);
    for (size_t i = 0; i < m->cantidad; ++i) {
        std::cout << keys[i];
        if (i + 1 < m->cantidad) {
            std::cout << ", ";
        }
    }
    std::cout << std::endl;

    std::cout << "9) deleteM('dos')" << std::endl;
    deleteM("dos", m);
    showMap(m);
    std::cout << std::endl;

    std::cout << "10) lookupM('dos') despues de borrar -> " << lookupM("dos", m) << std::endl;
    std::cout << "=== Fin del ejemplo ===" << std::endl;

    return 0;
}
