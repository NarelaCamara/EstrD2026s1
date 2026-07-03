module MaxHeap (
    MaxHeap,
    emptyH,
    isEmptyH,
    insertH,
    maxH,
    deleteMaxH
)
where
data MaxHeap a = MH [a] deriving Show

{-- 
    INVARIANTE DE REPRESENTACION: ....  Esta ordenados de menor a mayor
--}


{--
    Proposito: Devuelve una MH vacia
    PRECONDICION: ninguna
    COSTO: O(1) Constante, ya que es solo una operacion.
--}
emptyH:: MaxHeap a
emptyH = MH []

{--
    Proposito: Devuelve un bool si la MH esta vacia
    PRECONDICION:  Ninguna
    COSTO: O(1) Constante, ya que solo es una operacion de patter maching
--}
isEmptyH:: MaxHeap a -> Bool
isEmptyH (MH []) = True
isEmptyH (MH _) = False


{-
    Proposito: Inserta un elemento en un MH
    PRECONDICION:   Ninguna
    COSTO: O(n) Lineal 
-}
insertH:: Ord a => a -> MaxHeap a -> MaxHeap a
insertH n (MH xs) = (MH (insertarOrdenado n xs))

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
maxH:: Ord a => MaxHeap a -> a
maxH (MH (x:xs)) = x


{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(1) constante
-}
deleteMaxH:: Ord a => MaxHeap a -> MaxHeap a
deleteMaxH (MH (x:xs)) = (MH xs)