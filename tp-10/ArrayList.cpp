#include "ArrayList.h"

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
    return xs->cantidad;
};

// Devuelve el iésimo elemento de la lista.
int get(int i, ArrayList xs)
{
    return xs->elementos[i];
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
    int nuevaCantidad = xs->cantidad > capacidad ? capacidad : xs->cantidad;
    int *nuevosElementos = new int[capacidad];

    for (int j = 0; j < nuevaCantidad; j++)
    {
        nuevosElementos[j] = xs->elementos[j];
    }

    delete[] xs->elementos;
    xs->elementos = nuevosElementos;
    xs->capacidad = capacidad;
    xs->cantidad = nuevaCantidad;
};

// Agrega un elemento al final de la lista.
void add(int x, ArrayList xs)
{
    if (xs->cantidad >= xs->capacidad)
    {
        int nuevaCapacidad = xs->capacidad + 2;
        int *nuevosElementos = new int[nuevaCapacidad];

        for (int j = 0; j < xs->cantidad; j++)
        {
            nuevosElementos[j] = xs->elementos[j];
        }

        delete[] xs->elementos;
        xs->elementos = nuevosElementos;
        xs->capacidad = nuevaCapacidad;
    }

    xs->elementos[xs->cantidad] = x;
    xs->cantidad = xs->cantidad + 1;
};

// Borra el último elemento de la lista.
void remove(ArrayList xs)
{
    if (xs->cantidad > 0)
    {
        xs->cantidad = xs->cantidad - 1;
    }
};
