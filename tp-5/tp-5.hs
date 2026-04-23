
{-- PRACTICA 5 --}
import Set

{-- 1. --}

{-- 
    Proposito: Devuelve el primer elemento de una lista 
    PRECONDICION: La lista no debe ser vacía
    COSTO: constante
    Es de costo constante ya que se trabaja solo con un elemento de la lista.
--}
head' :: [a] -> a
head' (x:xs) = x

{-- 
    Proposito: Devuelve un numero incrementado en 90
    PRECONDICION: Debe ser un numero
    COSTO: constante
    Es de costo constante ya que se trabaja solo con un elemento.   
--}

sumar:: Int -> Int
sumar n = n + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1


{--
    Proposito: Devuelve un numero multiplicado n veces
    PRECONDICION: Debe ser un numero
    COSTO: Lineal
    Es de costo lineal ya que se hace una recursion con el valor de n
 --}
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

{--
    Proposito: Devuelve la longitud de la lista de elementos
    PRECONDICION: Debe ser de tipo lista
    COSTO: Lineal
    Es de costo lineal ya que se hace una recursion sobre los elementos de la lista
--}
longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

{--
    Proposito: Devuelve la los factoriales de una lista de numeros
    PRECONDICION: Debe ser de tipo lista
    COSTO: Cuadratico
    Es de costo Cuadratico ya que la funcion factoriales es recursiva y sobre cada elemento se hace otra recursion (factorial)
--}
factoriales :: [Int] -> [Int]
factoriales [] = []
factoriales (x:xs) = factorial x : factoriales xs

{-- 
    Proposito: Devuelve True si n pertenece a la lista
    PRECONDICION: Debe ser de tipo lista de elementos comparables y n debe ser posible comparar
    COSTO: Lineal
    Es de costo Lineal ya que la funcion es recursiva 
--}
pertenece :: Eq a => a -> [a] -> Bool
pertenece n [] = False
pertenece n (x:xs) = n == x || pertenece n xs

{--
    Proposito: Devuelve una lsita sin elementos repetidos
    PRECONDICION: Debe ser de tipo lista de elementos comparables
    COSTO: Cuadratico
    Es de costo Cuadratico ya que la funcion es recursiva y ademas se hace otra recursion lineal para validar si ya se agrego o no ese elemento
 --}
sinRepetidos' :: Eq a => [a] -> [a]
sinRepetidos' [] = []
sinRepetidos' (x:xs) = 
    if pertenece x xs then sinRepetidos' xs else x : sinRepetidos' xs

{--
Proposito: Devuelve una lista de la fusion de la primera lista y la segunda lista
    PRECONDICION: Ambas deben ser de tipo lista
    COSTO: Lineal
    Es de costo Lineal ya que la funcion solo recorre una lista y hace solo una unica accion en cada recorrido
 --}
append :: [a] -> [a] -> [a]
append [] ys = ys
append (x:xs) ys = x : append xs ys

{--
    Proposito:  Devuelve un string apartir de una lista de strings
    PRECONDICION: Debe ser una lista de string
    COSTO: Lineal, ya que solo recorre una vez y hace una unica accion
--}

concatenar :: [String] -> String
concatenar [] = []
concatenar (x:xs) = x ++ concatenar xs

{--
    Proposito:  Devuelve una n elementos de una lista dada
    PRECONDICION: Debe ser de tipo lista y el numero debe ser mayor ó igual a cero
    COSTO: Lineal, ya que no hace mas que recorrer la lista
--}

takeN :: Int -> [a] -> [a]
takeN 0 xs = []
takeN n [] = []
takeN n (x:xs) = x : takeN (n-1) xs
{--
    Proposito: devuelve una lista con n elementos menos
    PRECONDICION: n debe ser mayor ó igual a cero
    COSTO: Lineal, ya que solo recorre una lista y no hace mas que eso
--}
dropN :: Int -> [a] -> [a]
dropN 0 xs = xs
dropN n [] = []
dropN n (x:xs) = dropN (n-1) xs

{--
    Proposito:  Devuelve una tupla con la lista dada dividida apartir del numero dado
    PRECONDICION: Debe ser de tipo lista y los numeros mayor o igual a cero
    COSTO: Lineal, por nmás que sean dos funciones lineales, por cada recorrido no hace otro recorrido recursivo
--}
partir :: Int -> [a] -> ([a], [a])
partir n xs = (takeN n xs, dropN n xs)

{--
    Proposito:  Devuelve el minimo de una lista de elementos
    PRECONDICION: La lista no puede no tener elementos
    COSTO: Lienal, ya que no hace mas de una recursion y el costo de min es constante por consiguiente en el peor de los casos el costo es lineal 
--}
minimo :: Ord a => [a] -> a
minimo [x] = x
minimo (x:xs) = min x (minimo xs)

{--
    Proposito:  Saca el n elemento de la lista
    PRECONDICION: Debe ser de tipo lista y comparable 
    COSTO: Lineal, ya que no hace mas de una recursion, el caso base es de costo constante
--}
sacar :: Eq a => a -> [a] -> [a]
sacar n [] = []
sacar n (x:xs) = if n == x then xs else x : sacar n xs

{--
    Proposito:  Devuelve una lsita ordenada de menor a mayor
    PRECONDICION: Debe ser una lista de elemetnos ordenables
    COSTO: Cuadratico, cada elemento ejecuta minimo que es lineal, incluido sacar que tambien es lineal dentro de la recursividad de ordenar entonces nos da un costo cuadratico
--}
ordenar :: Ord a => [a] -> [a]
ordenar [] = []
orderar xs = let m = minimo xs in m : ordenar (sacar m xs)

{--2. SET(conjunto) --}

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
losQuePertenecen :: Eq a => [a] -> Set a -> [a]
losQuePertenecen [] s = []
losQuePertenecen (x:xs) s = if belongs x s then x : losQuePertenecen xs s else losQuePertenecen xs s

{-- Ejemplo de uso --}
ejemploDeSet =  addS 4 (addS 1 (addS 2 (addS 3 emptyS)))
losQuePertenecenEjemplo = losQuePertenecen [1,2,3,5] ejemploDeSet


{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
sinRepetidos :: Eq a => [a] -> [a]
sinRepetidos xs = setToList (addList xs) 


addList:: Eq a => [a] -> Set a
addList [] = emptyS
addList (x:xs) = addS x (addList xs)

{-- Ejemplo de uso --}
sinRepetidosEjemplo = sinRepetidos [1,2,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,8]

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
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

{--
    Proposito: 
    PRECONDICION: 
    COSTO:
--}