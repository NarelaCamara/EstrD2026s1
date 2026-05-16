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

ejemploTreeBST = NodeT 12 (NodeT 8 EmptyT EmptyT) (NodeT 18 EmptyT EmptyT)
belongsBSTEjemplo = belongsBST 19 ejemploTreeBST
