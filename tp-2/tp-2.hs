
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

{-- Ejemplo de uso --}

aparicionesEjemplo = apariciones 3 [1, 2, 3, 4, 5, 3, 3]


{-- 9. --}
{--  PRECOND:  La lista solo puede ser de numeros enteros --}

losMenoresA :: Int -> [Int] -> [Int]
losMenoresA n [] = []
losMenoresA n (x:xs) =  if x > n then x : losMenoresA n xs else losMenoresA n xs

{-- Ejemplo de uso --}

losMenoresAEjemplo = losMenoresA 3 [1, 2, 3, 4, 5]


{-- 10. --}
{-- PRECOND:  La lista solo debe ser de listas --}
lasDeLongitudMayorA :: Int -> [[a]] -> [[a]]
lasDeLongitudMayorA n [] = []
lasDeLongitudMayorA n (x:xs) =  if (longitud x) > n  then x : lasDeLongitudMayorA n xs else lasDeLongitudMayorA n xs

{-- Ejemplo de uso --}
lasDeLongitudMayorAEjemplo = lasDeLongitudMayorA 2 [[1, 2], [3, 4, 5], [6, 7]]

{-- 11. --}
agregarAlFinal :: [a] -> a -> [a]
agregarAlFinal [] a = [a]
agregarAlFinal (x:xs) a = x : agregarAlFinal xs a

{-- Ejemplo de uso --}
agregarAlFinalEjemplo = agregarAlFinal [1, 2, 3] 4

{-- 12. --}
agregar :: [a] -> [a] -> [a]
agregar l1 l2 = l1 ++ l2

{-- Ejemplo de uso --}
agregarEjemplo = agregar [1, 2, 3] [4, 5, 6]

{-- 13. --}
reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = agregarAlFinal (reversa xs) x

{-- Ejemplo de uso --}
reversaEjemplo = reversa [1, 2, 3, 4, 5]

{-- 14. --}
zipMaximos:: [Int] -> [Int] -> [Int]
zipMaximos l1 [] = l1
zipMaximos [] l2 = l2
zipMaximos [] [] = []
zipMaximos (x:xs) (l:ls) = (if x > l then x else l) : zipMaximos xs ls

{-- Ejemplo de uso --}
zipMaximosEjemplo = zipMaximos [1, 2, 3] [4, 5, 6]


{-- 15. --}
elMinimo :: Ord a => [a] -> a 
elMinimo [] = error "No puede ser una lista vacia"
elMinimo (x:[]) = x
elMinimo (x:xs) = if x > primerElemento xs then elMinimo (x: sinPrimerElemento xs) else elMinimo xs

{-- Ejemplo de uso --}
elMinimoEjemplo = elMinimo [1, 2, 3, 4, 5]


primerElemento:: [a] -> a
primerElemento (x:[]) = x
primerElemento (x:xs) = x


sinPrimerElemento :: [a] -> [a]
sinPrimerElemento (x:[]) = []
sinPrimerElemento (x:xs) = xs


{-- 2. --}

{-- Recursion sobre numeros --}

{-- 1. --}
factorial :: Int -> Int
factorial 0 = 1
factorial n = if n > 0 then n * factorial ( n - 1 ) else error "No se puede calcular el factorial de un numero negativo"

{-- Ejemplo de uso --}
factorialEjemplo = factorial 5

{-- 2. --}

cuentaRegresiva :: Int -> [Int]
cuentaRegresiva 0 = []
cuentaRegresiva n = if n < 0 then cuentaRegresiva 0 else n : cuentaRegresiva (n-1)

{-- Ejemplo de uso --}
cuentaRegresivaEjemplo = cuentaRegresiva 5

{-- 3. --}
repetir :: Int -> a -> [a]
repetir 0 _ = []
repetir n e = if n < 0 then [] else e : repetir (n-1) e

{-- Ejemplo de uso --}
repetirEjemplo = repetir 3 5

{-- 4. --}
losPrimeros :: Int -> [a] -> [a]
losPrimeros n [] = []
losPrimeros 0 _ = []
losPrimeros n (x:xs) = x : losPrimeros (n-1) xs

{-- Ejemplo de uso --}
losPrimerosEjemplo = losPrimeros 3 [1, 2, 3, 4, 5]
  
{-- 5. --}
sinLosPrimeros :: Int -> [a] -> [a]
sinLosPrimeros 0 ls = ls
sinLosPrimeros n [] = []
sinLosPrimeros n (x:xs) = sinLosPrimeros (n-1) xs

{-- Ejemplo de uso --}
sinLosPrimerosEjemplo = sinLosPrimeros 2 [1, 2, 3, 4, 5]

{-- 3. --}

{-- Registros --}

{-- 1. --}
{-- 2. --}
{-- 3. --}