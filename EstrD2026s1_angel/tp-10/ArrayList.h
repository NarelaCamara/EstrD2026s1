#include <iostream>
using namespace std;

struct ArrayListSt;
typedef ArrayListSt* ArrayList;

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
ArrayList newArrayList();
// Crea una lista con 0 elementos.
// Nota: empezar el array list con capacidad 16.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
ArrayList newArrayListWith(int capacidad);
// Crea una lista con 0 elementos y una capacidad dada por parámetro.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
int lengthAL(ArrayList xs);
// Devuelve la cantidad de elementos existentes.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
int get(int i, ArrayList xs);
// Devuelve el iésimo elemento de la lista.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
void set(int i, int x, ArrayList xs);
// Reemplaza el iésimo elemento por otro dado.

// Eficiencia - Tiempo: O(n) - Memoria: O(1), en ME O(n) en MD siendo n el int capadidad dado
void resize(int capacidad, ArrayList xs);
// Decrementa o aumenta la capacidad del array.
// Nota: en caso de decrementarla, se pierden los elementos del final de la lista.

// Eficiencia - Tiempo: O(n) - Memoria: O(2n), siendo n la cantidad de elementos del arraylist dado.
void add(int x, ArrayList xs);
// Agrega un elemento al final de la lista.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
void remove(ArrayList xs);
// Borra el último elemento de la lista



/////// 
int capacidadAL(ArrayList xs);
void borrar(ArrayList xs);