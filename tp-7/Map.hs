module Map (
    Map,
    emptyM,
    assocM,
    lookupM,
    deleteM,
    keys,
    mapEjemplo1,
)
where
data Map k v = M ( Tree (k,v)) deriving Show


data Tree (k,v) = EmptyT | NodeT (k,v) (Tree (k,v)) (Tree (k,v))
    deriving Show


{-
    INVARIANTE DE REPRENSENTACION: Esta compuesto arboles Tree de clave y valor, y es un BST
-}

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante
-}
emptyM :: Map k v
emptyM = (M EmptyT)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:    O(log k) logatirmo
-}
assocM :: Ord k => k -> v -> Map k v -> Map k v
assocM c1 v1 (M t) =  (M (agregarArbol c1 v1 t))

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante +  O(1) Constante +  O(log n) logatirmo +  O(1) Constante
-}
agregarArbol ::  Ord k => k -> v -> Tree (k,v) -> Tree (k,v)
agregarArbol c1 v1 EmptyT = (NodeT (c1,v1) EmptyT EmptyT)
agregarArbol c1 v1 (NodeT (c,v) t1 t2) = if c == c1 then (NodeT (c1,v1) t1 t2) else agregarArbol c1 v1 (elegirRama (c1 < c) t1 t2)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
elegirRama:: Bool -> Tree a -> Tree a -> Tree a
elegirRama True t1 t2 = t1
elegirRama False t1 t2 = t2

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(1) constante +  O(n) Lineal
-}


{-
    Proposito: 
    PRECONDICION:   
    COSTO:    O(log n) logatirmo
-}
lookupM :: Ord k => k -> Map k v -> Maybe v
lookupM c (M ts) = buscar c ts 

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(1) Constante +  O(log n) logatirmo
-}
buscar :: Eq k => k -> Tree (k, v) -> Maybe v 
buscar c EmptyT = Nothing
buscar c (NodeT (c1, v1) t1 t2) = if c1 == c then (Just v1) else buscar c (elegirRama (c < c1) t1 t2)


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
    COSTO:   O(1) constante +   O(log k) logatirmo (Amortizado?)
-}
borrar :: Ord k => k -> Tree (k,v) -> Tree (k,v)
borrar c1 EmptyT = EmptyT
borrar c1 (NodeT (c2,v2) t1 t2) = if c1 == c2 then (refactor t1 t2) else if (c1 < c2) then (NodeT (c2,v2) (borrar c1 t1 ) t2 ) else (NodeT (c2,v2) t1 (borrar c1 t2 ) )

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
refactor :: Tree a -> Tree a -> Tree a
refactor EmptyT t2 = t2
refactor t1 EmptyT = t1 
refactor (NodeT e t11 t12) t2 = (NodeT e (refactor t11 t12) t2)

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
obtenerClaves:: Tree(k,v) -> [k]
obtenerClaves EmptyT = []
obtenerClaves ( NodeT (c1,v1) t1 t2) = c1 : (obtenerClaves t1) ++ (obtenerClaves t2)



mapEjemplo1 = (M (NodeT (2, "Valor 2") (NodeT (1, "Valor 1") EmptyT EmptyT) (NodeT (3, "Valor 3") EmptyT EmptyT)))

