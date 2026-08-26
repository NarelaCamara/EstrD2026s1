module SetV1
  (Set, emptyS, addS, belongs, sizeS, removeS, unionS, setToList)
where

data Set a = S [a]         (Int)
     -- Elementos   Cantidad de elementos
         {- INV.REP.: en S xs i 
            * i es la cantidad de elementos no repetidos de xs.
        -}

emptyS    :: Set a                           -- O()        
addS      :: Eq a => a -> Set a -> Set a     -- O()                    
belongs   :: Eq a => a -> Set a -> Bool      -- O()                  
sizeS     :: Eq a => Set a -> Int            -- O()            
removeS   :: Eq a => a -> Set a -> Set a     -- O()                    
unionS    :: Eq a => Set a -> Set a -> Set a -- O()                        
setToList :: Eq a => Set a -> [a]            -- O()            

emptyS                        = S [] 0                                        -- O()
addS      x (S xs i)          = S (x:xs) (verSiAumenta x xs i)                -- O()
belongs   x (S xs _)          = elem x xs                                     -- O()
sizeS     (S _ i)             = i                                             -- O()              
removeS   x s                 = verSiRemueve x s                              -- O()             
unionS    (S xs _) (S xs' _)  = S (xs++xs') ( length (sinRepetidos (xs++xs'))) -- O()                                                
setToList (S xs _)            = sinRepetidos xs                               -- O() 

--------------------------------------------------------------------------------------------------------------
verSiAumenta :: Eq a => a -> [a] -> Int -> Int
verSiAumenta  x xs i = if elem x xs then i else i+1

----------------------------------------------------------------------------------------------------------------------

verSiRemueve :: Eq a => a -> Set a -> Set a
verSiRemueve x (S xs i) = if elem x xs
                            then S (remover x xs) (i-1)
                            else S xs i

remover :: Eq a => a -> [a] -> [a]
remover x (x':xs) = if x==x' then remover x xs else x': remover x xs

sinRepetidos :: Eq a => [a] -> [a]
sinRepetidos [] = []
sinRepetidos (x:xs) = if elem x (sinRepetidos xs) 
                       then sinRepetidos xs
                       else x : sinRepetidos xs