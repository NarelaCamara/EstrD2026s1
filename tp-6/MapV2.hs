module MapV2 (
    MapV2,
    emptyM,
    assocM,
    lookupM,
    deleteM,
    keys,
    mapV2Ejemplo1,
    mapV2Ejemplo2,
    mapV2Ejemplo3
)
where
data MapV2 k v = M [(k,v)] deriving Show

{-
    INVARIANTE DE REPRENSENTACION:  lista de pares-clave valor con claves repetidas 
-}


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante
-}
emptyM :: MapV2 k v
emptyM = (M [])


{-
    Proposito: 
    PRECONDICION:   
    COSTO:    O(1) Constante
-}
assocM :: Eq k => k -> v -> MapV2 k v -> MapV2 k v
assocM c1 v1 (M xs) =  (M ((c1,v1):xs))

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(1) constante +  O(n) Lineal
-}


{-
    Proposito: 
    PRECONDICION:   El primer elemento que cumpla la condicion, el mas reciente trae
    COSTO:   O(n) Lineal
-}
lookupM :: Eq k => k -> MapV2 k v -> Maybe v
lookupM c (M xs) = buscar c xs 

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(n) Lineal
-}
buscar :: Eq k => k -> [(k, v)] -> Maybe v 
buscar c [] = Nothing
buscar c ((c1,v2):xs) = if c1 == c then (Just v2) else buscar c xs


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal
-}

deleteM :: Eq k => k -> MapV2 k v -> MapV2 k v
deleteM c1 (M xs) = (M (borrar c1 xs))

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(n) Lineal
-}
borrar :: Eq k => k -> [(k,v)] -> [(k,v)]
borrar c1 [] = []
borrar c1 ((c2,v2):xs) = if c1 == c2 then borrar c1 xs else (c2,v2) : borrar c1 xs

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal
-}
keys :: MapV2 k v -> [k]
keys (M []) = []
keys (M xs) = obtenerClaves xs


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal *  O(n) Lineal =  O(n^2) Cuadratico
-}
obtenerClaves:: [(k,v)] -> [k]
obtenerClaves [] = []
obtenerClaves ((c1,v1):xs) = if existIn c1 xs then  obtenerClaves xs else  c1 : obtenerClaves xs


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal +  O(1) Constante
-}
existIn:: Eq k => k -> [(k,v)] -> Bool
existIn c [] = False
existIn c ((c1,v1):xs) = c1 == c || existIn c xs


mapV2Ejemplo1 = (M [(1, "Valor 1"),(1, "Valor 667"), (2, "Valor 2"),(3, "Valor 3")])
mapV2Ejemplo3 = (M [(1, "Valor 666"),(1, "Valor 1"), (2, "Valor 8"),(4, "Valor 4")])


mapV2Ejemplo2 :: MapV2 String Int
mapV2Ejemplo2 = (M [("Clave 1", 1),("Clave 1", 666), ( "Clave 2", 2),("Clave 3", 3)])
