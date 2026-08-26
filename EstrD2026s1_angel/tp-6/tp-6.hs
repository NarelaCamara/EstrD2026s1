--import PriorityQueueV1
import PriorityQueueV2
import MapV1
--import MapV2
--import MapV3

-- TP 6 - Priority Queue, Map y Multiset
-- 1. Priority Queue (cola de prioridad) 
-- 1.2 
heapSort :: Ord a => [a] -> [a]
heapSort xs = pqToList (listToPQ xs)

listToPQ :: Ord a => [a] -> PriorityQueue a 
listToPQ xs = if null xs then emptyPQ else listToPQAux xs 

listToPQAux :: Ord a => [a] -> PriorityQueue a 
listToPQAux []     = error "lista vacía."
listToPQAux (x:[]) = insertPQ x emptyPQ
listToPQAux (x:xs) = insertPQ x (listToPQAux xs)

pqToList :: Ord a => PriorityQueue a -> [a]
pqToList pq =
    if isEmptyPQ pq then []
                    else findMinPQ pq : pqToList (deleteMinPQ pq) 
                
-- 2. Map (Diccionario)
-- Ejercicio 3 
-- 1.
valuesM :: Ord k => Map k v -> [Maybe v]
valuesM m = valores (keys m) m 

valores :: Ord k => [k] -> Map k v -> [Maybe v]
valores []     _ = []
valores (k:ks) m = (lookupM k m) : valores ks m

-- 2.
todasAsociadas :: Ord k => [k] -> Map k v -> Bool
todasAsociadas []     _ = True
todasAsociadas (k:ks) m =
    case lookupM k m of
        Nothing -> False
        Just _  -> todasAsociadas ks m 

-- 3.
listToMap :: Ord k => [(k, v)] -> Map k v
listToMap kvs = if null kvs then emptyM else listToMapAux kvs

listToMapAux :: Ord k => [(k, v)] -> Map k v
listToMapAux []          = error "lista vacía."
listToMapAux ((k,v):[])  = assocM k v emptyM
listToMapAux ((k,v):kvs) = assocM k v (listToMapAux kvs)

-- 4. 
mapToList :: Ord k => Map k v -> [(k, v)]
mapToList m = mapToListAux (keys m) m

mapToListAux :: Ord k => [k] -> Map k v -> [(k, v)]
mapToListAux []     _ = []
mapToListAux (k:ks) m = (k, fromJust (lookupM k m)) : mapToListAux ks m  

fromJust :: Maybe a -> a
fromJust (Just x) = x 

-- 5.
agruparEq :: Ord k => [(k, v)] -> Map k [v]
agruparEq kvs = if null kvs then emptyM else agruparEqAux kvs 

agruparEqAux :: Ord k => [(k, v)] -> Map k [v]
agruparEqAux []          = error "lista vacía."
agruparEqAux ((k,v):[])  = assocM k [v] emptyM 
agruparEqAux ((k,v):kvs) = 
    case lookupM k (agruparEqAux kvs) of
        Nothing -> assocM k (v:[]) (agruparEqAux kvs)
        Just vs -> assocM k (v:vs) (agruparEqAux kvs)

-- 6.
incrementar :: Ord k => [k] -> Map k Int -> Map k Int
incrementar []     m = m
incrementar (k:ks) m =
    let mr = incrementar ks m in
        case lookupM k m of
            Nothing -> mr
            Just i  -> assocM k (i+1) mr

-- 7.
mergeMaps:: Ord k => Map k v -> Map k v -> Map k v
mergeMaps m m' = mergeListToMap (mapToList m) m' 

mergeListToMap :: Ord k => [(k,v)] -> Map k v -> Map k v
mergeListToMap []          m = m
mergeListToMap ((k,v):kvs) m = assocM k v (mergeListToMap kvs m)

-- Ejercicio 5
-- a.
indexar :: [a] -> Map Int a
indexar xs = if null xs then emptyM else indexarAux (length xs) (reverse xs) 

indexarAux :: Int -> [a] -> Map Int a
indexarAux _ []     = error "lista vacía."
indexarAux n (x:[]) = assocM n x emptyM
indexarAux n (x:xs) = assocM n x (indexarAux (n-1) xs) 

-- b.
ocurrencias :: String -> Map Char Int
ocurrencias s = if null s then emptyM else ocurrenciasAux s

ocurrenciasAux :: String -> Map Char Int
ocurrenciasAux (c:[]) = assocM c 1 emptyM
ocurrenciasAux (c:cs) =
    let m = ocurrenciasAux cs in
     case lookupM c mr of
        Nothing -> assocM c 1 m
        Just i  -> assocM c (i+1) m

-- 3. MultiSet (multiconjunto)
-- Ejercicio 6
-- 2.
ocurrencesMS :: String -> MultiSet Char
ocurrencesMS s = if null s then emptyMS else ocurrencesMSAux s 

ocurrencesMSAux :: String -> MultiSet Char
ocurrencesMSAux (c:[]) = addMS c emptyMS 
ocurrencesMSAux (c:cs) = addMS c (ocurrencesMSAux cs)