module PriorityQueueV2
  (PriorityQueue, emptyPQ, isEmptyPQ, insertPQ, findMinPQ, deleteMinPQ)
 where

data PriorityQueue a = PQ [a]
        {- INV. REP.: en PQ xs
            * el primer elemento de xs es el elemento de mayor prioridad en la PQ.

            OBS.: implementación Con listas ordenadas
        -}



emptyPQ :: PriorityQueue a
    -- PROP.: devolver una priority queue vacía.

isEmptyPQ   :: PriorityQueue a -> Bool
    -- PROP.: indicar si la priority queue está vacía.

insertPQ :: Ord a => a -> PriorityQueue a -> PriorityQueue a
    -- PROP.: insertar un elemento en la priority queue, según la prioridad que tenga.

findMinPQ :: Ord a => PriorityQueue a -> a
    -- PROP.:    devolver el elemento más prioriotario (el mínimo) de la priority queue.
    -- PRECOND.: la priority queue no puede estar vacía.

deleteMinPQ :: Ord a => PriorityQueue a -> PriorityQueue a
    -- PROP.:    devolver una priority queue sin el elemento más prioritario (el mínimo).
    -- PRECOND.: la priority queue no puede estar vacía.


emptyPQ              = PQ []                            -- O(1)
isEmptyPQ   (PQ xs)  = null xs                          -- O(1)
insertPQ  x (PQ xs)  = PQ (insertar x xs)               -- O(n) PEOR

findMinPQ   (PQ xs)  =                                  -- O(1) 
    if null xs then error "PQ vacia" 
               else head xs                

deleteMinPQ (PQ xs)  =                                  -- O(1)
    if null xs then error "PQ vacia" 
               else PQ (tail xs)

-- O(n * # por recursión sobre la lista dada, siendo n la cantidad de elementos de la lista
--   m # por el uso de "<"[O(1)] y "cons" [O(1)] sobre el resultado de la recursión
--  ) -> n * (1 + 1) => n * 2 => 2n => n
-- O(n) + O(1) por el caso base ya que hacer un cons es O(1)
-- O(n)
insertar :: Ord a => a -> [a] -> [a]
insertar x' []     = [x'] -- O(1)
insertar x' (x:xs) = if x'< x then x' : (x:xs) else x : insertar x' xs
                  --     O(1)        O(1)            O(