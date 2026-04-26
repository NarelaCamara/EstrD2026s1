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
    Proposito: Devuelve un Queue vacío
    PRECONDICION: ninguna
    COSTO: O(1) Constante
--}
emptyQ :: Queue a
emptyQ = (Q [] [])

{--
    Proposito: Verifica si el Queue está vacío
    PRECONDICION: ninguna
    COSTO: O(1) Constante
--}
isEmptyQ :: Queue a -> Bool
isEmptyQ (Q _ []) = True
isEmptyQ (Q [] _) = True
isEmptyQ _ = False


{--
    Proposito: Añade un elementoal Queue
    PRECONDICION: ninguna
    COSTO: O(1) Constante
--}
enqueue :: a -> Queue a -> Queue a 
enqueue x (Q fs bs) = Q (fs++[x]) (x:bs)


{--
    Proposito: Devuelve el primer elemento del Queue
    PRECONDICION:  Queue debe tener elementos
    COSTO: O(1) Constante
--}
firstQ :: Queue a -> a
firstQ (Q []) = error "firstQ: empty queue"
firstQ (Q (f:fs) bs) = f



{--
    Proposito: Elimina el primer elemento del Queue
    PRECONDICION: Queue debe tener elementos
    COSTO: O(1) Constante
--}
dequeue :: Queue a -> Queue a
dequeue (Q []) = error "dequeue: empty queue"
dequeue (Q (f:fs) bs) = Q fs bs


{-- 
    Qué ventaja tiene esta representación de Queue con respecto a la que usa una sola lista?
    La eficiencia es mejor al ser todo de costo constante pero como negativa al poseer dos listas el costo es en memoria
 --}