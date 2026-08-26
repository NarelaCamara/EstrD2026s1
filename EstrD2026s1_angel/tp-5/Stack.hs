module Stack
  (Stack, emptyStk, isEmptyS, push, top, pop, lenS)    
where

data Stack a = S [a] Int 
  deriving Show       
    {- INV.REP.: para S xs n:
    * n es la cantidad de elementos de xs. 
    -}

emptyStk :: Stack a                 -- O(1)            
isEmptyS :: Stack a -> Bool         -- O(1)              
push     :: a -> Stack a -> Stack a -- O(1)          
top      :: Stack a -> a            -- O(1)    
pop      :: Stack a -> Stack a      -- O(1)        
lenS     :: Stack a -> Int          -- O(1)  

emptyStk          = S [] 0

isEmptyS (S xs _) = null xs 

push x (S xs i)   = S (x:xs) (i+1)

top (S xs _)      = head xs

pop (S xs i)      = S (tail xs) (i-1)

lenS (S _ i)      = i   

