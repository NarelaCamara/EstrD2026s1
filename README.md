# Estructuras de datos

Lista de videos

[![Estructuras de Datos - Clase 1](https://img.youtube.com/vi/CW09lRWB1cY/0.jpg)](https://www.youtube.com/watch?v=CW09lRWB1cY)

# C++ / C
Comando para compilar y ejecutar el programa a la vez:

- cls; g++ -std=c++11 -O2 -o tp-9\tp-9.exe tp-9\tp-9.cpp; tp-9\tp-9.exe
- cls; g++ -std=c++11 -O2 -o tp-10\tp-10.exe tp-10\tp-10.cpp; tp-10\tp-10.exe
- cls; g++ -std=c++11 -O2 -o tp-11\tp-11.exe tp-11\tp-11.cpp; tp-11\tp-11.exe
- cls; g++ -std=c++11 -O2 -o acceso-memoria.exe acceso-memoria.cpp; .\acceso-memoria.exe

## TP 8 Nave
- cls; Push-Location 'tp-8\Nave\c++'; g++ -std=c++11 -O2 -o tp-8.exe tp-8.cpp map/Map.cpp maxHeap/MaxHeap.cpp; .\tp-8.exe; Pop-Location



# Conceptos fundamentales

## Gestión de Memoria

**Memoria**: Espacio disponible para almacenar datos durante la ejecución.

### Haskell
- Manejo **automático** de memoria mediante Garbage Collector (GC)
- El GC se encarga de liberar memoria automáticamente cuando ya no se necesita
- El programador no debe preocuparse por la liberación manual

### C++
- Gestión **manual** de memoria con `new` y `delete`
- Dos tipos de memoria:
  - **Estática**: Se asigna en tiempo de compilación, no cambia durante la ejecución (se elimina al terminar)
  - **Dinámica**: Se asigna en tiempo de ejecución, puede cambiar durante la ejecución (puede causar memory leaks si no se libera)

## Algoritmos de Búsqueda en Grafos

### BFS (Búsqueda en Amplitud / Breadth-First Search)
**Concepto**: Como una ola en el agua, exploramos por niveles
- Desde el nodo inicial, primero visitamos todos los nodos directamente conectados
- Luego todos los nodos conectados a esos, y así sucesivamente
- Se usa una **Cola** para implementarlo
- Útil para encontrar el camino más corto

### DFS (Búsqueda en Profundidad / Depth-First Search)
**Concepto**: Como explorar un laberinto, vamos hacia adentro todo lo posible
- Caminas por un pasillo hacia adelante todo lo que puedas sin detenerte
- Cuando llegas a una pared (nodo sin explorar), das un paso atrás y tomas la siguiente bifurcación
- Se usa una **Pila** para implementarlo
- Útil para detectar ciclos y componentes conexas


## Árboles de Búsqueda

### Definición de Árbol Binario (Haskell)
```haskell
-- Un árbol puede estar vacío o tener un nodo con dos subárboles
data Tree a = Empty | NodeT a (Tree a) (Tree a)
```

### Árbol Balanceado
Un árbol está **balanceado** si cumple:
- La diferencia entre el tamaño del subárbol izquierdo y derecho es ≤ 1
- **Todos** sus subárboles también están balanceados

### Árbol de Búsqueda Binaria (ABB)
Un árbol binario es un **ABB** si cumple:
- La raíz es **mayor** que todos los nodos del subárbol izquierdo
- La raíz es **menor** que todos los nodos del subárbol derecho
- **Ambos** subárboles son ABB (recursivamente)

### Árbol Balanceado de Búsqueda (AVL)
Un árbol es **AVL** si:
- Es un ABB válido
- **Y está balanceado**
- ✓ Búsqueda óptima: O(log n)

### Representación en C++
```cpp
struct NodeT {
    int elem;
    NodeT* left;
    NodeT* right;
};
typedef NodeT* Tree;

// Para un árbol t válido:
// - Todos los nodos accesibles de left tienen elem < t->elem
// - Todos los nodos accesibles de right tienen elem > t->elem
// - La diferencia de altura entre left y right es ≤ 1
```

## Heaps y Colas de Prioridad

### Max-Heap
```
       100 (raíz con el máximo)
      /   \
     80    90
    / \   /
   40 50 30
```
- El nodo padre **siempre es ≥** que sus hijos
- El valor **máximo** está en la raíz
- ✓ Extraer máximo: O(log n)

### Min-Heap
```
       10 (raíz con el mínimo)
      /  \
     20   30
    / \   /
   40 50 80
```
- El nodo padre **siempre es ≤** que sus hijos
- El valor **mínimo** está en la raíz
- ✓ Extraer mínimo: O(log n)

### Cola de Prioridad vs Heap

| Concepto | Definición |
|----------|-----------|
| **Cola de Prioridad** | Tipo de Dato Abstracto (TDA) - Define el **QUÉ**: el comportamiento |
| **Heap** | Estructura de Datos Física - Define el **CÓMO**: la implementación eficiente |

**En resumen**: La cola define la interfaz y comportamiento, el heap la implementa eficientemente


## Evaluación - Segundo Parcial

### Temas Centrales

**Perspectivas de Trabajo**:
- Usuario (quién usa la estructura)
- Implementador (quién la programa)
- Diseñador (quién la especifica)

**Conceptos**:
- BFS y DFS
- AVL (Árboles Balanceados)

**Lenguaje Haskell**:
- Array, Set, Queue, PriorityQueue, Heap
- Recursividad y Pattern Matching
- Árboles y traversal

**Lenguaje C++**:
- Gestión de memoria (estática y dinámica)
- TADs: Array, Set, Queue, PriorityQueue, Heap
- Punteros
- `delete` y prevención de memory leaks

# Analisis de complejidad

## Notación y Convenciones

```
-- O( X @ # siendo `X` ... porque ...
--      Y # siendo `Y` ... porque ...
-- )
-- => O(X @ Y)
```

### Ejemplo 1: Invertir un Map

**Propósito**: Invertir un map agrupando las claves originales de forma ordenada

**Entrada**:
```haskell
invertir $ assocM "a" 1 $
  assocM "b" 1 $
  assocM "c" 1 $
  assocM "d" 2 $
  assocM "e" 2 $
  assocM "f" 3 $
  emptyM
```

**Salida**:
```
{
  1 -> ["c","b","a"]
  2 -> ["e","d"]
  3 -> ["f"]
}
```

**Implementación**:
```haskell
-- O( (K * (K + v) + K) # siendo `K` la cantidad de claves del map provisto
--                        y `V` la cantidad de valores diferentes por uso de 
--                        invertirL sobre dicho map
-- ) => O(K * (K + v))
invertir :: (Ord k, Ord v) => Map k v -> Map v [k]
invertir m = invertirL (keysM m) m

-- O( N * ( log K +  # siendo `N` la longitud de la lista por recursion
--          log v +  # siendo `K` la cantidad de claves del map provisto
--          K        # siendo `v` la cantidad de valores diferentes en el map
--        )
-- ) => O(N * (K + log v))  # porque K > log K
invertirL :: (Ord k, Ord v) => [k] -> Map k v -> Map v [k]
invertirL [] _ = emptyM
invertirL (x:xs) m = case lookupM x m of 
  Nothing -> invertirL xs m
  Just y -> assocCons y x (invertirL xs m)
```
### Ejemplo 2: Asociar con Orden

**Objetivo**: Asociar un key con un value manteniendo orden en la lista de valores

**Implementación**:
```haskell
-- NOTA: La variable de costo `K` aquí es diferente a la de invertirL
--       En assocCons, `K` corresponde a `v` del contexto anterior
-- O( log K +  # siendo `K` la cantidad de claves del map por uso de 
--    v        # siendo `v` la longitud del valor de mayor longitud del map
-- )
-- => O(log K + v)
assocCons :: (Ord k, Ord v) => k -> v -> Map k [v] -> Map k [v]
assocCons x y m = case lookupM x m of 
  Nothing -> assocM x [y] m
  Just ys -> assocM x (inOrder y ys) m

-- O(n) # siendo n la longitud de la lista por recursion sobre la misma
inOrder :: Ord a => a -> [a] -> [a]
inOrder x [] = [x]
inOrder x (y:ys) = 
  if x <= y 
    then x:(y:ys)
    else y:(inOrder x ys)
```

**Explicación**:
- `inOrder` inserta un elemento en la lista manteniendo orden
- `assocCons` busca en el map y actualiza o crea una nueva asociación