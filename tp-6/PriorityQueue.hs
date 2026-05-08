module PriorityQueue (
    PriorityQueue,
    emptyPQ,
    isEmptyPQ,
    insertPQ,
    findMinPQ,
    deleteMinPQ
)
where
data PriorityQueue a = PQ [a] deriving Show

{-- 
    INVARIANTE DE REPRESENTACION: ....  Esta ordenados de menor a mayor
--}


{--
    Proposito: Devuelve una pq vacia
    PRECONDICION: ninguna
    COSTO: O(1) Constante, ya que es solo una operacion.
--}
emptyPQ:: PriorityQueue a
emptyPQ = PQ []

{--
    Proposito: Devuelve un bool si la pq esta vacia
    PRECONDICION:  Ninguna
    COSTO: O(1) Constante, ya que solo es una operacion de patter maching
--}
isEmptyPQ:: PriorityQueue a -> Bool
isEmptyPQ (PQ []) = True
isEmptyPQ (PQ _) = False


{-
    Proposito: Inserta un elemento en un pq
    PRECONDICION:   Ninguna
    COSTO: O(n) Lineal 
-}
insertPQ:: Ord a => a -> PriorityQueue a -> PriorityQueue a
insertPQ n (PQ xs) = (PQ (insertarOrdenado n xs))

{-
    Proposito: Devuelve una lista ordenanda de menor a mayor
    PRECONDICION:   Ninguna
    COSTO:  O(1) + O(n) Lineal, en el peor de los casos recorre todo
-}
insertarOrdenado:: Ord a => a -> [a] -> [a]
insertarOrdenado x [] = [x]
insertarOrdenado n (x:xs) = if n > x then x: (insertarOrdenado n xs) else n:x:xs

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(1) constante
-}
findMinPQ:: Ord a => PriorityQueue a -> a
findMinPQ (PQ (x:xs)) = x


{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(1) constante
-}
deleteMinPQ:: Ord a => PriorityQueue a -> PriorityQueue a
deleteMinPQ (PQ (x:xs)) = (PQ xs)