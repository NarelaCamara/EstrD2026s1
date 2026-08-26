#include <iostream>
#include "ArrayList.h"
using namespace std;

// ## 1 ###############################################################################################################################
// Ef. tiempo: O(n * # por iteración sobre xs
//                1 por '<=', '++', '+', 'lengthAL' y 'get' 
//                + 1 por inicialización de variable
//               ) -> n * 5 + 1 = 5n + 1 => n
//              O(n)
// Ef. memoria: O(1), se crea el stack frame para 'sumatoria' que contiene el parámetro xs
//                    y las variables suma e i, que se sobreescriben.
int sumatoria(ArrayList xs) {
    int suma = 0;
    for(int i = 1; i <= lengthAL(xs); i++){
        suma += get(i, xs);
    }
    return suma;
}

// ## 2 ###############################################################################################################################
// Ef. tiempo: O(n * # por iteración sobre xs
//                1 por '<=', '++'(x2), 'lengthAL' y 'get' 
//                + 1 por inicialización de variables i y x
//               ) -> n * 5 + 2 = 5n + 2 => n
//              O(n)
// Ef. memoria: O(1), se crea el stack frame para 'sucesores' que contiene el parámetro xs y las variables i y x, que se sobreescriben.
void sucesores(ArrayList xs) {
    for(int i = 1; i <= lengthAL(xs); i++){
        int x = get(i, xs);
        x++;
        set(i, x, xs);
        // o set(i, x+1, xs) 
        // set(i, x++, xs) no hace nada
    }
}

// ## 3 ###############################################################################################################################
// Ef. tiempo: O(n * # por iteración sobre xs
//                1 por '<=', '++', '==', 'lengthAL' y 'get' 
//                + 1 por inicialización de variable i y rta
//               ) -> n * 5 + 2 = 5n + 2 => n
//              O(n)
// Ef. memoria: O(1), se crea el stack frame para 'pertenece' que contiene los parámetros x y xs y las variables i y rta, que se sobreescriben.
bool pertenece(int x, ArrayList xs) {
    bool rta = false;
    for(int i = 1; !rta && i <= lengthAL(xs); i++){
        rta = x==get(i,xs);
    }
    return rta;
}

// ## 4 ###############################################################################################################################
// Ef. tiempo: O(n * # por iteración sobre xs
//                1 por '<=', '++', '==', 'lengthAL' y 'get' 
//                + 1 por inicialización de variables i y x
//               ) -> n * 5 + 2 = 5n + 2 => n
//              O(n)
// Ef. memoria: O(1), se crea el stack frame para 'apariciones' que contiene los parámetro x y xs y las variables i y contador, que se sobreescriben.
int apariciones(int x, ArrayList xs) {
    int contador = 0;
    for(int i = 1; i <= lengthAL(xs); i++){
        if (x==get(i,xs)) contador++;
    }
    return contador;
}

// ## 5 ###############################################################################################################################
// Ef. tiempo: O(n * # por iteración sobre xs
//                (1 por '<=', '++', 'lengthAL', 'get'
//                + n) por 'add'       
//                + 1 por inicialización de variables i
//                + 1 por 'newArrayListWith'
//                + 1 por cada llamado a 'lengthAL'
//               ) -> n * (4 + n) + 4 = 4n + n² + 4 => n²
//               mismo costo pero considerando la long de ys(N)
//              O(n² + N²)
// Ef. memoria: O(M), siendo M la cant de elementos de xs e ys, ya que la nueva lista va reservar de memoria(en heap), la cant de ambas lista
ArrayList append(ArrayList xs, ArrayList ys) {
    ArrayList nuevaLista = newArrayListWith(lengthAL(xs)+lengthAL(ys));
    for(int i = 1; i <= lengthAL(xs); i++){
        add(get(i, xs), nuevaLista);
    }
    for(int i = 1; i <= lengthAL(ys); i++){
        add(get(i, ys), nuevaLista);
    }
    return nuevaLista;
}

// ## 6 ###############################################################################################################################
// Ef. tiempo: O(n * # por iteración sobre xs
//                1 por '<=', '++', 'lengthAL', 'get' y 'min'
//                + 1 por inicialización de variables i y minVisto
//                + 1 por >           
//               ) -> n * 5 + 3 = 5n + 3 => n     
//              O(n)
// Ef. memoria: O(1), se crea el stack frame para 'minimo' que contiene al parámetro xs y las variables i y minVisto, que se sobreescriben.
int minimo(ArrayList xs) {
    if(lengthAL(xs) > 0) {
        int minVisto = get(1,xs);
        for(int i = 1; i <= lengthAL(xs); i++) {
            minVisto = min(get(i, xs), minVisto);
        }
    return minVisto;
    }
}





void printAL(ArrayList xs) {
    for(int i = 1; i < lengthAL(xs); i++){ 
        cout << get(i,xs) << ", " << ends;
    }
    cout << get(lengthAL(xs),xs) << endl;
}

void printAL2(ArrayList xs) {
    for(int i = 1; i <= lengthAL(xs); i++){ 
        if(i==lengthAL(xs)) { cout << get(i,xs) << endl; break;}
        cout << get(i,xs) << ", " << ends;
    }
}

int main(){
    ArrayList prueba1 = newArrayListWith(5);
    cout << minimo(prueba1) << endl;
    add(10, prueba1); add(20, prueba1); add(30, prueba1); add(40,prueba1); add(50,prueba1);
    cout << sumatoria(prueba1) << " = 150 " << endl;
    sucesores(prueba1);
    cout << sumatoria(prueba1) << " = 155 " << endl;
    if (pertenece (14, prueba1)) {cout << "true" << endl;;} else { cout << "false" << endl;}
    if (pertenece (51, prueba1)) {cout << "true" << endl;;} else { cout << "false" << endl;}
    cout << apariciones(14, prueba1) << endl;
    // add(51,prueba1);
    cout << apariciones(51, prueba1) << endl;
    ArrayList prueba2 = newArrayListWith(5);
    add(100, prueba2); add(200, prueba2); add(300, prueba2);
    cout << get(1,prueba2) << "," << get(2,prueba2) << "," << get(3,prueba2) << endl;
    ArrayList appended = append(prueba1, prueba2);
    printAL(appended);
    ArrayList empty = newArrayListWith(5);
    cout << minimo(prueba1) << endl;
    ArrayList prueba3 = newArrayListWith(5);
    add(10, prueba1); add(20, prueba1); add(2, prueba1); add(40,prueba1); add(1,prueba1);
    cout << minimo(prueba1) << endl;
    cout << minimo(empty) << endl;

}