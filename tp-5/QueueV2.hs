module Queue (
    Queue,
    emptyQ,
    isEmptyQ,
    enqueue,
    firstQ,
    dequeue
)
where
data Queue a = Q [a] [a] deriving Show
-- Ingresa-> 1 Ingresa-> 2 [2, 1]  sale->> 1 >> 2
{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
emptyQ :: Queue a
emptyQ = (Q [] [])

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
isEmptyQ :: Queue a -> Bool
isEmptyQ (Q _ []) = True
isEmptyQ (Q [] _) = True
isEmptyQ _ = False


{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
enqueue :: a -> Queue a -> Queue a 
enqueue x (Q fs bs) = Q (fs++[x]) (x:bs)


{--
    Proposito: 
    PRECONDICION:  Queue debe tener elementos
    COSTO: 
--}
firstQ :: Queue a -> a
firstQ (Q []) = error "firstQ: empty queue"
firstQ (Q (f:fs) bs) = f



{--
    Proposito: 
    PRECONDICION: Queue debe tener elementos
    COSTO: 
--}
dequeue :: Queue a -> Queue a
dequeue (Q []) = error "dequeue: empty queue"
dequeue (Q (f:fs) bs) = Q fs bs


{-- 
    Qué ventaja tiene esta representación de Queue con respecto a la que usa una sola lista?
    La eficiencia es mejor al ser todo de costo constante pero como negativa al poseer dos listas el costo es en memoria
 --}