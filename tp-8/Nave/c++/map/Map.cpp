#include <iostream>
#include "Map.h"

using namespace std;

Map emptyM() {
    Map m = new MapSt;
    m->cantidad = 0;
    m->primero = nullptr;
    return m;
}

void assocM(string k, string v, Map m) {
    if (m == nullptr) {
        return;
    }

    NodoS* actual = m->primero;
    while (actual != nullptr) {
        if (actual->key == k) {
            actual->value = v;
            return;
        }
        actual = actual->siguiente;
    }

    NodoS* nuevo = new NodoS;
    nuevo->key = k;
    nuevo->value = v;
    nuevo->siguiente = m->primero;
    m->primero = nuevo;
    m->cantidad++;
}

string lookupM(string k, Map m) {
    if (m == nullptr) {
        return "";
    }

    NodoS* actual = m->primero;
    while (actual != nullptr) {
        if (actual->key == k) {
            return actual->value;
        }
        actual = actual->siguiente;
    }
    return nullptr;
}

void deleteM(string k, Map m) {
    if (m == nullptr || m->primero == nullptr) {
        //cout << "[deleteM] El mapa está vacío, no se elimina nada." << endl;
        return;
    }

    //cout << "[deleteM] Buscando la clave '" << k << "'" << endl;

    // El algoritmo recorre la lista desde el inicio y mantiene un puntero al nodo anterior.
    // Cuando encuentra la clave buscada, une el nodo anterior con el siguiente para saltar el nodo a borrar.
    // Si el nodo a borrar es el primero, simplemente mueve el puntero de inicio al siguiente.
    NodoS* actual = m->primero;
    NodoS* anterior = nullptr;

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

string[] domM(Map m) {
    string[] keys = new string[m->cantidad];
    int i = 0;
    if (m == nullptr) {
        return [];
    }

    NodoS* actual = m->primero;
    while (actual != nullptr) {
        keys[i++] = actual->key;
        actual = actual->siguiente;
    }
    return keys;
}

void showMap(Map m) {
    if (m == nullptr) {
        cout << "{}";
        return;
    }

    cout << "{";
    NodoS* actual = m->primero;
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
    string[] keys = domM(m);
    for (size_t i = 0; i < m->cantidad; ++i) {
        std::cout << keys[i];
        if (i + 1 < m->cantidad; ) {
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
