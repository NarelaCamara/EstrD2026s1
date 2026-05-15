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
    Proposito: Devuelve una Stack vacia
    PRECONDICION: ninguna
    COSTO: O(1) Constante
--}

emptyST :: Stack a
emptyST = (Stack [] 0)

{--
    Proposito: Determina si una Stack esta vacia
    PRECONDICION: ninguna
    COSTO: O(1) Constante
--}
isEmptyST :: Stack a -> Bool
isEmptyST (Stack [] _) = True
isEmptyST _ = False

{--
    Proposito: Agrega un elemento a la Stack
    PRECONDICION: ninguna
    COSTO: O(1) Constante
--} 
push :: a -> Stack a -> Stack a
push x (Stack xs n) = (Stack (x:xs) (n+1) )

{--
    Proposito: Devuelve el primer elemento de la Stack
    PRECONDICION:  Stack debe tener elementos
    COSTO: O(1) Constante
--} 
top :: Stack a -> a
top (Stack (x:xs) _) = x 

{--
    Proposito: Elimina el primer elemento de la Stack
    PRECONDICION:  Stack debe tener elementos
    COSTO: O(1) Constante
--} 
pop :: Stack a -> Stack a
pop (Stack [] _) = error "pop: empty stack"
pop (Stack (x:xs) n) = (Stack xs (n-1))

{--
    Proposito: Devuelve la longitud de la Stack
    PRECONDICION: ninguna
    COSTO: O(1) Constante
--} 
lenS :: Stack a -> Int
lenS  (Stack xs n) = n