
import PriorityQueue
import Map
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

{-- 3. --}

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  
-}
valuesM :: Eq k => Map k v -> [Maybe v]
valuesM  map = valores (keys map) map 

{-- eJemplo de uso --}
valuesMEjemplo = valuesM mapEjemplo1

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(n) Lineal *  O(n) Lineal =  O(n^2) Cuadratico
-}
valores:: Eq k => [k] -> Map k v -> [Maybe v]
valores [] map = []
valores (x:xs) map = (lookupM x map) : valores xs map 


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(n) Lineal *  O(n) Lineal  =  O(n^2) Cuadratico
-}
todasAsociadas :: Eq k => [k] -> Map k v -> Bool
todasAsociadas [] map = True
todasAsociadas (x:xs) map = notIsNothing (lookupM x map) && todasAsociadas xs map

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante
-}
notIsNothing:: Maybe a -> Bool
notIsNothing Nothing = False
notIsNothing _ = True 

{-- eJemplo de uso --}
todasAsociadasEjemplo = todasAsociadas [1, 2] mapEjemplo1


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal   O(n) Lineal =  O(n^2) Cuadratico
-}
listToMap :: Eq k => [(k, v)] -> Map k v
listToMap [] = emptyM
listToMap ((c1,v1):xs) = assocM c1 v1 (listToMap xs)


{--Ejemplo de uso --} 
-- RAROOOO porque no me toma el valor de 4 ? 
listToMapEjemplo = listToMap [(1, "Valor 1"), (2, "Valor 2"),(2, "Valor 4"), (3, "Valor 3")]

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n^2) Cuadratico
-}
mapToList :: Eq k => Map k v -> [(k, v)]
mapToList map = convertirMap (keys map) map

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante +  O(n) Lineal *  O(n) Lineal =  O(n^2) Cuadratico
-}
convertirMap :: Eq k => [k] -> Map k v -> [(k,v)]
convertirMap [] map = []
convertirMap (x:xs) map = ( x, (fromJust (lookupM x map))) : convertirMap xs map

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}

fromJust:: Maybe v -> v
fromJust (Just e) = e
{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante +  O(1) Constante +  O(n) Lineal *  O(n) Lineal =  O(n^2) Cuadratico
-}
agruparEq :: Eq k => [(k, v)] -> Map k [v]
agruparEq [] = emptyM
agruparEq ((c1,v1):xs) = 
    assocM c1 (v1 : fromJust' (lookupM c1 (agruparEq xs) ))  (agruparEq xs)

fromJust' ::  Maybe [v] -> [v]
fromJust' (Just xs) = xs
fromJust' Nothing = [] 


{--Ejemplo de uso --}
agruparEqEjemplo = agruparEq [(1, "Valor 1"),  (2, "Valor 6"), (2, "Valor 2"),(2, "Valor 4"), (3, "Valor 3")]



{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante +  O(n) Lineal +   O(1) Constante +  O(1) Constante *  O(n) Lineal =  O(n^2) Cuadratico 
-}
incrementar :: Eq k => [k] -> Map k Int -> Map k Int
incrementar [] map = map
incrementar (x:xs) map = assocM x (incrementaUno (fromJust'' (lookupM x map ))) (incrementar xs map)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}

incrementaUno:: Int -> Int
incrementaUno n = n+1

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}

fromJust'':: Maybe Int -> Int
fromJust'' (Just e) = e
fromJust'' Nothing = 0


{--Ejemplo de uso --}
incrementarEjemplo = incrementar ["Clave 1", "Clave 2", "Clave 2"] mapEjemplo2 