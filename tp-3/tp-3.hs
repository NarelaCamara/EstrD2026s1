{-- PRACTICA 3 --}

{-- 1. --}

{-- Tipos recursivos simples --}

{-- 1. --}
data Color = Rojo | Azul deriving (Show, Eq)

data Celda =  Bolita Color Celda | CeldaVacia deriving Show

{-- --}
nroBolitas:: Color -> Celda -> Int
nroBolitas  c CeldaVacia = 0
nroBolitas col (Bolita colB celB ) = if col == colB then 1 + (nroBolitas col celB) else nroBolitas col celB

{-- Ejemplo de uso  --}
ejemplo1 = Bolita Rojo (Bolita Azul CeldaVacia)
ejemplo2 = CeldaVacia

{-- --}
poner:: Color -> Celda -> Celda
poner col c = (Bolita col c)


{-- Ejemplo de uso  --}
ejemplo3 = poner Rojo ejemplo1
ejemplo4 = sacar Rojo ejemplo1

{-- --}
sacar:: Color -> Celda -> Celda
sacar c CeldaVacia = Bolita c CeldaVacia
sacar c (Bolita colB celB) = if c == colB then celB else Bolita colB (sacar c celB)

{-- Ejemplo de uso --}
ejemplo5 = sacar Rojo ejemplo3
ejemplo6 = sacar Azul ejemplo3

{-- --}
ponerN:: Int -> Color -> Celda -> Celda
ponerN 0 col c = c
ponerN n col c = if n > 0 then  (Bolita col (ponerN (n-1) col c)) else c

{-- Ejemplo de uso --}
ejemplo7 = ponerN 3 Rojo ejemplo2


{-- 1. --}
{-- 2. --}

{-- Camino hacia el tesoro --}
data Objeto = Cacharro | Tesoro deriving (Show, Eq)
data Camino = Fin | Cofre [Objeto] Camino | Nada Camino deriving Show

esTesoro :: Objeto -> Bool
esTesoro Tesoro = True
esTesoro _ = False

{-- --}
hayTesoro:: Camino -> Bool
hayTesoro Fin = False
hayTesoro (Nada c) = False || (hayTesoro c)
hayTesoro (Cofre lo c) = if hayTesoroEntreLosObjetos lo then True else hayTesoro c

{--Ejemplo de uso --}
hayTesoroEjemplo = hayTesoro (Cofre [Cacharro, Tesoro] (Nada (Cofre [Cacharro] Fin)))


hayTesoroEntreLosObjetos:: [Objeto] -> Bool
hayTesoroEntreLosObjetos [] = False
hayTesoroEntreLosObjetos (x:xs) = if esTesoro x then True else hayTesoroEntreLosObjetos xs


{-- --}
pasosHastaTesoro :: Camino -> Int
pasosHastaTesoro Fin = 0
pasosHastaTesoro (Nada c) = 1 + pasosHastaTesoro c 
pasosHastaTesoro (Cofre ls c) = if hayTesoroEntreLosObjetos ls then 0 else 1 + pasosHastaTesoro c

{--Ejemplo de uso --}
pasosHastaTesoroEjemplo = pasosHastaTesoro (Nada (Cofre [Cacharro] (Nada (Cofre [Cacharro, Tesoro] Fin))))

{-- --}
hayTesoroEn :: Int -> Camino -> Bool
hayTesoroEn n Fin = False 
hayTesoroEn 0 c = hayTesoroEntreLosObjetosEn c
hayTesoroEn n (Nada c) = hayTesoroEn (n-1) c
hayTesoroEn n (Cofre ts c) = hayTesoroEn (n-1) c 


hayTesoroEntreLosObjetosEn:: Camino -> Bool
hayTesoroEntreLosObjetosEn (Cofre ts c) = hayTesoroEntreLosObjetos ts
hayTesoroEntreLosObjetosEn _ = False


