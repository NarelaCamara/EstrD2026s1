
{-- PRACTICA 2 --}

{-- 1. --}

{-- Recursion sobre listas--}

{-- 1. --}

{-- PRECOND: La lista debe ser de numeros enteros --}

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

{-- Ejemplo de uso --}
sumatoriaEjemplo = sumatoria [1, 2, 3, 4, 5] 


{-- 2. --}

{-- PRECOND: La lista puede ser de cualquier tipo --}

longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

{-- Ejemplo de uso --}  
longitudEjemplo = longitud [1, 2, 3, 4, 5] 

{-- 3. --}
{-- PRECOND: La lista debe ser de numeros enteros --}

sucesores :: [Int] -> [Int]
sucesores [] = []
sucesores (x:xs) = (x + 1) : sucesores xs

{-- Ejemplo de uso --}  
sucesoresEjemplo = sucesores [1, 2, 3, 4, 5]

{-- 4. --}
{-- PRECOND: La lista debe ser de tipo Bool --}
conjuncion :: [Bool] -> Bool
conjuncion [] = False
conjuncion (x:xs) = x && conjuncion xs

{-- Ejemplo de uso --}
conjuncionEjemplo = conjuncion [True, True, False, True]

{-- 5. --}
{-- PRECOND: La lista debe ser de tipo Bool --}
disyuncion :: [Bool] -> Bool
disyuncion [] = False
disyuncion (x:xs) = x || disyuncion xs

{-- Ejemplo de uso --}
disyuncionEjemplo = disyuncion [False, False, False, True]

{-- 6. --}
{-- PRECOND: La lista debe ser de listas --}
aplanar:: [[a]] -> [a]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

{-- Ejemplo de uso --}
aplanarEjemplo = aplanar [[1, 2], [3, 4], [5, 6]]

{-- 7. --}
{-- PRECOND: La lista puede ser de cualquier tipo que se pueda comparar --}
pertenece :: Eq a => a -> [a] -> Bool
pertenece _ [] = False
pertenece e (x:xs) = (e == x) || pertenece e xs

{-- Ejemplo de uso --}  
perteneceEjemplo = pertenece 3 [1, 2, 3, 4, 5]


{-- 8. --}
{-- PRECOND:  La lista puede ser de cualquier tipo que se pueda comparar --}

apariciones :: Eq a => a -> [a] -> Int
apariciones _ [] = 0
apariciones e (x:xs) = if (e == x) then 1 + apariciones e xs  else apariciones e xs

{-- 9. --}
{--  PRECOND:  La lista solo puede ser de numeros enteros --}

losMenoresA :: Int -> [Int] -> [Int]
losMenoresA n [] = []
losMenoresA n (x:xs) =  if x > n then x : losMenoresA n xs else losMenoresA n xs


{-- 10. --}
{-- PRECOND:  La lista solo debe ser de listas --}
lasDeLongitudMayorA :: Int -> [[a]] -> [[a]]
lasDeLongitudMayorA n [] = []
lasDeLongitudMayorA n (x:xs) =  if (longitud x) > n  then x : lasDeLongitudMayorA n xs else lasDeLongitudMayorA n xs


{-- 11. --}
agregarAlFinal :: [a] -> a -> [a]
agregarAlFinal [] a = [a]
agregarAlFinal (x:xs) a = x : agregarAlFinal xs a

{-- 12. --}
agregar :: [a] -> [a] -> [a]
agregar l1 l2 = l1 ++ l2

{-- 13. --}
reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = agregarAlFinal (reversa xs) x

{-- 14. --}
zipMaximos:: [Int] -> [Int] -> [Int]
zipMaximos l1 [] = l1
zipMaximos [] l2 = l2
zipMaximos [] [] = []
zipMaximos (x:xs) (l:ls) = (if x > l then x else l) : zipMaximos xs ls


{-- 15. --}
elMinimo :: Ord a => [a] -> a 
elMinimo [] = error "No puede ser una lista vacia"
elMinimo (x:[]) = x
elMinimo (x:xs) = if x > primerElemento xs then elMinimo (x: sinPrimerElemento xs) else elMinimo xs


primerElemento:: [a] -> a
primerElemento (x:[]) = x
primerElemento (x:xs) = x


sinPrimerElemento :: [a] -> [a]
sinPrimerElemento (x:[]) = []
sinPrimerElemento (x:xs) = xs


{-- 2. --}

{-- Recursion sobre numeros --}

{-- 1. --}
{-- 2. --}
{-- 3. --}
{-- 4. --}
{-- 5. --}


{-- 3. --}

{-- Registros --}

{-- 1. --}
{-- 2. --}
{-- 3. --}