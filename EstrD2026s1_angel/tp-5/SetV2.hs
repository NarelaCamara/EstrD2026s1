module SetV2 
  (Set, emptyS, addS, belongs, sizeS, removeS, unionS, setToList)
where

data Set a = S [a]         Int
  -- Elementos   Cantidad de elementos
    {-INV.REP.: en S xs i 
     
      -}

emptyS    :: Set a                           -- O()               
addS      :: Eq a => a -> Set a -> Set a     -- O()               
belongs   :: Eq a => a -> Set a -> Bool      -- O()         
sizeS     :: Eq a => Set a -> Int            -- O()   
removeS   :: Eq a => a -> Set a -> Set a     -- O()           
unionS    :: Eq a => Set a -> Set a -> Set a -- O()          
setToList :: Eq a => Set a -> [a]            -- O()  

-- EFICIENCIA:
-- para todas las funciones n es la cantidad de elementos del set, que en esta implementación es igual a 'xs' e 'i'.

emptyS                        = S [] 0                                      -- O()
addS      x (S xs i)          = S (verSiAgrega x xs) (verSiAumenta x xs i)  -- O()                                                                 
belongs   x (S xs _)          = elem x xs                                   -- O()                                 
sizeS     (S _ i)             = i                                           -- O()       
removeS   x s                 = verSiRemueve x s                            -- O()   
unionS    (S xs i) (S xs' i') = S (unir xs xs') (length (unir xs xs'))      -- O()
setToList (S xs _)            = xs                                          -- O()   

--------------------------------------------------------------------------------------------------------------
verSiAgrega :: Eq a => a -> [a] -> [a] 
verSiAgrega x xs = if elem x xs then xs else x:xs
              
verSiAumenta :: Eq a => a -> [a] -> Int -> Int
verSiAumenta  x xs i = if elem x xs then i else i+1


----------------------------------------------------------------------------------------------------------------------

verSiRemueve :: Eq a => a -> Set a -> Set a
verSiRemueve x (S xs i) = if elem x xs -- O(N)
                            then S (remover x xs) (i-1) -- O(N)
                            else S xs i
                           

remover :: Eq a => a -> [a] -> [a]
remover x (x':xs) = if x==x' then xs else x': remover x xs
                

----------------------------------------------------------------------------------------------------------------------

unir :: Eq a => [a] -> [a] -> [a]
unir []     xs' = xs'
unir (x:xs) xs' = if elem x xs' then unir xs xs' else x : (unir xs xs')
                  