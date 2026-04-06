
{-- PRACTICA 2 --}

{-- 1. --}

{-- recursion sobre listas--}

{-- 1. --}

{-- PRECOND: La lista debe ser de numeros enteros --}

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

{-- Ejemplo de uso --}
sumatoriaEjemplo = sumatoria [1, 2, 3, 4, 5] 


{-- 2. --}

{-- PRECOND: La lista puede ser de cualquier tipo --}

logitud :: [a] -> Int
logitud [] = 0
logitud (x:xs) = 1 + logitud xs

{-- Ejemplo de uso --}  
logitudEjemplo = logitud [1, 2, 3, 4, 5] 

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
{-- PRECOND:   --}

apariciones :: Eq a => a -> [a] -> Int
apariciones _ [] = 0
apariciones e (x:xs) = if (e == x) then 1 + apariciones e xs  else apariciones e xs