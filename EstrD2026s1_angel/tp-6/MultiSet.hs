module MultiSet
  (MultiSet, emptyMS, addMS, ocurrencesMS, unionMS, intersectionMS, multiSetToList)
 where

import MapV3

data MultiSet a = MS (Map a Int)

emptyMS :: MultiSet a
    -- Propósito: denota un multiconjunto vacío.

addMS :: Ord a => a -> MultiSet a -> MultiSet a
    -- Propósito: dados un elemento y un multiconjunto, agrega una ocurrencia de ese elemento al multiconjunto.

ocurrencesMS :: Ord a => a -> MultiSet a -> Int
    --Propósito: dados un elemento y un multiconjunto indica la cantidad de apariciones de ese elemento en el multiconjunto.

unionMS :: Ord a => MultiSet a -> MultiSet a -> MultiSet a --(opcional)
    -- Propósito: dados dos multiconjuntos devuelve un multiconjunto con todos los elementos de ambos multiconjuntos.

intersectionMS :: Ord a => MultiSet a -> MultiSet a -> MultiSet a --(opcional)
    --Propósito: dados dos multiconjuntos devuelve el multiconjunto de elementos que ambos multiconjuntos tienen en común.

multiSetToList :: Ord a => MultiSet a -> [(a, Int)]
    -- Propósito: dado un multiconjunto devuelve una lista con todos los elementos del conjunto y su cantidad de ocurrencias.


emptyMS                       = MS emptyM             -- O()
addMS        x (MS m)         = MS (agregar x m)      -- O() 
ocurrencesMS x (MS m)         = buscar x m            -- O() 
unionMS        (MS m) (MS m') = MS (unionMaps m m')   -- O()                               
intersectionMS (MS m) (MS m') = MS (interscMaps m m') -- O()                             
multiSetToList (MS m)         = mapToList m           -- O() 


-------------------------------------------------------------------------------------
agregar :: Ord a => a -> Map a Int -> Map a Int 
agregar x m = case lookupM x m of 
                Nothing -> assocM x 1 m  
                Just i  -> assocM x (i+1) m

-------------------------------------------------------------------------------------
buscar :: Ord a => a -> Map a Int -> Int 
buscar x m = case lookupM x m of
              Nothing -> 0
              Just i  -> i   

-------------------------------------------------------------------------------------
unionMaps :: Ord a => Map a Int -> Map a Int -> Map a Int 
unionMaps m m' = unir (mapToList m) m' 
 
unir :: Ord a => [(a, Int)] -> Map a Int -> Map a Int
unir []          m' = m'
unir ((k,v):kvs) m' = let mapR = unir kvs m' 
                        in case lookupM k mapR of 
                            Nothing -> assocM k v mapR
                            Just i  -> assocM k (i+v) mapR

-------------------------------------------------------------------------------------
interscMaps :: Ord a => Map a Int -> Map a Int -> Map a Int 
interscMaps m m' = intersec (mapToList m) m'
          
intersec :: Ord a => [(a, Int)] -> Map a Int -> Map a Int
intersec []          m' = emptyM
intersec ((k,v):kvs) m' = let mapR = intersec kvs m' 
                           in case lookupM k m' of 
                               Nothing -> mapR
                               Just i  -> assocM k (i+v) mapR

-- ============ AUX de las AUX ====================== 
mapToList :: Ord k => Map k v -> [(k, v)]
mapToList m = mapALista (keys m) m                

mapALista :: Ord k => [k] -> Map k v -> [(k, v)]
mapALista []     m = []
mapALista (k:ks) m = (k, valAsoc k m) : mapALista ks m 

valAsoc :: Ord k => k -> Map k v -> v 
valAsoc k m = fromJust (lookupM k m) 
           --           
fromJust :: Maybe b -> b
fromJust (Just x) = x