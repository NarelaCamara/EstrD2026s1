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

Comandos de compilación en PowerShell:

```powershell
cls; g++ -std=c++11 -O2 -o tp-9\tp-9.exe tp-9\tp-9.cpp; .\tp-9\tp-9.exe
cls; g++ -std=c++11 -O2 -o tp-10\tp-10.exe tp-10\tp-10.cpp; .\tp-10\tp-10.exe
cls; g++ -std=c++11 -O2 -o tp-11\tp-11.exe tp-11\tp-11.cpp; .\tp-11\tp-11.exe
cls; g++ -std=c++11 -O2 -o acceso-memoria.exe acceso-memoria.cpp; .\acceso-memoria.exe
cls; g++ -std=c++11 -O2 -o tp-8\Nave\cplusplus\tp-8.exe tp-8\Nave\cplusplus\tp-8.cpp; .\tp-8\Nave\cplusplus\tp-8.exe
cls; g++ -std=c++11 -O2 -o tp-8\Magos\cplusplus\tp-8.exe tp-8\Magos\cplusplus\tp-8.cpp; .\tp-8\Magos\cplusplus\tp-8.exe
```

## 1. Modelo funcional

### Tipos algebraicos

Un tipo algebraico define valores mediante constructores. Por ejemplo, una lista y un árbol pueden definirse recursivamente:

```haskell
data Lista a = Vacia | Cons a (Lista a)

data Tree a = EmptyT | NodeT a (Tree a) (Tree a)
```

Cada constructor representa una forma posible del dato. Las funciones se escriben con *pattern matching*, separando casos base y casos recursivos:

```haskell
longitud :: [a] -> Int
longitud [] = 0
longitud (_:xs) = 1 + longitud xs
```

La recursión estructural sigue la forma del dato: para una lista se procesa la cabeza y se continúa con la cola; para un árbol se procesa la raíz y luego ambos subárboles. El caso base debe detener la recursión.

### Inmutabilidad y `Maybe`

En Haskell las estructuras no se modifican en el lugar. Una operación como insertar devuelve una nueva estructura, que puede reutilizar partes de la anterior.

`Maybe a` representa un resultado que puede existir o no:

```haskell
buscar :: Eq a => a -> [a] -> Maybe a
buscar _ [] = Nothing
buscar x (y:ys)
  | x == y = Just y
  | otherwise = buscar x ys
```

Se usa para expresar búsquedas sin inventar valores especiales y obliga a tratar explícitamente los casos `Nothing` y `Just valor`.

### Listas y operaciones típicas

Para una lista de longitud `n`, suponiendo acceso por recorrido:

| Operación | Costo | Motivo |
|---|---:|---|
| Obtener la cabeza | `O(1)` | Solo se inspecciona el primer constructor. |
| `append xs ys` | `O(n)` | Se recorre `xs`. |
| `length xs` | `O(n)` | Se visita cada elemento. |
| Buscar un elemento | `O(n)` | Puede ser necesario recorrer toda la lista. |
| `take` o `drop` | `O(k)` | Se recorren los primeros `k` elementos. |
| Ordenar seleccionando mínimos | `O(n^2)` | Se repiten búsquedas lineales. |

Funciones como `sinRepetidos`, `ordenar`, `mapToList` o `agrupar` deben analizarse considerando todas las recursiones anidadas, no solo la recursión exterior.

## 2. Complejidad

La complejidad mide cómo crecen el tiempo o el espacio con respecto al tamaño de la entrada. Primero hay que declarar qué representa cada variable: por ejemplo, `n` puede ser la longitud de una lista, `k` la cantidad de claves de un `Map` y `v` la cantidad de valores distintos.

### Órdenes frecuentes

| Orden | Nombre | Ejemplo |
|---|---|---|
| `O(1)` | Constante | Consultar el primer elemento de una cola con puntero al frente. |
| `O(log n)` | Logarítmico | Buscar en un árbol balanceado. |
| `O(n)` | Lineal | Recorrer una lista o un árbol completo. |
| `O(n log n)` | Lineal-logarítmico | HeapSort con una implementación eficiente. |
| `O(n^2)` | Cuadrático | Recorrer `n` elementos y buscar linealmente para cada uno. |

