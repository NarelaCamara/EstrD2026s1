module QueueV2 
  (Queue, emptyQ, isEmptyQ, enqueue, firstQ, dequeue)
where

data Queue a = Q [a]  
  {- INV. REP.:
    - #
    OBS: Los elementos se encolan por delante de la lista y se quitan por el final.
    -}

emptyQ   :: Queue a                  -- O(1)        
isEmptyQ :: Queue a -> Bool          -- O(1) 
enqueue  :: a -> Queue a -> Queue a  -- O(1) MEJOR           
firstQ   :: Queue a -> a             -- O(n) PARCIAL / PEOR
dequeue  :: Queue a -> Queue a       -- O(n) PEOR rendimiento, se MEJORO la parcialidad.


emptyQ = Q []

isEmptyQ (Q xs) = null xs 

enqueue x (Q xs) = Q (x:xs)

firstQ (Q xs) = 
    if null xs then error "la cola no tiene elemenetos."
               else elUltimo xs 

dequeue (Q xs) =
    if null xs then error "la cola no tiene elemenetos."
               else Q (desencolarUltimo xs) 

----------------------------------------------
-- O(n * # por recursión sobre la lista dada, siendo n la cantidad de elementos de la lista
--         1 por abrir por PM
--         ) -> n * 1 = n
-- O(n) + O(1) por el caso base
-- O(n)
elUltimo :: [a] -> a 
elUltimo []     = error "lista vacía."
elUltimo (x:[]) = x -- O(1)
elUltimo (_:xs) = elUltimo xs

----------------------------------------------------
-- O(n * # por recursión sobre la lista dada, siendo n la cantidad de elementos de la lista
--         1 por el uso de ":"
--         ) -> n * 1 = n
-- O(n) + O(1) por el caso base
-- O(n)
desencolarUltimo :: [a] -> [a]
desencolarUltimo (x:[]) = []  -- O(1)
desencolarUltimo (x:xs) = x : desencolarUltimo xs
