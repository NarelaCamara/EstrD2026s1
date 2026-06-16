#include <iostream>
#include "ArrayList.h"

/**
 * INVARIANTE DE REPRESENTACION
 * cantidad y capacidad son valores que cuentan desde cero a n, incluye al cero
 */


/**
 * costo: constante, un frame, solo prepara para guardar 15 espacios de memoria
 */
// Crea una lista con 0 elementos.
ArrayList newArrayList()
{
    ArrayList l = new ArrayListSt;
    l->cantidad = 0;
    l->capacidad = 16;
    l->elementos = new int[16];
    return l;
};
/*
STACK
+---------------------------------------------------------------------------+
| consPokemon frame                                                         |         
|   - l : ArrayList --> HEAP { cantidad, capacidad, elementos--> HEAP int  } |
+---------------------------------------------------------------------------+

HEAP
+-----------------------------------------------------+
| - cantidad: int                                     |
| - capacidad: int                                    |
| - elementos: [0] int                                |
| - elementos: [...] int                              |
| - elementos: [16-1] int                             |
+-----------------------------------------------------+ 
*/

/** costo: constante, utiliza un frame */
// Crea una lista con 0 elementos y una capacidad dada por parámetro.
ArrayList newArrayListWith(int capacidad)
{
    ArrayList l = new ArrayListSt;
    l->capacidad = capacidad;
    l->cantidad = 0;
    l->elementos = new int[capacidad];
    return l;
};

/*
STACK
+---------------------------------------------------------------------------+
| consPokemon frame                                                         |         
|   - l : ArrayList --> HEAP {cantidad, capacidad, elementos--> HEAP int  } |
+---------------------------------------------------------------------------+

HEAP
+-----------------------------------------------------+
| - elementos: [0] int                                |
| - elementos: [...] int                              |
| - elementos: [capacidad] int                        |
+-----------------------------------------------------+ 
*/


/** costo: constante, utiliza un frame */
// Devuelve la cantidad de elementos existentes.
int lengthAL(ArrayList xs)
{
    return xs->cantidad;
};
/*
STACK
+---------------------------------------------------------------------------+
| consPokemon frame                                                         |         
|   - xs : ArrayList --> HEAP {cantidad, capacidad, elementos--> HEAP int  }|
+---------------------------------------------------------------------------+

HEAP
+-----------------------------------------------------+
| - elementos: [0] int                                |
| - elementos: [...] int                              |
| - elementos: [cantidad] int                         |
+-----------------------------------------------------+ 
*/ 

// RAROOO SERIA CANTIDAD O CAPACIDAD EN LA HEAP?


/** costo: constante, utiliza un frame */
// Devuelve el iésimo elemento de la lista.
int get(int i, ArrayList xs)
{
    return xs->elementos[i];
};
/*
STACK
+---------------------------------------------------------------------------+
| consPokemon frame                                                         |         
|   - xs : ArrayList --> HEAP {cantidad, capacidad, elementos--> HEAP int  }|
    - i int                                                                 |    
+---------------------------------------------------------------------------+

HEAP
+-----------------------------------------------------+
| - elementos: [0] int                                |
| - elementos: [...] int                              |
| - elementos: [cantidad] int                         |
+-----------------------------------------------------+ 
*/

/** costo: constante, utiliza un frame */
// Reemplaza el iésimo elemento por otro dado.
void set(int i, int x, ArrayList xs)
{
    xs->elementos[i] = x;
};
/*
STACK
+---------------------------------------------------------------------------+
| consPokemon frame                                                         |         
|   - xs : ArrayList --> HEAP {cantidad, capacidad, elementos--> HEAP int  }|
    - i int                                                                 |   
    - x int                                                                 |    
+---------------------------------------------------------------------------+

HEAP
+-----------------------------------------------------+
| - elementos: [0] int                                |
| - elementos: [...] int                              |
| - elementos: [cantidad] int                         |
+-----------------------------------------------------+ 
*/

/* */
// Decrementa o aumenta la capacidad del array.
// Nota: en caso de decrementarla, se pierden los elementos del final de la lista.
void resize(int capacidad, ArrayList xs)
{
    int* nuevosElementos = new int[capacidad];

    int lenght = xs->cantidad < capacidad ? xs->cantidad : capacidad;
    for (int j = 0; j < lenght; j++)
    {
        nuevosElementos[j] = xs->elementos[j];
    }
    delete[] xs->elementos;
    xs->elementos = nuevosElementos;
    xs->capacidad = capacidad;
    xs->cantidad = lenght;
};
/*
STACK
+---------------------------------------------------------------------------+
| resize frame                                                              |         
|   - xs : ArrayList --> HEAP {cantidad, capacidad, elementos--> HEAP int  }|
|   - capacidad int                                                         |   
|   - lenght int                                                            |  
|   - nuevosElementos  --> HEAP int                                         |
|    - i int                                                                |  
+---------------------------------------------------------------------------+

HEAP
+-----------------------------------------------------+
| - elementos: [0] int                                |
| - elementos: [...] int                              |
| - elementos: [cantidad] int                         |
+-----------------------------------------------------+ 
*/



// Agrega un elemento al final de la lista.
void add(int x, ArrayList xs)
{
    if (xs->cantidad >= xs->capacidad)
    {
        int nuevaCapacidad = xs->capacidad + 16;
        int* nuevosElementos = new int[nuevaCapacidad];

        for (int j = 0; j < xs->cantidad; j++)
        {
            nuevosElementos[j] = xs->elementos[j];
        }

        delete[] xs->elementos;
        xs->elementos = nuevosElementos;
        xs->capacidad = nuevaCapacidad;
    }

    xs->elementos[xs->cantidad] = x;
    xs->cantidad++;
};
/*
STACK
+---------------------------------------------------------------------------+
| resize frame                                                              |         
|   - xs : ArrayList --> HEAP {cantidad, capacidad, elementos--> HEAP int  }|
|   - capacidad int                                                         |   
|   - lenght int                                                            |  
|   - nuevosElementos  --> HEAP int                                         |
|    - i int                                                                |  
+---------------------------------------------------------------------------+

HEAP
+-----------------------------------------------------+
| - elementos: [0] int                                |
| - elementos: [...] int                              |
| - elementos: [cantidad] int                         |
+-----------------------------------------------------+ 
*/

/* */
// Borra el último elemento de la lista.
void remove(ArrayList xs)
{
    if (xs->cantidad > 0)
    {
        xs->cantidad--;
    }
};
/*
STACK
+---------------------------------------------------------------------------+
| remove frame                                                              |         
|   - xs : ArrayList --> HEAP {cantidad, capacidad, elementos--> HEAP int  }|
|   - newCantidad int                                                       |   
|   - lenght int                                                            |  
|   - nuevosElementos  --> HEAP int                                         |
|    - i int                                                                |  
+---------------------------------------------------------------------------+

HEAP
+-----------------------------------------------------+
| - elementos: [0] int                                |
| - elementos: [...] int                              |
| - elementos: [cantidad-1] int                       |
+-----------------------------------------------------+ 
*/
