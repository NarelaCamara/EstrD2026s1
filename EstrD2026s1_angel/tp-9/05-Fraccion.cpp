#include <iostream>
#include "05-Fraccion.h"
using namespace std;

// Propósito: construye una fraccion
// Precondición: el denominador no es cero
Fraccion consFraccion(int numerador, int denominador){
    if(!denominador==0){
        Fraccion f;
        f.numerador = numerador;
        f.denominador = denominador;    
        return f;
    }
}

// Propósito: devuelve el numerador
int numerador(Fraccion f) {
    return f.numerador;
}

// Propósito: devuelve el denominador
int denominador(Fraccion f) {
    return f.denominador;
}

// Propósito: devuelve el resultado de hacer la división
float division(Fraccion f) {
    return f.numerador / f.denominador;
}

// Propósito: devuelve una fracción que resulta de multiplicar las fracciones
// (sin simplificar)
Fraccion multF(Fraccion f1, Fraccion f2) {
    Fraccion f;
    f.numerador   = f1.numerador * f2.numerador;
    f.denominador = f1.denominador * f2.denominador;
    return f;
}


int maxComunDiv(int n, int m){
    int d = 2;
    while (d<n && d<m && (n%d != 0 || m%d != 0)) 
    {
        d++;
    }        
    return d;
}

// Propósito: devuelve una fracción que resulta
// de simplificar la dada por parámetro
Fraccion simplificada(Fraccion p){
    int mcd = maxComunDiv(p.numerador, p.denominador); 
    while(mcd < p.numerador && mcd < p.denominador)
        {
            p.numerador   = p.numerador/mcd;
            p.denominador = p.denominador/mcd;
            mcd = maxComunDiv(p.numerador, p.denominador); 
        }
    return p;
}

// Propósito: devuelve la fracción resultante de sumar las fracciones
Fraccion sumF(Fraccion f1, Fraccion f2) {
    Fraccion f;
    if (f1.denominador==f2.denominador) 
    {
         f.numerador   = f1.numerador+f2.numerador;
         f.denominador = f1.denominador;
    } else 
    {
         f.numerador   = f1.numerador*f2.denominador + f1.denominador*f2.numerador;
         f.denominador = f1.denominador*f2.denominador;
    }
    return f; 
}