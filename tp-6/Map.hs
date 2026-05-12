module Map (
    Map,
    emptyM,
    assocM,
    lookupM,
    deleteM,
    keys,
    mapEjemplo
)
where
data Map k v = M [(k,v)] deriving Show


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante
-}
emptyM :: Map k v
emptyM = (M [])


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal
-}
assocM :: Eq k => k -> v -> Map k v -> Map k v
assocM c1 v1 (M xs) =  (M (associar c1 v1 xs))

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(1) constante +  O(n) Lineal
-}
associar :: Eq k => k -> v -> [(k, v)] ->[(k, v)] 
associar c1 v1 [] = [(c1, v1)]
associar c1 v1 ((c2,v2):xs) = if c1 == c2 then (c1, v1) : xs else (c2,v2) : associar c1 v1 xs


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal
-}
lookupM :: Eq k => k -> Map k v -> Maybe v
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

deleteM :: Eq k => k -> Map k v -> Map k v
deleteM c1 (M xs) = (M (borrar c1 xs))

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(n) Lineal
-}
borrar :: Eq k => k -> [(k,v)] -> [(k,v)]
borrar c1 [] = []
borrar c1 ((c2,v2):xs) = if c1 == c2 then xs else (c2,v2) : borrar c1 xs

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal
-}
keys :: Map k v -> [k]
keys (M []) = []
keys (M xs) = obtenerClaves xs


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal
-}
obtenerClaves:: [(k,v)] -> [k]
obtenerClaves [] = []
obtenerClaves ((c1,v1):xs) = c1 : obtenerClaves xs



mapEjemplo = (M [(1, "Valor 1"), (2, "Valor 2"),(3, "Valor 3")])
