
import PriorityQueue
{-- PRACTICA 6 --}

{-- 1. --}

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal
-}
heapSort::Ord a => [a] -> [a]
heapSort xs = toListPQ (createPQ xs)  

{-- Ejemplo de uso --}
heapSortEjemplo = heapSort [12,666,1,2,3,18,8]

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(n) Lineal *  O(n) Lineal =  O(n^2) Cuadratico
-}

createPQ ::Ord a => [a] -> PriorityQueue a
createPQ [] = emptyPQ
createPQ (x:xs) = insertPQ x (createPQ xs)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(1) constante +  O(n) Lineal +  O(1) constante
-}
toListPQ ::Ord a => PriorityQueue a -> [a]
toListPQ pq = if isEmptyPQ pq then [] else (findMinPQ pq) : (toListPQ (deleteMinPQ pq) ) 