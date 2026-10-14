# Estructuras de Datos

Apunte general de la materia construido a partir de las clases, prácticas, implementaciones y parciales del workspace.

## Índice

- [Material y compilación](#material-y-compilación)
- [1. Modelo funcional](#1-modelo-funcional)
- [2. Complejidad](#2-complejidad)
- [3. Tipos abstractos de datos](#3-tipos-abstractos-de-datos)
- [4. Árboles, heaps y prioridades](#4-árboles-heaps-y-prioridades)
- [5. Recorridos de árboles y grafos](#5-recorridos-de-árboles-y-grafos)
- [6. Modelo imperativo](#6-modelo-imperativo)
- [7. Integradores y parciales](#7-integradores-y-parciales)
- [8. Checklist de repaso](#8-checklist-de-repaso)

## Material y compilación

La materia avanza desde tipos algebraicos y recursión en Haskell hasta la implementación manual de estructuras en C++. Las carpetas `tp-1` a `tp-8` trabajan principalmente el modelo funcional y `tp-9` a `tp-11` el modelo imperativo.

Lista de videos:

[![Estructuras de Datos - Clase 1](https://img.youtube.com/vi/CW09lRWB1cY/0.jpg)](https://www.youtube.com/watch?v=CW09lRWB1cY)

# C++ / C

Comando para compilar y ejecutar el programa a la vez:

- cls; g++ -std=c++11 -O2 -o tp-9\tp-9.exe tp-9\tp-9.cpp; tp-9\tp-9.exe
- cls; g++ -std=c++11 -O2 -o tp-10\tp-10.exe tp-10\tp-10.cpp; tp-10\tp-10.exe
- cls; g++ -std=c++11 -O2 -o tp-11\tp-11.exe tp-11\tp-11.cpp; tp-11\tp-11.exe
- cls; g++ -std=c++11 -O2 -o acceso-memoria.exe acceso-memoria.cpp; .\acceso-memoria.exe

## TP 8 Nave

- cls; g++ -std=c++11 -O2 -o tp-8\Nave\cplusplus\tp-8.exe tp-8\Nave\cplusplus\tp-8.cpp; tp-8\Nave\cplusplus\tp-8.exe

## TP 8 Magos

- cls; g++ -std=c++11 -O2 -o tp-8\Magos\cplusplus\tp-8.exe tp-8\Magos\cplusplus\tp-8.cpp; tp-8\Magos\cplusplus\tp-8.exe

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
```

Crear un nodo requiere `new`. Destruir un árbol requiere recorrerlo y aplicar `delete` a cada nodo, normalmente en postorden. Perder el puntero a un bloque dinámico produce una fuga de memoria.

<<<<<<< HEAD
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
=======
Regla de ownership: cada bloque reservado debe tener un responsable claro que garantice su liberación exactamente una vez. No se debe usar un puntero después de liberar el objeto al que apuntaba.

### Cola enlazada
>>>>>>> 8ff5f147b602be8f98ebd063c0594ea879c1b3ff

Para que `enqueue` y `dequeue` sean `O(1)`, una cola enlazada mantiene punteros al primero y al último, además de la cantidad de elementos. Al quitar el último elemento, ambos punteros deben quedar en el estado correspondiente a una cola vacía.

<<<<<<< HEAD
| Concepto                    | Definición                                                                          |
| --------------------------- | ------------------------------------------------------------------------------------ |
| **Cola de Prioridad** | Tipo de Dato Abstracto (TDA) - Define el**QUÉ**: el comportamiento            |
| **Heap**              | Estructura de Datos Física - Define el**CÓMO**: la implementación eficiente |
=======
## 7. Integradores y parciales
>>>>>>> 8ff5f147b602be8f98ebd063c0594ea879c1b3ff

Los ejercicios integradores y parciales combinan varios TADs. Los patrones más frecuentes del workspace son:

<<<<<<< HEAD
## Evaluación - Segundo Parcial
=======
- Modelar una entidad con un tipo algebraico o una estructura `struct`.
- Mantener índices con `Map` o BST.
- Agrupar elementos por clave y contar ocurrencias.
- Usar una `PriorityQueue` para obtener máximos o mínimos sucesivos.
- Representar categorías jerárquicas con un árbol cuyos hijos están en un `Map`.
- Recorrer un árbol con DFS recursivo o BFS iterativo.
- Resolver el mismo problema en Haskell y C++, justificando las diferencias de memoria.
- Explicar el propósito, la precondición, el invariante y el costo de cada función.

En un parcial conviene separar siempre tres perspectivas:
>>>>>>> 8ff5f147b602be8f98ebd063c0594ea879c1b3ff

1. Usuario: utiliza la interfaz sin conocer la representación.
2. Implementador: elige una representación y mantiene su invariante.
3. Diseñador: especifica operaciones, precondiciones y costos esperados.

<<<<<<< HEAD
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
=======
Una estrategia de resolución útil es:

1. Identificar el TAD principal y los TAD auxiliares.
2. Escribir la representación y su invariante.
3. Resolver primero los casos base o estructuras vacías.
4. Elegir el recorrido o la operación que respete el costo pedido.
5. Verificar ownership y liberación si el ejercicio es en C++.
6. Justificar el costo con las variables de tamaño declaradas.

## 8. Checklist de repaso

- ¿Puedo definir un tipo algebraico y recorrerlo con pattern matching?
- ¿Puedo identificar casos base y recursión estructural?
- ¿Puedo distinguir `O(1)`, `O(log n)`, `O(n)` y `O(n^2)`?
- ¿Conozco la interfaz y la política de `Stack`, `Queue`, `Set`, `MultiSet`, `Map` y `PriorityQueue`?
- ¿Puedo explicar cómo cambia el costo según la representación?
- ¿Puedo insertar y eliminar en un BST?
- ¿Sé cuándo un BST se degrada y cómo AVL mantiene el balance?
- ¿Sé realizar las cuatro rotaciones AVL?
- ¿Puedo implementar BFS y DFS y explicar cuándo usar cada uno?
- ¿Sé representar arrays, listas y árboles con punteros en C++?
- ¿Puedo detectar una fuga de memoria y liberar correctamente una estructura?
- ¿Puedo justificar una solución desde las perspectivas de usuario, implementador y diseñador?
>>>>>>> 8ff5f147b602be8f98ebd063c0594ea879c1b3ff

## Organización del workspace

<<<<<<< HEAD
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
- `assocCons` busca en el map y actualiza o crea una nueva asociación :YYUtyutyu
=======
- `tp-1` a `tp-4`: tipos algebraicos, listas, recursión estructural y repasos.
- `tp-5`: `Stack`, `Queue` y `Set`.
- `tp-6`: `MultiSet`, `Map`, `PriorityQueue` y HeapSort.
- `tp-7`: heaps, BST, AVL y aplicaciones.
- `tp-8`: ejercicios integradores.
- `tp-9`: modelo imperativo.
- `tp-10`: punteros, arrays y análisis de memoria.
- `tp-11`: listas enlazadas, colas, árboles y BFS.
- `parciales`: enunciados de evaluaciones.
- `EstrD2026s1_christian`: resoluciones y material complementario.
>>>>>>> 8ff5f147b602be8f98ebd063c0594ea879c1b3ff
