#include <iostream>
#include "Fraccion.h"
using namespace std;

// Propósito: construye una fraccion
// Precondición: el denominador no es cero
Fraccion consFraccion(int numerador, int denominador)
{
    Fraccion f;
    f.numerador = numerador;
    f.denominador = denominador;
    return f;
};

// Propósito: devuelve el numerador
int numerador(Fraccion f)
{
    return f.numerador;
};

// Propósito: devuelve el denominador
int denominador(Fraccion f)
{
    return f.denominador;
};

// Propósito: devuelve el resultado de hacer la división
float division(Fraccion f)
{
    return f.numerador / f.denominador;
};

static int absInt(int x)
{
    return x < 0 ? -x : x;
}

static int mcd(int a, int b)
{
    a = absInt(a);
    b = absInt(b);
    if (a == 0)
    {
        return b;
    }
    if (b == 0)
    {
        return a;
    }
    while (b != 0)
    {
        int r = a % b;
        a = b;
        b = r;
    }
    return a;
}

// Propósito: devuelve una fracción que resulta de multiplicar las fracciones
// (sin simplificar)
Fraccion multF(Fraccion f1, Fraccion f2)
{
    Fraccion fnew;
    fnew.numerador = f1.numerador * f2.numerador;
    fnew.denominador = f1.denominador * f2.denominador;
    return fnew;
}

// Propósito: devuelve una fracción que resulta
// de simplificar la dada por parámetro
Fraccion simplificada(Fraccion p)
{
    Fraccion fNew;
    int divisor = mcd(p.numerador, p.denominador);

    if (divisor == 0)
    {
        fNew.numerador = p.numerador;
        fNew.denominador = p.denominador;
        return fNew;
    }

    fNew.numerador = p.numerador / divisor;
    fNew.denominador = p.denominador / divisor;

    if (fNew.denominador < 0)
    {
        fNew.numerador = -fNew.numerador;
        fNew.denominador = -fNew.denominador;
    }

    return fNew;
}

// Propósito: devuelve la fracción resultante de sumar las fracciones
Fraccion sumF(Fraccion f1, Fraccion f2)
{
    Fraccion fNew;
    if (f1.denominador == f2.denominador)
    {
        fNew.denominador = f1.denominador;
        fNew.numerador = f1.numerador + f2.numerador;
    }
    else
    {
        fNew.denominador = f1.denominador * f2.denominador;
        fNew.numerador = (f1.numerador * f2.denominador) + (f2.numerador * f1.denominador);
    }
    return fNew;
};