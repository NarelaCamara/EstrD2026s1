--import SetV1
import SetV2
--import QueueV1
import QueueV2
import Stack
-- import QueueV3

--  Trabajo Práctico # 5- Set, Stack y Queue

-- 1. Cálculo de costos
-- Especificar el costo operacional de las siguientes funciones:

head' :: [a] -> a
head' (x:xs) = x
-- O(1) - la función tarda siempre lo mismo, no depende de la cantidad de elementos de la lista dada, es decir,
--        la lista puede tener uno, mil o un millón de elementos que va tarda siempre lo mismo,
--        "en entrar y sacar el primer elemento".                     

sumar :: Int -> Int
sumar x = x + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1
        --  \________________________________/
        --              O(1)
-- O(1) - hace nueve veces "+1", entonces 1x9 sigue siendo constante
                    
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)
-- O( n * # por recursión sobre el número dado)
--        O(n) + 1 por el caso base
-- O(n)                   

longitud :: [a] -> Int
longitud []     = 0
longitud (x:xs) = 1 + longitud xs
-- O( n * # por recursión sobre la lista dada, siendo n la cantidad de elementos de la lista dada
--        1 por hacer "+1
--        ) => n*1 = n
--        O(n) + 1 por el caso base
-- O(n)                

factoriales :: [Int] -> [Int]
factoriales []     = []
factoriales (x:xs) = factorial x : factoriales xs
-- O( n * # por recursión sobre la lista dada, siendo n la cantidad de elementos de la lista dada
--        m por el uso de "factorial"
--        ) => n*m = n*m
-- O(n*m) siendo n la cantidad de números de la lista dada y m el mayor número de la lista dada.                      

pertenece :: Eq a => a -> [a] -> Bool
pertenece n []     = False
pertenece n (x:xs) = n == x || pertenece n xs
-- O( n * # por recursión sobre la lista dada, siendo n la cantidad de elementos de la lista dada
--        1 por el uso de "=="
--        ) => n*1 = n*1
--        O(n) + 1 por el caso base
-- O(n)

sinRepetidos' :: Eq a => [a]-> [a]
sinRepetidos' [] = []
sinRepetidos' (x:xs) =
    if pertenece x xs
        then sinRepetidos' xs
        else x : sinRepetidos' xs 
-- O( n * # por recursión sobre la lista dada, siendo n la cantidad de elementos de la lista dada
--        m por el uso de "pertenece"
--        1 por el uso de ":"    
--        ) => n*m + n*1 = n * (m+1) => n * m 
--        como la lista que se le pasa a "pertenece" es la misma que la lista que se le pasa a "sinRepetidos"
--        n = m => n * n = n^2
--        O(n^2) + 1 por el caso base
-- O(n^2)

-- equivalente a (++)
append :: [a] -> [a] -> [a]
append [] ys     = ys
append (x:xs) ys = x : append xs ys
-- O( n * # por recursión sobre la lista dada, siendo n la cantidad de elementos de la lista dada
--        1 por el uso de ":"
--        ) => n*1 = n*1
--        O(n) + 1 por el caso base
-- O(n) siendo n la cantidad de elementos de la primer lista dada       

concatenar :: [String] -> String
concatenar []     = []
concatenar (x:xs) = x ++ concatenar xs
-- O( n * # por recursión sobre la lista de strings dada, siendo n la cantidad de strings de la lista dada
--        m por el uso de "++"
--        ) => n*m
--        en el peor caso posible se debe concatenar un único string, entonces n=m
--        O(n^2) + 1 por el caso base
-- O(n^2)              

takeN :: Int -> [a] -> [a]
takeN 0 xs     = [] -- O(1)
takeN n []     = [] -- O(1)
takeN n (x:xs) = x : takeN (n-1) xs
-- O( n * # por recursión sobre la lista dada, siendo n la cantidad de elementos de la lista dada
--        1 por el uso de ":"
--        ) -> n * 1 => n
--        O(n) + 1 por el caso base => O(n)
-- O( m * # por recursión sobre el número dado, siendo m el número dado
--        1 por hacer "-1"
--       ) -> m * 1 => m
--        O(m) + 1 por el caso base => O(m)
-- n + m 
-- O(mínimo entre n y m)
              
dropN :: Int -> [a] -> [a]
dropN 0 xs     = xs
dropN n []     = []
dropN n (x:xs) = dropN (n-1) xs
-- O( n * # por recursión sobre la lista dada, siendo n la cantidad de elementos de la lista dada
--        )  => n
--        O(n) + 1 por el caso base => O(n)
-- O( m * # por recursión sobre el número dado, siendo m el número dado
--        1 por hacer "-1"
--       ) -> m * 1 => m
--        O(m) + 1 por el caso base => O(m)
-- n + m 
-- O(mínimo entre n y m)              

partir :: Int -> [a] -> ([a], [a])
partir n xs = (takeN n xs, dropN n xs)
-- O (  O[min(n,m)] por el uso de "takeN"
--    + O[min(n,m)] por el uso de "dropN"
--   ) O[min(n,m)] + O[min(n,m)] = 2 O[min(n,m)] => O[min(n,m)]
-- O[min(n,m)]          

minimo :: Ord a => [a] -> a
minimo [x]    = x
minimo (x:xs) = min x (minimo xs)
-- O (n * # por recursión sobre la lista dada, siendo n la cantidad de elementos de la lista
--        1 por el uso de "min"
--        ) -> n * 1 = n
--       O(n) + 1 por el caso base
-- O(n)

sacar :: Eq a => a -> [a] -> [a]
sacar n []     = []
sacar n (x:xs) =
    if n == x   
        then xs
        else x : sacar n xs
-- O(n * # por recursión sobre la lista dada, siendo n la cantidad de elementos de la lista
--        ( 1 por el uso de "=="
--          + 1 por el uso de ":"
--        )) -> n * (1 + 1) = 2n => n 
--    O(n) del caso recursivo + O(1) por el caso base
-- O(n)

ordenar :: Ord a => [a] -> [a]
ordenar [] = []
orderar xs =
     let m = minimo xs 
         in m : ordenar (sacar m xs)
-- O(n * # por recursión sobre la lista dada, siendo n la cant de elementos de la lista
--       ( m por el uso de "minimo"
--         + x por el uso de "sacar"
--        )) -> n * (m + x)
--    como la lista que se le pasa a "minimo" y a "sacar" es la misma, entonces  m=x
--        m + x = m + m = 2m => m
--    y a su vez la lista que se le pasa a "minimo" y a "sacar" es la misma que la dada a "ordenar"
--    entonces n * n
-- O(n^2) + O(1) por el caso base
-- O(n^2)

-- 2. Set (conjunto)"
-- 2.2.a
losQuePertenecen :: Eq a => [a] -> Set a -> [a]
losQuePertenecen []     s = []
losQuePertenecen (x:xs) s = if belongs x s then x : losQuePertenecen xs s 
                                           else losQuePertenecen xs s 

sinRepetidos :: Eq a => [a] -> [a]
sinRepetidos xs = if null xs then []
                             else setToList (listToSet xs) 

listToSet :: Eq a => [a] -> Set a 
listToSet []     = error "lista vacía"
listToSet [x]    = addS x emptyS 
listToSet (x:xs) = addS x (listToSet xs)

data Tree a = EmptyT | NodeT a (Tree a) (Tree a)

unirTodos :: Eq a => Tree (Set a) -> Set a
unirTodos EmptyT          = emptyS
unirTodos (NodeT s ti td) = unionS s (unionS (unirTodos ti) (unirTodos td)) 

-- 3. Queue (cola)
lengthQ :: Queue a -> Int
lengthQ q = if isEmptyQ q
                then 0
                else 1 + lengthQ (dequeue q)

queueToList :: Queue a -> [a]
queueToList q = if isEmptyQ q
                then []
                else firstQ q : queueToList (dequeue q)

unionQ :: Queue a -> Queue a -> Queue a
unionQ q q' = if isEmptyQ q'
                then q
                else enqueue (firstQ q') (unionQ q (dequeue q'))
-------------------------------------------------------------------------
listToQ :: [a] -> Queue a
listToQ []     = emptyQ
listToQ (x:xs) = enqueue x (listToQ xs)

lista1a5 = [0,1,2,3,4,5]
lista6a10 = [6,7,8,9,10]

q5 = listToQ lista1a5
q10 = listToQ lista6a10
-----------------------------------------------------------------------

-- 4.  Stack (pila)
apilar :: [a] -> Stack a
apilar xs = 
    if null xs then emptyStk
               else apilarAux xs

apilarAux :: [a] -> Stack a 
apilarAux []     = error "lista vacía."
apilarAux (x:[]) = push x emptyStk
apilarAux (x:xs) = push x (apilar xs)
                
desapilar :: Stack a -> [a]
desapilar s = 
    if isEmptyS s then []
                  else top s : (desapilar (pop s))

insertarEnPos :: Int -> a -> Stack a -> Stack a
insertarEnPos n x s =
    if n > lenS s then error "la posicion dada es inválida en el stack."
                  else insertarEnPosStk n x s

insertarEnPosStk :: Int -> a -> Stack a -> Stack a                
insertarEnPosStk 0 x s = push x s
insertarEnPosStk n x s = push (top s) (insertarEnPos (n-1) x (pop s)) 