Reglas útiles:

- Las operaciones secuenciales se suman y se conserva el término dominante.
- Las operaciones anidadas se multiplican.
- Las constantes se descartan en notación asintótica.
- Hay que distinguir mejor caso, peor caso y costo amortizado.
- El costo de una función depende de la representación concreta del TAD.

Ejemplo: si se procesan `n` claves, se hace una búsqueda `O(log k)` y se inserta en una lista ordenada de longitud máxima `n`, el costo puede ser `O(n (log k + n))`, que se simplifica a `O(n^2)` en el peor caso.

### Tiempo y espacio

Además del tiempo se puede analizar el espacio adicional. Una función recursiva puede usar `O(h)` espacio de pila, donde `h` es la profundidad de la recursión. Un algoritmo que crea una lista nueva de tamaño `n` usa `O(n)` memoria adicional.

## 3. Tipos abstractos de datos

Un TAD describe qué operaciones ofrece y qué propiedades deben cumplir, sin imponer cómo se representa. La especificación debe incluir propósito, precondiciones, postcondiciones, invariante de representación y costos esperados.

### Stack o pila

Funciona con política LIFO: el último elemento insertado es el primero que sale.

Operaciones usuales: `emptyST`, `isEmptyST`, `push`, `top` y `pop`. Con una lista como representación, insertar y consultar el tope cuestan `O(1)`. Se usa para DFS y para deshacer operaciones.

### Queue o cola

Funciona con política FIFO: el primer elemento insertado es el primero que sale.

Operaciones usuales: `emptyQ`, `isEmptyQ`, `enqueue`, `firstQ` y `dequeue`.

Una implementación con dos listas mantiene una lista de entrada y otra de salida. Si la lista de salida está vacía, se invierte la de entrada. El costo individual de una operación puede ser `O(n)`, pero el costo amortizado de una secuencia de operaciones es `O(1)` por operación, porque cada elemento se mueve de una lista a la otra una sola vez.

### Set o conjunto

No contiene elementos repetidos. Operaciones usuales: crear vacío, agregar, consultar pertenencia, eliminar, obtener tamaño, convertir a lista y unir conjuntos.

La implementación determina el costo:

- Con lista sin ordenar: pertenencia y eliminación son `O(n)`.
- Con lista ordenada: se puede detener antes, pero sigue siendo lineal para insertar o eliminar.
- Con BST balanceado: las operaciones principales son `O(log n)`.

El invariante fundamental es que ningún elemento aparece más de una vez.

### MultiSet

Es un conjunto que permite repetidos. Conceptualmente almacena cada elemento junto con su cantidad de apariciones. Las operaciones típicas son agregar una aparición, quitar una aparición, consultar la cantidad, pertenencia y convertir a lista.

La diferencia con `Set` es que `add` no ignora un elemento ya presente: incrementa su multiplicidad.

### Map

Representa asociaciones clave-valor. Una clave identifica a lo sumo un valor dentro del mapa.

Operaciones usuales: `emptyM`, `assocM`, `lookupM`, `deleteM`, `keysM` y `sizeM`. La búsqueda devuelve normalmente `Maybe valor`.

Ejercicios frecuentes:

- Convertir una lista de pares en un mapa.
- Obtener todos los valores asociados a una lista de claves.
- Agrupar valores por clave.
- Contar ocurrencias.
- Fusionar dos mapas.
- Invertir el mapa, agrupando las claves que comparten valor.

Si el mapa se representa como lista de pares, buscar y asociar suelen ser `O(n)`. Si se representa con un árbol balanceado, suelen ser `O(log n)`.

### Priority Queue

Una cola de prioridad devuelve el elemento más prioritario, normalmente el mínimo, aunque también puede definirse como máximo.

