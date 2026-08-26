module Set
  (Set, emptyS, addS, belongs, sizeS, removeS, unionS, setToList)
where

data Set a = S [a]         Int
          -- Elementos   Cantidad de elementos
    {-INV.REP.: en S xs i 
     * i es la cantidad de elementos de xs.
      -}

emptyS    :: Set a                           -- O(1)               
addS      :: Eq a => a -> Set a -> Set a     -- O(n)               
belongs   :: Eq a => a -> Set a -> Bool      -- O(n)         
sizeS     :: Eq a => Set a -> Int            -- O(1)   
removeS   :: Eq a => a -> Set a -> Set a     -- O(n)           
unionS    :: Eq a => Set a -> Set a -> Set a -- O(n^2)            
setToList :: Eq a => Set a -> [a]            -- O(1)  

-- EFICIENCIA:
-- para todas las funciones n es la cantidad de elementos del set, que en esta implementación es igual a 'xs' e 'i'.

emptyS                        = S [] 0                                      -- O(1)
addS      x (S xs i)          = S (verSiAgrega x xs) (verSiAumenta x xs i)  -- O(n)                                                                 
belongs   x (S xs _)          = elem x xs                                   -- O(n)                                 
sizeS     (S _ i)             = i                                           -- O(1)       
removeS   x s                 = verSiRemueve x s                            -- O(n)   
unionS    (S xs i) (S xs' i') = S (unir xs xs') (length (unir xs xs'))      -- O(n*n')
setToList (S xs _)            = xs                                          -- O(1)   

--------------------------------------------------------------------------------------------------------------
-- O(n), siendo n la longitud de la lista dada, ya que hace 'elem' que es de orden lineal.
verSiAgrega :: Eq a => a -> [a] -> [a] 
verSiAgrega x xs = if elem x xs then xs else x:xs
                --    O(n)                   O(1) 

-- O(n), siendo n la longitud de la lista dada, ya que hace 'elem' que es de orden lineal.
verSiAumenta :: Eq a => a -> [a] -> Int -> Int
verSiAumenta  x xs i = if elem x xs then i else i+1
                      --    O(n)                O(1) 

-- elem -> pertenece
-- O(n * # recursión sobre la lista dada
--   1 # por '==' que es O(1)
--  ) -> n * (1 + 1) => 2n => n
-- peor caso posible recorre toda la lista.

----------------------------------------------------------------------------------------------------------------------
-- O(n), porque 'elem' y 'remover' son de O(N), siendo n la cantidad de elementos del set, ya que
--       se tiene que comparar el elemento dado con cada elemento del set. 
verSiRemueve :: Eq a => a -> Set a -> Set a
verSiRemueve x (S xs i) = if elem x xs -- O(N)
                            then S (remover x xs) (i-1) -- O(N)
                            else S xs i
                           
-- O(n * # por recursión sobre la lista dada
--    1 # por '==' y 'cons' que son de O(1).
--   ) -> n * 1 => n
-- O(n)
remover :: Eq a => a -> [a] -> [a]
remover x (x':xs) = if x==x' then xs else x': remover x xs
                 --    O(1)                O(1)

----------------------------------------------------------------------------------------------------------------------
-- O(n * # por recursión sobre la lista dada
--    m # por 'elem'[O(n')] y 'cons' que es de O(1).
--   ) -> n * m => n * (n' + 1)
-- O(n*n')
unir :: Eq a => [a] -> [a] -> [a]
unir []     xs' = xs'
unir (x:xs) xs' = if elem x xs' then unir xs xs' else x : (unir xs xs')
                --   O(n)                              O(1)          