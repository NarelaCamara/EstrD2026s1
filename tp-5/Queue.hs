module Queue (
    Queue,
    emptyQ,
    isEmptyQ,
    enqueue,
    firstQ,
    dequeue
)
where
data Queue a = Q [a] deriving Show
-- Ingresa-> 1 Ingresa-> 2  sale->> 1 >> 2

{--
    Proposito: Devuelve una cola vacia
    PRECONDICION: ninguna
    COSTO: O(1) Constante, ya que es solo una operacion.
--}
emptyQ :: Queue a
emptyQ = (Q [])

{--
    Proposito: Determina si una cola esta vacia
    PRECONDICION: ninguna
    COSTO: O(1) Constante, ya que es solo una operacion.
--}
isEmptyQ :: Queue a -> Bool
isEmptyQ (Q []) = True
isEmptyQ _ = False


{--
    Proposito: Agrega un elemento a la cola
    PRECONDICION: ninguna
    COSTO: O(1) Constante, ya que es solo una operacion.
--}
enqueue :: a -> Queue a -> Queue a 
enqueue x (Q []) = Q [x]
enqueue x (Q xs) = Q (xs ++ [x])


{--
    Proposito: Agrega un elemento a la cola
    PRECONDICION: ninguna
    COSTO: O(1) Constante, ya que es solo una operacion.
--}
enqueue' :: a -> Queue a -> Queue a 
enqueue' x (Q []) = Q [x]
enqueue' x (Q xs) = Q (x:xs)

{--
    Proposito: Devuelve el primer elemento de la cola
    PRECONDICION:  Queue debe tener elementos
    COSTO: O(1) Constante, ya que es solo una operacion.
--}
firstQ :: Queue a -> a
firstQ (Q []) = error "firstQ: empty queue"
firstQ (Q (x:_)) = x

{--
    Proposito: Devuelve el primer elemento de la cola
    PRECONDICION:  Queue debe tener elementos
    COSTO: O(1) + O(n) Lineal, ya que debe recorrer toda la lista para encontrar el ultimo elemento.
--}

firstQ' :: Queue a -> a
firstQ' (Q []) = error "firstQ': empty queue"
firstQ' (Q (xs)) = lastElement xs


lastElement::[a] -> a
lastElement [x] = x
lastElement (x:xs) = lastElement xs

{--
    Proposito: devuelve un queue sin el primer elemento
    PRECONDICION: Queue debe tener elementos
    COSTO: O(1) Constante, ya que es solo una operacion.
--}
dequeue :: Queue a -> Queue a
dequeue (Q []) = error "dequeue: empty queue"
dequeue (Q (_:xs)) = Q xs

{--
    Proposito: devuelve un queue sin el primer elemento
    PRECONDICION: Queue debe tener elementos
    COSTO: O(n) Lineal, ya que debe recorrer la lista para quitar el ultimo elemento
--}
dequeue' :: Queue a -> Queue a
dequeue' (Q []) = error "dequeue': empty queue"
dequeue' (Q (xs)) = Q (sinLast xs)


sinLast::[a] -> [a]
sinLast [x] = []
sinLast (x:xs) = x : sinLast xs