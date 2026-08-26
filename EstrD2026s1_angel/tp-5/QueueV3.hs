module QueueV3 
  (Queue, emptyQ, isEmptyQ, enqueue, firstQ, dequeue)
where

data Queue a = Q [a] [a]      
    {- INV.REP.: para Q fs bs
      *  si fs se encuentra vacía, entonces la cola se encuentra vacía.

      OBS.: los elementos se quitan a través de fs y se agregan a través de bs
    -}

emptyQ   :: Queue a                  -- O(1)     
isEmptyQ :: Queue a -> Bool          -- O(1)   
enqueue  :: a -> Queue a -> Queue a  -- O(1)           
firstQ   :: Queue a -> a             -- O(1)       PARCIAL  
dequeue  :: Queue a -> Queue a       -- O(1 amort) PARCIAL    

emptyQ              = Q [] []                               -- O(1) -> constructores 

isEmptyQ  (Q fs _)  = null fs                               -- O(1) -> null es O(1) 

enqueue x (Q fs bs) = if null fs                            -- O(1) -> cons es O(1) 
            then Q (x:fs) [] else Q fs (x:bs)             

firstQ    (Q fs _)  = if null fs                            -- O(1) -> head es O(1)  
            then error "queue vacia" else head fs  

dequeue   (Q fs bs) = if null fs                             -- O(n amort)
            then error "queue vacia" else desencolar fs bs 
        

desencolar :: [a] -> [a] -> Queue a 
desencolar (_:[]) bs = Q (reversa bs) []                                                   
desencolar fs     bs = Q (tail fs) bs                                                               

esSingular :: [a] -> Bool
esSingular []     = False 
esSingular (x:xs) = null xs 

esSingular' :: [a] -> Bool 
esSingular' (_:xs) = null xs

reversa :: [a] -> [a]
reversa []     = []
reversa (x:xs) = reversa xs ++ [x]