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
