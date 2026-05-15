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
isEmptyQ (Q [] []) = True
isEmptyQ _ = False

{--
    Proposito: Añade un elemento al Queue
    PRECONDICION: ninguna
    COSTO: O(1) Amortizado
    INVARIANTE: si fs está vacía, entonces bs también debe estar vacía
--}
enqueue :: a -> Queue a -> Queue a 
enqueue x (Q [] []) = Q [x] []
enqueue x (Q fs bs) = Q fs (x:bs)

normalize :: Queue a -> Queue a
normalize (Q [] bs) = Q (reverse bs) []
normalize q = q


{--
    Proposito: Devuelve el primer elemento del Queue
    PRECONDICION:  Queue debe tener elementos
    COSTO: O(1) Amortizado
--}
firstQ :: Queue a -> a
firstQ q = case normalize q of
    Q [] [] -> error "firstQ: empty queue"
    Q (f:_) _ -> f




{--
    Proposito: Elimina el primer elemento del Queue
    PRECONDICION: Queue debe tener elementos
    COSTO: O(1) Amortizado
--}
dequeue :: Queue a -> Queue a
dequeue q = case normalize q of
    Q [] [] -> error "dequeue: empty queue"
    Q (_:fs) bs -> normalize (Q fs bs)

{-- 
    Qué ventaja tiene esta representación de Queue con respecto a la que usa una sola lista?
    Una lista simple con cola y dequeue en una sola lista puede ser O(n) en el peor caso,
    porque agregar al final (`snoc`) o eliminar del frente puede requerir recorrer la lista.

    Con dos listas:
      - `fs` guarda los elementos del frente en orden de salida
      - `bs` guarda los elementos nuevos en orden de llegada, pero invertidos

    Ejemplo:
      emptyQ = Q [] []
      enqueue 1 emptyQ = Q [1] []
      enqueue 2 (Q [1] []) = Q [1] [2]
      enqueue 3 (Q [1] [2]) = Q [1] [3,2]

    Ahora `firstQ` devuelve 1 directamente desde `fs`.
    Al hacer `dequeue`:
      dequeue (Q [1] [3,2]) = Q [] [3,2]  -- se normaliza a Q [2,3] []
    La siguiente salida será 2 sin recorrer toda la cola.

    Ventaja: la mayoría de las operaciones son O(1) amortizado,
    porque el costo de invertir `bs` se paga solo cuando `fs` se vacía,
    en vez de pagar ese costo en cada inserción o eliminación.
 --}

