
{-- PRACTICA 5 --}
import Set
import Queue
import Stack
{-- 1. --}

{-- 
    Proposito: Devuelve el primer elemento de una lista 
    PRECONDICION: La lista no debe ser vacía
    COSTO: O(1) constante
    Es de costo constante ya que se trabaja solo con un elemento de la lista.
--}
head' :: [a] -> a
head' (x:xs) = x

{-- 
    Proposito: Devuelve un numero incrementado en 90
    PRECONDICION: Debe ser un numero
    COSTO: O(1) constante
    Es de costo constante ya que se trabaja solo con un elemento.   
--}

sumar:: Int -> Int
sumar n = n + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1


{--
    Proposito: Devuelve un numero multiplicado n veces
    PRECONDICION: Debe ser un numero
    COSTO: O(n) lineal
    Es de costo lineal ya que se hace una recursion con el valor de n
 --}
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

{--
    Proposito: Devuelve la longitud de la lista de elementos
    PRECONDICION: Debe ser de tipo lista
    COSTO: O(n) lineal
    Es de costo lineal ya que se hace una recursion sobre los elementos de la lista
--}
longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

{--
    Proposito: Devuelve la los factoriales de una lista de numeros
    PRECONDICION: Debe ser de tipo lista
    COSTO: O(n^2) cuadratico
    Es de costo Cuadratico ya que la funcion factoriales es recursiva y sobre cada elemento se hace otra recursion (factorial)
--}
factoriales :: [Int] -> [Int]
factoriales [] = []
factoriales (x:xs) = factorial x : factoriales xs

{-- 
    Proposito: Devuelve True si n pertenece a la lista
    PRECONDICION: Debe ser de tipo lista de elementos comparables y n debe ser posible comparar
    COSTO: O(n) lineal
    Es de costo Lineal ya que la funcion es recursiva 
--}
pertenece :: Eq a => a -> [a] -> Bool
pertenece n [] = False
pertenece n (x:xs) = n == x || pertenece n xs

{--
    Proposito: Devuelve una lsita sin elementos repetidos
    PRECONDICION: Debe ser de tipo lista de elementos comparables
    COSTO: O(n^2) cuadratico
    Es de costo Cuadratico ya que la funcion es recursiva y ademas se hace otra recursion lineal para validar si ya se agrego o no ese elemento
 --}
sinRepetidos' :: Eq a => [a] -> [a]
sinRepetidos' [] = []
sinRepetidos' (x:xs) = 
    if pertenece x xs then sinRepetidos' xs else x : sinRepetidos' xs

{--
Proposito: Devuelve una lista de la fusion de la primera lista y la segunda lista
    PRECONDICION: Ambas deben ser de tipo lista
    COSTO: O(n) lineal
    Es de costo Lineal ya que la funcion solo recorre una lista y hace solo una unica accion en cada recorrido
 --}
append :: [a] -> [a] -> [a]
append [] ys = ys
append (x:xs) ys = x : append xs ys

{--
    Proposito:  Devuelve un string apartir de una lista de strings
    PRECONDICION: Debe ser una lista de string
    COSTO: O(n) lineal, ya que solo recorre una vez y hace una unica accion
--}

concatenar :: [String] -> String
concatenar [] = []
concatenar (x:xs) = x ++ concatenar xs

{--
    Proposito:  Devuelve una n elementos de una lista dada
    PRECONDICION: Debe ser de tipo lista y el numero debe ser mayor ó igual a cero
    COSTO: O(n) lineal, ya que no hace mas que recorrer la lista
--}

takeN :: Int -> [a] -> [a]
takeN 0 xs = []
takeN n [] = []
takeN n (x:xs) = x : takeN (n-1) xs
{--
    Proposito: devuelve una lista con n elementos menos
    PRECONDICION: n debe ser mayor ó igual a cero
    COSTO: O(n) lineal, ya que solo recorre una lista y no hace mas que eso
--}
dropN :: Int -> [a] -> [a]
dropN 0 xs = xs
dropN n [] = []
dropN n (x:xs) = dropN (n-1) xs

{--
    Proposito:  Devuelve una tupla con la lista dada dividida apartir del numero dado
    PRECONDICION: Debe ser de tipo lista y los numeros mayor o igual a cero
    COSTO: O(n) lineal, por nmás que sean dos funciones lineales, por cada recorrido no hace otro recorrido recursivo
--}
partir :: Int -> [a] -> ([a], [a])
partir n xs = (takeN n xs, dropN n xs)

{--
    Proposito:  Devuelve el minimo de una lista de elementos
    PRECONDICION: La lista no puede no tener elementos
    COSTO: O(n) lineal, ya que no hace mas de una recursion y el costo de min es constante por consiguiente en el peor de los casos el costo es lineal 
--}
minimo :: Ord a => [a] -> a
minimo [x] = x
minimo (x:xs) = min x (minimo xs)

{--
    Proposito:  Saca el n elemento de la lista
    PRECONDICION: Debe ser de tipo lista y comparable 
    COSTO: O(n) lineal, ya que no hace mas de una recursion, el caso base es de costo constante
--}
sacar :: Eq a => a -> [a] -> [a]
sacar n [] = []
sacar n (x:xs) = if n == x then xs else x : sacar n xs

