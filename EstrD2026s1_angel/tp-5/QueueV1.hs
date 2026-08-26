module QueueV1 
  (Queue, emptyQ, isEmptyQ, enqueue, firstQ, dequeue)
where

data Queue a = Q [a] 
    {- INV. REP.:
    - #
    OBS: Los elementos se encolan por el final de la lista y se desencolan por delante.
    -}

emptyQ   :: Queue a                 -- O(1)           
isEmptyQ :: Queue a -> Bool         -- O(1)
enqueue  :: a -> Queue a -> Queue a -- O(n)           
firstQ   :: Queue a -> a            -- O(1) PARCIAL      
dequeue  :: Queue a -> Queue a      -- O(1) PARCIAL

emptyQ = Q []

isEmptyQ (Q xs) = null xs 

enqueue x (Q xs) = Q (encolarAlFinal x xs)

firstQ (Q xs) = 
    if null xs then error "la cola no tiene elementos"
               else head xs

dequeue (Q xs) = 
    if null xs then error "la cola no tiene elementos"
               else Q (tail xs)
               
------------------------------------------------------------------------------------------------------
-- O(n * # por recursión sobre la lista dada, siendo n la cantidad de elementos de la lista
--   1 # por "cons"[O(1)]
--   ) -> n * 1 => n
-- O(n) 
encolarAlFinal :: a -> [a] -> [a]
encolarAlFinal e []     = e:[] 
encolarAlFinal e (x:xs) = x : encolarAlFinal e xs 