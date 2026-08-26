module PriorityQueue
  (PriorityQueue, emptyPQ, isEmptyPQ, insertPQ, findMinPQ, deleteMinPQ)
 where

data PriorityQueue a = PQ [a]
        {- INV. REP.: 
            * #

            OBS.: implementación con listas arbitrarias
                 el costo de findMinPQ y deleteMinPQ es O(n)
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


emptyPQ              = PQ []                          -- O(1)
isEmptyPQ   (PQ xs)  = null xs                        -- O(1)
insertPQ  x (PQ xs)  = PQ (x:xs)                      -- O(1)

findMinPQ   (PQ xs)  = if null xs                     -- O(n)
                then error "PQ vacia" else minimum xs  
                --                           O(n)

deleteMinPQ (PQ xs)  = if null xs                     -- O(n)
                then error "PQ vacia" else PQ (borrarMin xs)  
                --                              O(n)     

-- O(n + # siendo n la longitud de la lista dada para 'minimum'
--   m # sindo m la longitud de la lista dada para 'borrarM' 
--   ) -> n + m
--   en este caso n y m son iguales ya que se trata de la misma lista.
--   n + n => 2 * n => n 
-- O(n)
borrarMin :: Ord a => [a] -> [a] 
borrarMin xs = borrarM (minimum xs) xs 
             --  O(n)     O(n)
        
-- O(n * # por recursión sobre la lista dada
--   m # por '=='[O(1)] y 'cons'[O(1)]
--   n * (1 + 1) => n => 
--  O(n)
borrarM :: Eq a => a -> [a] -> [a]
borrarM _  []     = []
borrarM x' (x:xs) = if x'==x then xs else x : borrarM x' xs
                 --    O(1)                 O(1)