{-- --}
alMenosNTesoros:: Int -> Camino -> Bool
alMenosNTesoros n c = (cantTesorosEn c) >= n 

cantTesorosEn:: Camino -> Int
cantTesorosEn Fin = 0
cantTesorosEn (Nada c) = 0 + cantTesorosEn c
cantTesoroEn (Cofre ts c) = cantTesoro ts + cantTesoroEn c

cantTesoro :: [Objeto] -> Int
cantTesoro [] = 0
cantTesoro (x:xs) = if esTesoro x then  1 + cantTesoro xs else cantTesoro xs


{-- --}

cantTesorosEntre:: Int -> Int -> Camino -> Int
cantTesorosEntre inicio fin Fin = 0
cantTesorosEntre inicio fin (Nada c) = if (inicio-1) == 0 && (fin-1) == 0  then 0 else (cantTesorosEntre (inicio-1) (fin-1) c)
cantTesorosEntre inicio fin (Cofre ts c) =  if (inicio-1) == 0 then  (if (fin-1) == 0 then 0 else (cantTesoro ts) + (cantTesorosEntre 0 (fin-1) c) ) else cantTesorosEntre (inicio-1) (fin-1) c



{--Ejemplo de uso --}

parteCaminoEntreEjemplo = cantTesorosEntre 2 5 (Nada (Cofre [Cacharro, Tesoro] (Nada (Cofre [Cacharro, Tesoro, Tesoro] (Nada (Cofre [Cacharro] (Nada (Cofre [Cacharro, Tesoro, Tesoro, Tesoro] Fin))))))))

{-- 2. --}
 
{-- TIPOS ARBOREOS --}
{-- arboles binarios --}

data Tree a = EmptyT | NodeT a (Tree a) (Tree a)

{-- 1. --}
sumarT :: Tree Int -> Int
sumarT EmptyT = 0
sumarT (NodeT a t1 t2) = a + (sumarT t1) + (sumarT t2)

{-- 2. --}
sizeT :: Tree a -> Int
sizeT EmptyT = 1
sizeT (NodeT a t1 t2) = 1 + (sizeT t1) + (sizeT t2)

{-- 3. --}
mapDobleT:: Tree Int -> Tree Int
mapDobleT EmptyT = EmptyT
mapDobleT (NodeT a t1 t2) = (NodeT (doble a) (mapDobleT t1) (mapDobleT t2)) 


doble:: Int -> Int
doble n = n * 2

{-- 4. --}
perteneceT:: Eq a => a -> Tree a -> Bool
perteneceT a EmptyT = False
perteneceT a (NodeT na t1 t2) = (esIgual a na) ||( perteneceT a t1) ||( perteneceT a t2)


esIgual:: Eq a => a -> a -> Bool
esIgual n1 n2 = n1 == n2

{-- 5. --}
aparicionesT ::Eq a => a -> Tree a -> Int
aparicionesT a EmptyT = 0
aparicionesT a (NodeT na t1 t2) = (if (esIgual a na) then 1 else 0) + (aparicionesT a t1) + (aparicionesT a t2)

{--6. --}
leaves:: Tree a -> [a]
leaves EmptyT = []
leaves (NodeT a t1 t2) = a : (leaves t1) ++ (leaves t2)

{-- 7. 
heightT:: Tree a -> Int
heightT EmptyT = 0
heightT (NodeT a t1 t2) = 1 + 

{-- 8. --}
--mirrorT:: Tree a -> Tree a 

--toList:: Tree a -> [a]

--levenN:: Int -> Tree a -> [a]

--listPerLevel:: Tree a -> [[a]]

--ramaMasLarga:: Tree a -> [a]

--todosLosCaminos:: Tree a -> [[a]]


{-- 2. --}

data ExpA = Valor Int | Sum ExpA ExpA | Prod ExpA ExpA | Neg ExpA deriving Show

{-- EXPRESIONES ARITMETICAS --}
{--  1. --}

{-- 2. --}