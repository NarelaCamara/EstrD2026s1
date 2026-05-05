module Alcancia(
    Alcancia,
    nuevaA, 
    ponerA, 
    contarA
)
where 

data Alcancia a = A [(Moneda, Int)]  deriving Show  
data Moneda = M Int deriving Show

valor:: Moneda -> Int
valor (M n) = n

monedaValida :: Moneda -> Bool
monedaValida = (M 1) = True
monedaValida = (M 2) = True
monedaValida = (M 5) = True
monedaValida = (M _) = False

-- constante
nuevaA :: Alcancia 
nuevaA = A []

-- constante + lineal 
ponerA:: Int -> Alcancia -> Alcancia 
ponerA x (A xs) = if monedaValida x then agregarMoneda x xs then (A xs)

-- constante + lineal
agregarMoneda:: Int -> [(Moneda, Int)] -> [(Moneda, Int)]
agregarMoneda n [] = []
agregarMoneda n ((m, c):xs) = if n == m then (m, c+1) : xs else (m, c) : agregarMoneda n xs

--constante + lineal
contarA:: Int -> Alcancia -> Int 
contarA n (A xs) = if monedaValida n then buscarMoneda n xs then 0

-- constante + lineal 
buscarMoneda::Int ->[(Moneda, Int)] -> Int
buscarMoneda n [] = 0
buscarMoneda n ((m,c):xs) = if (valor m) == n then c else buscarMoneda n xs