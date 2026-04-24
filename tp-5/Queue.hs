module Queue (
    emptyQ,
    isEmptyQ,
    enqueue,
    firstQ,
    dequeue
)
where
data Queue a = Q [a] deriving Show


{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
emptyQ :: Queue a
emptyQ = (Q [])

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
isEmptyQ :: Queue a -> Bool
isEmptyQ (Q []) = True
isEmptyQ _ = False


{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
enqueue :: a -> Queue a -> Queue a 
enqueue x (Q []) = Q [x]
enqueue x (Q xs) = Q (xs ++ [x])


enqueue' :: a -> Queue a -> Queue a 
enqueue' x (Q []) = Q [x]
enqueue' x (Q xs) = Q (x:xs)

{--
    Proposito: 
    PRECONDICION:  Queue debe tener elementos
    COSTO: 
--}
firstQ :: Queue a -> a
firstQ (Q []) = error "firstQ: empty queue"
firstQ (Q (x:_)) = x

firstQ' :: Queue a -> a
firstQ' (Q []) = error "firstQ': empty queue"
firstQ' (Q (xs)) = lastElement xs


lastElement::[a] -> a
lastElement [x] = x
lastElement (x:xs) = lastElement xs

{--
    Proposito: 
    PRECONDICION: Queue debe tener elementos
    COSTO: 
--}
dequeue :: Queue a -> Queue a
dequeue (Q []) = error "dequeue: empty queue"
dequeue (Q (_:xs)) = Q xs

'dequeue' :: Queue a -> Queue a
'dequeue' (Q []) = error "'dequeue': empty queue"
'dequeue' (Q (xs)) = sinLast xs


sinLast::[a] -> [a]
sinLast [x] = x
sinLast (x:xs) = sinLast xs