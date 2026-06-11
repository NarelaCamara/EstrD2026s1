#include "ArrayList.h"

/**
 * INVARIANTE DE REPRESENTACION
 * cantidad y capacidad son valores que cuentan desde 1 a n, no inlcuye al cero
 * siempre se va a contar desde el 1 y no desde el cero
 */

// Crea una lista con 0 elementos.
ArrayList newArrayList()
{
    ArrayListSt *l = new ArrayListSt;
    l->cantidad = 0;
    l->capacidad = 16;
    l->elementos = new int[16];
    return l;
};

// Crea una lista con 0 elementos y una capacidad dada por parámetro.
ArrayList newArrayListWith(int capacidad)
{
    ArrayListSt *l = new ArrayListSt;
    l->capacidad = capacidad;
    l->cantidad = 0;
    l->elementos = new int[capacidad];
    return l;
};

// Devuelve la cantidad de elementos existentes.
int lengthAL(ArrayList xs)
{
    return xs->cantidad+1;//wtffffffffff
};

// Devuelve el iésimo elemento de la lista.
int get(int i, ArrayList xs)
{
    return xs->elementos[i - 1];
};

// Reemplaza el iésimo elemento por otro dado.
void set(int i, int x, ArrayList xs)
{
    xs->elementos[i - 1] = x;
};

// Decrementa o aumenta la capacidad del array.
// Nota: en caso de decrementarla, se pierden los elementos del final de la lista.
void resize(int capacidad, ArrayList xs)
{
    int *nuevosElementos = new int[capacidad-1];
    for (int j = 0; j < capacidad; j++)
    {
        nuevosElementos[j] = xs->elementos[j];
    }
    delete[] xs->elementos;
    xs->elementos = nuevosElementos;
    xs->capacidad = capacidad;
    xs->cantidad = capacidad;
};

// Agrega un elemento al final de la lista.
void add(int x, ArrayList xs)
{
    if (xs->cantidad + 1 >= xs->capacidad)
    {
        int nuevaCapacidad = xs->capacidad + 16;
        int *nuevosElementos = new int[nuevaCapacidad-1];

        for (int j = 0; j < xs->cantidad; j++)
        {
            nuevosElementos[j] = xs->elementos[j];
        }

        delete[] xs->elementos;
        xs->elementos = nuevosElementos;
    }

    xs->elementos[xs->cantidad] = x;
    xs->cantidad++;
};

// Borra el último elemento de la lista.
void remove(ArrayList xs)
{
    if (xs->cantidad > 0)
    {
        int newCantidad = xs->cantidad - 1;
        int *nuevosElementos = new int[newCantidad-1];

        for (int j = 0; j <= newCantidad; j++)
        {
            nuevosElementos[j] = xs->elementos[j];
        }
        delete[] xs->elementos;
        xs->elementos = nuevosElementos;
        xs->cantidad = newCantidad;
    }
};