Operaciones usuales: `emptyPQ`, `isEmptyPQ`, `insertPQ`, `findMinPQ` y `deleteMinPQ`.

La interfaz no determina la representación. Puede implementarse con:

- Lista ordenada: consultar el mínimo es `O(1)`, insertar puede ser `O(n)`.
- Lista no ordenada: insertar es `O(1)`, encontrar/eliminar el mínimo es `O(n)`.
- Heap: insertar y eliminar el mínimo son `O(log n)`, consultar el mínimo es `O(1)`.

## 4. Árboles, heaps y prioridades

### Árbol binario

Cada nodo tiene una raíz, un subárbol izquierdo y un subárbol derecho. Un árbol puede estar vacío. Funciones básicas: crear árbol vacío, crear nodo, consultar raíz, hijo izquierdo y hijo derecho.

Operaciones generales como sumar, contar nodos, buscar sin propiedad de orden, calcular altura, obtener hojas o listar nodos recorren el árbol completo y cuestan `O(n)`.

La altura puede definirse como `0` para el árbol vacío y `1 + max altura` para un nodo. Hay que declarar la convención porque algunas implementaciones cuentan aristas en lugar de nodos.

### BST o ABB

Un árbol binario de búsqueda cumple, recursivamente:

- Todos los elementos del subárbol izquierdo son menores que la raíz.
- Todos los elementos del subárbol derecho son mayores que la raíz.
- Ambos subárboles también son BST.

Buscar e insertar siguen una sola rama. Eliminar requiere tres casos:

1. El nodo es hoja: se reemplaza por vacío.
2. Tiene un solo hijo: se reemplaza por ese hijo.
3. Tiene dos hijos: se reemplaza por el máximo del subárbol izquierdo o el mínimo del derecho, y luego se elimina ese reemplazo.

El costo es `O(h)`, donde `h` es la altura. Es `O(log n)` si el árbol está balanceado y puede degradarse a `O(n)` si queda como una lista.

### AVL

Un AVL es un BST que mantiene, en cada nodo, una diferencia de alturas entre subárboles de a lo sumo uno:

```text
abs(altura(izquierdo) - altura(derecho)) <= 1
```

Después de insertar o eliminar se actualizan alturas y se corrige el desequilibrio mediante rotaciones:

- Rotación simple a la derecha: caso izquierda-izquierda.
- Rotación simple a la izquierda: caso derecha-derecha.
- Rotación doble izquierda-derecha: caso izquierda-derecha.
- Rotación doble derecha-izquierda: caso derecha-izquierda.

La invariante AVL se refiere a alturas, no a que ambos subárboles tengan igual cantidad de nodos. Gracias al balance, buscar, insertar y eliminar cuestan `O(log n)`.

### Heap

Un heap es un árbol completo, representado habitualmente en un array, que cumple la propiedad de heap:

- Min-heap: cada padre es menor o igual que sus hijos.
- Max-heap: cada padre es mayor o igual que sus hijos.

En un min-heap el mínimo está en la raíz; en un max-heap, el máximo. La forma completa garantiza altura `O(log n)`. En un array indexado desde cero:

```text
izquierdo(i) = 2*i + 1
derecho(i)   = 2*i + 2
padre(i)     = (i - 1) / 2
```

Insertar agrega al final y hace *sift up*. Eliminar la raíz mueve el último elemento a la raíz y hace *sift down*. Ambos cuestan `O(log n)`; consultar la raíz cuesta `O(1)`.

HeapSort inserta elementos en una cola de prioridad y luego los extrae ordenadamente. Con heap, su costo es `O(n log n)`.

## 5. Recorridos de árboles y grafos

### DFS

Depth-First Search recorre un camino hasta el fondo antes de retroceder. Puede implementarse con recursión o una pila. En un árbol aparecen los recorridos:

- Preorden: raíz, izquierdo, derecho.
- Inorden: izquierdo, raíz, derecho.
- Postorden: izquierdo, derecho, raíz.

En un BST, el recorrido inorden produce los elementos ordenados.

### BFS

