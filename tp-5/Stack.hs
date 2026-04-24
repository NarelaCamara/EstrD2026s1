module Stack(
    Stack,
    emptyST,
    isEmptyST,
    push,
    top,
    pop,
    lenS)
where 

data Stack a = Stack [a] Int  deriving Show  
-- Ingresa-> 1 Ingresa-> 2  sale->> 2 >> 1

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}

emptyST :: Stack a
emptyST = (Stack [] 0)

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
isEmptyST :: Stack a -> Bool
isEmptyST (Stack [] _) = True
isEmptyST _ = False

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--} 
push :: a -> Stack a -> Stack a
push x (Stack xs n) = (Stack (x:xs) (n+1) )

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--} 
top :: Stack a -> a
top (Stack (x:xs) _) = x 

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--} 
pop :: Stack a -> Stack a
pop (Stack (x:xs) n) = (Stack xs (n-1))

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--} 
lenS :: Stack a -> Int
lenS  (Stack xs n) = n