#include <iostream>
#include "ArrayList.h"
using namespace std;

struct ArrayListSt {
    int  cantidad;   // cantidad de elementos
    int* elementos;  // array de elementos
    int  capacidad;  // tamaño del array
};

// INV. REP.: 
// * int capacidad es igual o mayor a int cantidad.
// * la cantidad de elementos del array elementos es igual al int cantidad del arraylist.
// * la capacidad de la arraylist es la cantidad de elementos que puede contener el array.

// Ef. Tiempo : O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'newArrayList' con 1 espacio, para la variable ArrayList xs
ArrayList newArrayList() {
    ArrayList xs = new ArrayListSt;
    xs->cantidad = 0;
    xs->elementos = new int[16];
    xs->capacidad = 16;
    return xs;
}

// Ef. Tiempo : O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'newArrayListWith' con 2 espacios:
//                       - 1 espacio para el parámetro int capacidad
//                       - 1 espacio para la variable ArrayList xs
ArrayList newArrayListWith(int capacidad) {
    ArrayList xs  = new ArrayListSt;
    xs->cantidad  = 0;
    xs->elementos = new int[capacidad];
    xs->capacidad = capacidad;
    return xs;
}

// Ef. Tiempo : O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'lengthAL' con 1 espacio, para el parámetro ArrayList xs
int lengthAL(ArrayList xs) {
    return xs->cantidad;
}

// Ef. Tiempo : O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'get' con 2 espacios, para los parámetros int i y ArrayList xs
int get(int i, ArrayList xs) {
// PRECOND.: el int i dado debe ser una posición válida del array xs dado.
     return xs->elementos[i-1]; 
}

// Ef. Tiempo : O(1) acceder a la posicipon i-1 del array y asignar el valor x son operaciones constantes
// Ef. Memoria: O(1) en memoria estática, se genera un stack para 'set' con 3 espacios, uno para cada uno de sus parámetros
//                   en memoria dinámica, solo se cambia el dato en el espacio ya reservado
void set(int i, int x, ArrayList xs) {
// PRECOND.: el int i dado debe ser una posición válida del array xs dado.
    if(i <= xs->cantidad){ 
        xs->elementos[i-1] = x;
    }
}

// Ef. Tiempo : O(n) en tiempo siendo n el int capacidad dado, que en el peor caso posible,
//                   es igual a la cant de elementos del arraylist xs.
// Ef. Memoria: O(n) en memoria estática, se genera un stack para 'set' con 2 espacios, uno para cada uno de sus parámetros
//                   en memoria dinámica, siendo n el int capacidad, ya que en caso que "capacidad" sea superior a la capacidad
//                   de la arraylist dada, la nueva memoria que ocupa va a estar determinada por la nueva capacidad dada.
void resize(int capacidad, ArrayList xs) {
    if(capacidad == xs->capacidad) { };
    int* nuevoArray = new int[capacidad];
    if(capacidad > xs->capacidad) {
        for(int i = 0; i < xs->capacidad; i++) {
            nuevoArray[i] = xs->elementos[i];
        }
    } else {
        for(int i = 0; i < capacidad; i++) {
            nuevoArray[i] = xs->elementos[i];
        }
        xs->cantidad  = capacidad;    
    }
    xs->capacidad = capacidad; 
    delete xs->elementos;
    xs->elementos = nuevoArray;
}

// PERO CASO POSIBLE que el arraylist dado esté lleno y se deba duplicar su capacidad.
// Siendo n la capacidad del arraylist dado
// Ef. Tiempo : O(n)  ya que debe copiar cada elemento.
// Ef. Memoria: O(2n) ya que la memoria reservada es el doble que la memoria reserva previamente.
void add(int x, ArrayList xs) {
    if(xs->cantidad < xs->capacidad) {  
        xs->elementos[xs->cantidad++] = x;
    } else {
        int* nuevoArray = new int[xs->capacidad*2];
        for(int i = 0; i < xs->capacidad; i++) {
            nuevoArray[i] = xs->elementos[i];
        }
        delete xs->elementos;
        xs->elementos = nuevoArray;
        xs->capacidad *= 2;
        xs->elementos[xs->cantidad++] = x;
    }
}

// Ef. Tiempo : O(1) decrementa en una unidad el valor cantidad del arraylist.
// Ef. Memoria: O(1) solo cambia el dato de la cantidad del arraylist, en la celda de memoria correspondiente.
void remove(ArrayList xs) {
    if(xs->cantidad) {
        xs->cantidad--;
    }
}


/////// 
int capacidadAL(ArrayList xs) {
    return xs->capacidad;
}

void borrar(ArrayList xs) {
    delete xs->elementos;
    delete xs;
}