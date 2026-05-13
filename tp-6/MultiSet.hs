module MultiSet (
    MultiSet,
    emptyMS,
    addMS,
    ocurrencesMS,
    unionMS,
    intersectionMS,
    multiSetToList
)
where

import Map

data MultiSet a = MS (Map a Int) deriving Show



{-
    INVARIANTE DE REPRENSENTACION:  
-}

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
emptyMS :: MultiSet a
emptyMS = (MS emptyM)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  Map V1 >>  O(n) Lineal
-}
addMS :: Ord a => a -> MultiSet a -> MultiSet a
addMS n (MS map) = (MS (assocM n (fromJust''(lookupM n map)) map) )

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}

fromJust'':: Maybe Int -> Int
fromJust'' (Just e) = e
fromJust'' Nothing = 0


{-
    Proposito: 
    PRECONDICION:   
    COSTO:    O(1) Constante +   O(n) Lineal 
-}
ocurrencesMS :: Ord a => a -> MultiSet a -> Int
ocurrencesMS n (MS map) =  fromJust'' (lookupM n map )

 
{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(n^2) Cuadratico +  O(n) Lineal
-}
unionMS :: Ord a => MultiSet a -> MultiSet a -> MultiSet a
unionMS (MS map1) (MS map2) = (MS (mergeMaps map1 map2))


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n^2) Cuadratico +  O(n) Lineal
-}

mergeMaps:: Eq k => Map k v -> Map k v -> Map k v
mergeMaps m1 m2 = mergeToMap (mapToList m1) m2


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal +  O(1) Constante
-}

mergeToMap:: Eq k => [(k,v)] -> Map k v -> Map k v 
mergeToMap [] map = map
mergeToMap ((c1,v1):xs) map = assocM c1 v1 (mergeToMap xs map)

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
    COSTO:   O(1) Constante +  O(n) Lineal
-}
intersectionMS :: Ord a => MultiSet a -> MultiSet a -> MultiSet a
intersectionMS (MS map1) (MS map2) = (MS (intersectionM map1 map2))

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal +  O(n) Lineal
-}
intersectionM :: Ord a => Map a Int -> Map a Int -> Map a Int
intersectionM map1 map2 = deleteKeysM (keys map1) map2 

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(n) Lineal +  O(n) Lineal +  O(n) Lineal =  O(n) Lineal 
-}

deleteKeysM :: Ord k => [k] -> Map k Int -> Map k Int
deleteKeysM [] map = emptyM 
deleteKeysM (x:xs) map =  notIsNothing x (lookupM x map) (deleteKeysM xs map) 


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante +  O(n) Lineal
-}

notIsNothing:: Ord k => k -> Maybe Int -> Map k Int  -> Map k Int
notIsNothing n Nothing map = map 
notIsNothing n (Just v) map = assocM n v map 


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n^2) Cuadratico
-}

multiSetToList :: Eq a => MultiSet a -> [(a, Int)]
multiSetToList (MS xs) = mapToList xs