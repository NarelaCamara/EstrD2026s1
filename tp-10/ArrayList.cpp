#include "ArrayList.h"

// Crea una lista con 0 elementos.

ArrayList newArrayList()
{
    ArrayListSt *l = new ArrayListSt;
    l->cantidad = 0;
    l->capacidad = 0;
    l->elementos = 0;
    return l;
};

// Nota: empezar el array list con capacidad 16.
ArrayList newArrayListWith(int capacidad)
{
    ArrayListSt *l = new ArrayListSt;
    l->capacidad = capacidad;
    return l;
};

// Crea una lista con 0 elementos y una capacidad dada p or parámetro.
int lengthAL(ArrayList xs)
{
    return xs->cantidad;
};

// Devuelve la cantidad de elementos existentes.
int get(int i, ArrayList xs)
{
    return xs->elementos[i++];
};

// Devuelve el iésimo elemento de la lista.
void set(int i, int x, ArrayList xs)
{
    xs->elementos[i++] = x;
};

// Reemplaza el iésimo elemento p or otro dado.

// Decrementa o aumenta la capacidad del array.
// Nota: en caso de decrementarla, se pierden los elementos del final de la lista.
void resize(int capacidad, ArrayList xs)
{
    xs->cantidad = xs->cantidad > capacidad ? capacidad : xs->cantidad;
    xs->capacidad = (xs->capacidad > capacidad ? capacidad : xs->capacidad);
    xs->elementos[capacidad];
};

// Agrega un elemento al final de la lista.
void add(int x, ArrayList xs)
{
    xs->cantidad = xs->cantidad + 1;
    xs->capacidad = xs->cantidad + 1 > xs->capacidad ? xs->capacidad + 2 : xs->capacidad;
    xs->elementos[xs->cantidad + 1] = x;
};

// Borra el último elemento de la lista.
void remove(ArrayList xs)
{
    xs->cantidad = xs->cantidad - 1;
    xs->capacidad = xs->cantidad - 1 > xs->capacidad ? xs->capacidad - 2 : xs->capacidad;
    xs->elementos[xs->cantidad - 1];
};