Breadth-First Search visita por niveles. Usa una cola: se encola el nodo inicial, se procesa el primero y se encolan sus vecinos no visitados. En árboles, permite procesar niveles y resolver ejercicios como obtener nodos de un nivel determinado.

Para evitar ciclos en un grafo se mantiene un conjunto de visitados. Con listas de adyacencia, el costo es `O(V + E)`, donde `V` es la cantidad de vértices y `E` la cantidad de aristas.

BFS encuentra caminos mínimos en cantidad de aristas cuando no se consideran pesos. Para caminos mínimos ponderados se necesitan otros algoritmos, como Dijkstra bajo sus precondiciones. DFS es útil para detectar ciclos, recorrer componentes y explorar exhaustivamente.

## 6. Modelo imperativo

### Memoria

En C++ se distinguen, de forma simplificada:

- Memoria estática: vive durante toda la ejecución, como variables globales o `static`.
- Stack: contiene variables locales y frames de funciones; se administra automáticamente.
- Heap: memoria dinámica solicitada durante la ejecución con `new` y liberada con `delete`.

Un puntero guarda una dirección de memoria. `&x` obtiene la dirección de `x` y `*p` accede al valor apuntado. Un puntero nulo no apunta a un objeto válido y debe comprobarse antes de desreferenciarlo.

### Arrays y `ArrayList`

Un array ocupa posiciones contiguas. Su acceso por índice es `O(1)`, pero insertar o eliminar en el medio puede requerir desplazar elementos.

Un `ArrayList` dinámico suele guardar cantidad, capacidad y un puntero al array. Cuando se llena, se reserva un array más grande, se copian los elementos y se libera el anterior. La expansión hace que agregar al final sea `O(1)` amortizado.

### Listas enlazadas

Una lista enlazada guarda nodos separados en memoria. Cada nodo contiene un elemento y un puntero al siguiente:

```cpp
struct NodoL {
    int elem;
    NodoL* siguiente;
};
```

El acceso por posición es `O(n)`, pero insertar o eliminar al comienzo es `O(1)` si se tiene el puntero correspondiente. Hay que actualizar cuidadosamente los enlaces y liberar cada nodo que deja de usarse.

### Árboles en C++

Una representación habitual es:

```cpp
struct NodeT {
    int elem;
    NodeT* left;
    NodeT* right;
};

typedef NodeT* Tree;
```

Crear un nodo requiere `new`. Destruir un árbol requiere recorrerlo y aplicar `delete` a cada nodo, normalmente en postorden. Perder el puntero a un bloque dinámico produce una fuga de memoria.

Regla de ownership: cada bloque reservado debe tener un responsable claro que garantice su liberación exactamente una vez. No se debe usar un puntero después de liberar el objeto al que apuntaba.

### Cola enlazada

Para que `enqueue` y `dequeue` sean `O(1)`, una cola enlazada mantiene punteros al primero y al último, además de la cantidad de elementos. Al quitar el último elemento, ambos punteros deben quedar en el estado correspondiente a una cola vacía.

## 7. Integradores y parciales

Los ejercicios integradores y parciales combinan varios TADs. Los patrones más frecuentes del workspace son:

- Modelar una entidad con un tipo algebraico o una estructura `struct`.
- Mantener índices con `Map` o BST.
- Agrupar elementos por clave y contar ocurrencias.
- Usar una `PriorityQueue` para obtener máximos o mínimos sucesivos.
- Representar categorías jerárquicas con un árbol cuyos hijos están en un `Map`.
- Recorrer un árbol con DFS recursivo o BFS iterativo.
- Resolver el mismo problema en Haskell y C++, justificando las diferencias de memoria.
- Explicar el propósito, la precondición, el invariante y el costo de cada función.

En un parcial conviene separar siempre tres perspectivas:

1. Usuario: utiliza la interfaz sin conocer la representación.
2. Implementador: elige una representación y mantiene su invariante.
3. Diseñador: especifica operaciones, precondiciones y costos esperados.

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

## Organización del workspace

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
