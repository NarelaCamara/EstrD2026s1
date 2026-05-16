{-- PRACTICA 7 --}

{-- 1. --}
{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n^2) Cuadratico

    heapSort::Ord a => [a] -> [a]
heapSort xs = toListPQ (createPQ xs)  

{-- Ejemplo de uso --}
heapSortEjemplo = heapSort [12,666,1,2,3,18,8]

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(n) Lineal  = 
-}

createPQ ::Ord a => [a] -> PriorityQueue a
createPQ [] = emptyPQ
createPQ (x:xs) = insertPQ x (createPQ xs)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(1) constante +   O(log n) logatirmo +  O(1) constante
-}
toListPQ ::Ord a => PriorityQueue a -> [a]
toListPQ pq = if isEmptyPQ pq then [] else (findMinPQ pq) : (toListPQ (deleteMinPQ pq) ) 


-}


{-- 2. --}
data Tree a = EmptyT | NodeT a (Tree a) (Tree a)
    deriving Show

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(1) Constante +  O(log n) logatirmo 
-}
belongsBST :: Ord a => a -> Tree a -> Bool
belongsBST _ EmptyT = False
belongsBST e (NodeT n t1 t2) = (e == n) || (belongsBST e (elegirRama (e < n) t1 t2)) 

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}

elegirRama:: Bool -> Tree a -> Tree a -> Tree a
elegirRama True t1 t2 = t1
elegirRama False t1 t2 = t2

{-- RAROO 
ejemploTreeBST = NodeT 12 (NodeT 8 EmptyT EmptyT) (NodeT 18 EmptyT EmptyT)

Porque este ejemplo no es un arbol bST, Ya que en los bst el root debe ser el menor de los nodos, y en este caso el root es 12, pero el nodo 8 es menor que el root, entonces no cumple con la propiedad de los bst.--}


{--Ejemplo de uso --}
ejemploTreeBST = NodeT 12 (NodeT 8 (NodeT 4 EmptyT EmptyT) (NodeT 10 EmptyT EmptyT)) (NodeT 18 (NodeT 16 EmptyT EmptyT) (NodeT 25 EmptyT EmptyT))
belongsBSTEjemplo = belongsBST 19 ejemploTreeBST

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante +  O(1) Constante +  O(1) Constante +  O(log n) logatirmo =  O(log n) logatirmo
-}

insertBST :: Ord a => a -> Tree a -> Tree a
insertBST e EmptyT = (NodeT e EmptyT EmptyT)
insertBST e (NodeT n t1 t2) = 
    if (e == n) then (NodeT n t1 t2) else (if (e < n) then (NodeT n (insertBST e t1) t2) else (NodeT n t1 (insertBST e t2)))

{--Ejemplo de uso --}
insertBSTEjemplo = insertBST 2 (insertBST 14 ejemploTreeBST)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
deleteBST :: Ord a => a -> Tree a -> Tree a
deleteBST e EmptyT = EmptyT
deleteBST e (NodeT n t1 t2) = if (e == n) then (refactor t1 t2) else (if (e < n) then (NodeT n (deleteBST e t1) t2) else (NodeT n t1 (deleteBST e t2)))


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
refactor :: Tree a -> Tree a -> Tree a
refactor EmptyT t2 = t2
refactor t1 EmptyT = t1 
refactor (NodeT e t11 t12) t2 = (NodeT e (refactor t11 t12) t2)

{--Ejemplo de uso --}
deleteBSTEjemplo = deleteBST 18 ejemploTreeBST


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
splitMinBST :: Ord a => Tree a -> (a, Tree a)
splitMinBST t = let min = (findMin t) in (min, (deleteBST min t))

{--Ejemplo de uso --}
splitMinBSTEjemplo = splitMinBST ejemploTreeBST

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
findMin::Ord a => Tree a -> a 
findMin (NodeT e EmptyT _) = e
findMin (NodeT e t1 _) = findMin t1 

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
splitMaxBST :: Ord a => Tree a -> (a, Tree a)
splitMaxBST t = let max = (findMax t) in (max,deleteBST max t)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
findMax::Ord a => Tree a -> a 
findMax (NodeT e EmptyT _) = e
findMax (NodeT e t1 _) = findMax t1 
