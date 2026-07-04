#include <iostream>
#include "Map.h"

using namespace std;

Map emptyM() {
    Map m = new MapSt;
    m->cantidad = 0;
    m->primero = nullptr;
    return m;
}

void assocM(String k, String v, Map m) {
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

String lookupM(String k, Map m) {
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
    return "";
}

void deleteM(String k, Map m) {
    if (m == nullptr || m->primero == nullptr) {
        return;
    }

    NodoS* actual = m->primero;
    NodoS* previo = nullptr;
    while (actual != nullptr) {
        if (actual->key == k) {
            if (previo == nullptr) {
                m->primero = actual->siguiente;
            } else {
                previo->siguiente = actual->siguiente;
            }
            delete actual;
            m->cantidad--;
            return;
        }
        previo = actual;
        actual = actual->siguiente;
    }
}

std::vector<String> domM(Map m) {
    std::vector<String> keys;
    if (m == nullptr) {
        return keys;
    }

    NodoS* actual = m->primero;
    while (actual != nullptr) {
        keys.push_back(actual->key);
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