{--
    Proposito:  Devuelve una lsita ordenada de menor a mayor
    PRECONDICION: Debe ser una lista de elemetnos ordenables
    COSTO: O(n^2) cuadratico, cada elemento ejecuta minimo que es lineal, incluido sacar que tambien es lineal dentro de la recursividad de ordenar entonces nos da un costo cuadratico
--}
ordenar :: Ord a => [a] -> [a]
ordenar [] = []
ordenar xs = let m = minimo xs in m : ordenar (sacar m xs)

{--2. SET(conjunto) --}

{--
    Proposito: Dados una lista y un conjunto, describ e una lista con to dos los elementos que p ertenecen
al conjunto.
    PRECONDICION: La lista debe der de tipos comparables.
    COSTO: O(n) lineal
--}
losQuePertenecen :: Eq a => [a] -> Set a -> [a]
losQuePertenecen [] s = []
losQuePertenecen (x:xs) s = if belongs x s then x : losQuePertenecen xs s else losQuePertenecen xs s

{-- Ejemplo de uso --}
ejemploDeSet =  addS 4 (addS 1 (addS 2 (addS 3 emptyS)))
losQuePertenecenEjemplo = losQuePertenecen [1,2,3,5] ejemploDeSet


{--
    Proposito: Devuelve una lista sin elementos repetidos
    PRECONDICION: La lista debe ser de tipos comparables.
    COSTO: O(n) lineal, ya que se hace un recorrido en la lista.
--}
sinRepetidos :: Eq a => [a] -> [a]
sinRepetidos xs = setToList (addList xs) 


addList:: Eq a => [a] -> Set a
addList [] = emptyS
addList (x:xs) = addS x (addList xs)

{-- Ejemplo de uso --}
sinRepetidosEjemplo = sinRepetidos [1,2,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,8]

{--
    Proposito: Dado un arb ol de conjuntos describ e un conjunto con la union de to dos los conjuntos
del arbol.
    PRECONDICION: Tree debe ser del mismo tipo que el Set
    COSTO: O(n) lineal
--}
data Tree a = EmptyT | NodeT a (Tree a) (Tree a) deriving Show

unirTodos :: Eq a => Tree (Set a) -> Set a
unirTodos EmptyT = emptyS
unirTodos (NodeT x t1 t2) = unionS x ( unionS (unirTodos t1) (unirTodos t2))


{-- Ejemplo de uso --}
ejemploDeSet1 =  addS 4 (addS 1 (addS 2 (addS 3 emptyS)))
ejemploDeSet2 =  addS 4 (addS 6 (addS 2 (addS 3 emptyS)))
ejemploDeSet3 =  addS 4 (addS 5 (addS 2 (addS 3 emptyS)))
ejemploDeSet4 =  addS 4 (addS 7 (addS 2 (addS 3 emptyS)))

unirTodosEjemplo = unirTodos (NodeT ejemploDeSet1 (NodeT ejemploDeSet2 EmptyT EmptyT ) (NodeT ejemploDeSet3 EmptyT  (NodeT ejemploDeSet4 EmptyT EmptyT ) ) )


{-- 3. Queue (Cola) --}

{--
    Proposito: 
    PRECONDICION: 
    COSTO: O(n) lineal, ya que se hace un recorrido.
--}
lengthQ :: Queue a -> Int
lengthQ q = if isEmptyQ q then 0 else  1 + (lengthQ (dequeue q))

{-- Ejemplo de uso --}
ejemploDeQueue = enqueue 1 (enqueue 2 (enqueue 3 emptyQ))
lengthQEjemplo = lengthQ ejemploDeQueue

{--
    Proposito: 
    PRECONDICION: 
    COSTO:
--}
queueToList :: Queue a -> [a]
queueToList q = if isEmptyQ q then [] else (firstQ q) : queueToList (dequeue q) 

{-- Ejemplo de uso --}
ejemploDeQueue1 = enqueue 1 (enqueue 2 (enqueue 3 emptyQ))
queueToListEjemplo = queueToList ejemploDeQueue1

{--
    Proposito: 
    PRECONDICION: 
    COSTO:
--}
unionQ :: Queue a -> Queue a -> Queue a
unionQ q1 q2 = if isEmptyQ q2 then q1 else enqueue (firstQ q2) (unionQ q1 (dequeue q2))

{-- Ejemplo de uso --}
ejemploDeQueueA = enqueue 3 (enqueue 2 (enqueue 1 emptyQ))
ejemploDeQueueB = enqueue 4 (enqueue 5 (enqueue 6 emptyQ))
unionQEjemplo = unionQ ejemploDeQueueA ejemploDeQueueB

{-- 4. STACK (pila) --}

{--
    Proposito: 
    PRECONDICION: 
    COSTO:
--}
apilar :: [a] -> Stack a
apilar [] = emptyST
apilar (x:xs) = push x (apilar xs)

{-- Ejemplo de uso --}
apilarEjemplo = apilar [1,2,3,4,5,6]

{--
    Proposito: 
    PRECONDICION: 
    COSTO:
--}
desapilar :: Stack a -> [a]
desapilar st = if isEmptyST st then [] else (top st) : desapilar (pop st) 

{-- Ejemplo de uso --}
desapilarEjemplo = desapilar (push 3 (push 2 (push 1 emptyST)))


insertarEnPos :: Int -> a -> Stack a -> Stack a
insertarEnPos n e st = if n == 0 then push e st else push (top st) (insertarEnPos (n-1) e (pop st)) 


{-- Ejemplo de uso --}
insertarEnPosEjemplo = insertarEnPos  2 666 ( push 4 (push 3 (push 2 (push 1 emptyST))))