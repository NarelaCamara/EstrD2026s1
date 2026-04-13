{-- PRACTICA 3 --}

{-- 1. --}

{-- Tipos recursivos simples --}

{-- 1. --}
data Color = Rojo | Azul deriving (Show, Eq)

data Celda =  Bolita Color Celda | CeldaVacia deriving Show

{-- PRECONDICION: El color debe ser válido
    Proposito: Devuelve la cantidad de bolitas del color dado que hay en la celda --}

nroBolitas:: Color -> Celda -> Int
nroBolitas  c CeldaVacia = 0
nroBolitas col (Bolita colB celB ) = if col == colB then 1 + (nroBolitas col celB) else nroBolitas col celB

{-- Ejemplo de uso  --}
ejemplo1 = Bolita Rojo (Bolita Azul CeldaVacia)
ejemplo2 = CeldaVacia

{-- PRECONDICION: El color debe ser válido
    Proposito: Pone una bolita del color en la celda --}
poner:: Color -> Celda -> Celda
poner col c = (Bolita col c)


{-- Ejemplo de uso  --}
ejemplo3 = poner Rojo ejemplo1
ejemplo4 = sacar Rojo ejemplo1

{-- PRECONDICION: El color debe ser válido
    Proposito: Saca una bolita del color en la celda --}
sacar:: Color -> Celda -> Celda
sacar c CeldaVacia = CeldaVacia
sacar c (Bolita colB celB) = if c == colB then celB else Bolita colB (sacar c celB)

{-- Ejemplo de uso --}
ejemplo5 = sacar Rojo ejemplo3
ejemplo6 = sacar Azul ejemplo3

{-- PRECONDICION: El número debe ser válido
    Proposito: Pone n bolitas del color en la celda --}
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

{-- PRECONDICION: El camino debe ser válido
    Proposito: Devuelve True si hay un tesoro en el camino, False en caso contrario --}

hayTesoro:: Camino -> Bool
hayTesoro Fin = False
hayTesoro (Nada c) = False || (hayTesoro c)
hayTesoro (Cofre lo c) = if hayTesoroEntreLosObjetos lo then True else hayTesoro c

{--Ejemplo de uso --}
hayTesoroEjemplo = hayTesoro (Cofre [Cacharro, Tesoro] (Nada (Cofre [Cacharro] Fin)))

esTesoro :: Objeto -> Bool
esTesoro Tesoro = True
esTesoro _ = False

hayTesoroEntreLosObjetos:: [Objeto] -> Bool
hayTesoroEntreLosObjetos [] = False
hayTesoroEntreLosObjetos (x:xs) = if esTesoro x then True else hayTesoroEntreLosObjetos xs


{-- PRECONDICION: El camino debe ser válido
    Proposito: Devuelve la cantidad de pasos hasta llegar al tesoro
    Aclaracion: Incluimos el cero al contar los pasos --}
pasosHastaTesoro :: Camino -> Int
pasosHastaTesoro Fin = 0
pasosHastaTesoro (Nada c) = 1 + pasosHastaTesoro c 
pasosHastaTesoro (Cofre ls c) = if hayTesoroEntreLosObjetos ls then 0 else 1 + pasosHastaTesoro c

{--Ejemplo de uso --}
pasosHastaTesoroEjemplo = pasosHastaTesoro  (Cofre [Cacharro] (Nada (Cofre [Cacharro, Tesoro] Fin)))

{-- PRECONDICION: El camino debe ser válido
    Proposito: Devuelve True si hay un tesoro en el camino en la posición dada, False en caso contrario 
    Aclaracion: Incluimos el cero al contar los pasos --}
hayTesoroEn :: Int -> Camino -> Bool
hayTesoroEn n Fin = False 
hayTesoroEn 0 c = hayTesoroEntreLosObjetosEn c
hayTesoroEn n (Nada c) = hayTesoroEn (n-1) c
hayTesoroEn n (Cofre ts c) = hayTesoroEn (n-1) c 

{-- Ejemplo de uso --}
hayTesoroEnEjemplo = hayTesoroEn 3 (Nada (Cofre [Cacharro] (Nada (Cofre [Cacharro, Tesoro] Fin))))


hayTesoroEntreLosObjetosEn:: Camino -> Bool
hayTesoroEntreLosObjetosEn (Cofre ts c) = hayTesoroEntreLosObjetos ts
hayTesoroEntreLosObjetosEn _ = False


{-- PRECONDICION: El número debe ser válido, si un camino tiene mas de n tesoros entonces es True
    Proposito: Devuelve True si hay al menos n tesoros en el camino, False en caso contrario
    Aclaracion: Incluimos el cero al contar los pasos --}
alMenosNTesoros:: Int -> Camino -> Bool
alMenosNTesoros n c = (cantTesorosEn c) >= n 

{-- Ejemplo de uso --}
alMenosNTesorosEjemplo = alMenosNTesoros 5 (Nada (Cofre [Cacharro,Tesoro,Tesoro] (Nada (Cofre [Cacharro, Cacharro, Tesoro] (Nada (Cofre [Tesoro, Tesoro] Fin))))))

cantTesorosEn:: Camino -> Int
cantTesorosEn Fin = 0
cantTesorosEn (Nada c) = 0 + cantTesorosEn c
cantTesorosEn (Cofre ts c) = cantTesoro ts + cantTesorosEn c

cantTesoro :: [Objeto] -> Int
cantTesoro [] = 0
cantTesoro (x:xs) = if esTesoro x then  1 + cantTesoro xs else cantTesoro xs


{-- PRECONDICION: Los números deben ser válidos, 
    Proposito: Devuelve la cantidad de tesoros en el camino entre las posiciones dadas--}
cantTesorosEntre:: Int -> Int -> Camino -> Int
cantTesorosEntre _ _ Fin = 0
cantTesorosEntre _ 0 (Nada c) = 0
cantTesorosEntre 0 fin (Nada c) = 0 + cantTesorosEntre 0 (fin-1) c
cantTesorosEntre inicio fin (Nada c) = 0 + cantTesorosEntre (inicio-1) (fin-1) c
cantTesorosEntre _ 0 (Cofre ts c) = cantTesoro ts
cantTesorosEntre 0 fin (Cofre ts c) = cantTesoro ts + cantTesorosEntre 0 (fin-1) c
cantTesorosEntre inicio fin (Cofre ts c) = 0 + cantTesorosEntre (inicio-1) (fin-1) c


{--Ejemplo de uso --}
cantTesorosEntreEjemplo = cantTesorosEntre 0 1 (Cofre [Cacharro, Tesoro, Tesoro]  (Cofre [Cacharro, Tesoro, Tesoro] (Nada (Cofre [Cacharro, Tesoro] (Nada (Cofre [Cacharro, Tesoro, Tesoro, Tesoro] Fin))))))

{-- 2. --}
 
{-- TIPOS ARBOREOS --}
{-- arboles binarios --}

data Tree a = EmptyT | NodeT a (Tree a) (Tree a) deriving Show

{-- 1. --}
{-- PRECONDICION: El árbol debe ser válido
    Proposito: Devuelve la suma de los elementos del árbol --}
sumarT :: Tree Int -> Int
sumarT EmptyT = 0
sumarT (NodeT a t1 t2) = a + (sumarT t1) + (sumarT t2)

{-- Ejemplo de uso --}
sumarTEjemplo = sumarT (NodeT 5 (NodeT 3 EmptyT EmptyT) (NodeT 7 EmptyT EmptyT))

{-- 2. --}
{-- PRECONDICION: El árbol debe ser válido
    Proposito: Devuelve la cantidad de nodos del árbol --}
sizeT :: Tree a -> Int
sizeT EmptyT = 0
sizeT (NodeT a t1 t2) = 1 + (sizeT t1) + (sizeT t2)

{-- Ejemplo de uso --}
sizeTEjemplo = sizeT (NodeT 5 (NodeT 3 EmptyT EmptyT) (NodeT 7 EmptyT EmptyT))

{-- 3. --}
{-- PRECONDICION: El árbol debe ser válido
    Proposito: Devuelve un nuevo árbol con el resultado de duplicar el valor de cada elemento del árbol --}
mapDobleT:: Tree Int -> Tree Int
mapDobleT EmptyT = EmptyT
mapDobleT (NodeT a t1 t2) = (NodeT (doble a) (mapDobleT t1) (mapDobleT t2)) 

{-- Ejemplo de uso --}
mapDobleTEjemplo = mapDobleT (NodeT 5 (NodeT 3 EmptyT EmptyT) (NodeT 7 EmptyT EmptyT))

doble:: Int -> Int
doble n = n * 2


{-- 4. --}
{-- PRECONDICION: El árbol debe ser válido
    Proposito: Devuelve True si el elemento dado pertenece al árbol, False en caso contrario --}
perteneceT:: Eq a => a -> Tree a -> Bool
perteneceT a EmptyT = False
perteneceT a (NodeT na t1 t2) = (esIgual a na) ||( perteneceT a t1) ||( perteneceT a t2)

{-- Ejemplo de uso --}
perteneceTEjemplo = perteneceT 5 (NodeT 5 (NodeT 3 EmptyT EmptyT) (NodeT 7 EmptyT EmptyT))

esIgual:: Eq a => a -> a -> Bool
esIgual n1 n2 = n1 == n2

{-- 5. --}
{-- PRECONDICION: El árbol debe ser válido
    Proposito: Devuelve la cantidad de apariciones del elemento dado en el árbol --}
aparicionesT ::Eq a => a -> Tree a -> Int
aparicionesT a EmptyT = 0
aparicionesT a (NodeT na t1 t2) = (if (esIgual a na) then 1 else 0) + (aparicionesT a t1) + (aparicionesT a t2)

{-- Ejemplo de uso --}
aparicionesTEjemplo = aparicionesT 5 (NodeT 5 (NodeT 3 EmptyT EmptyT) (NodeT 5 EmptyT EmptyT))


{-- RARO --}
{--6. --}
{-- PRECONDICION: El árbol debe ser válido
    Proposito: Devuelve una lista con los elementos del árbol que son hojas --}
leaves:: Tree a -> [a]
leaves EmptyT = []
leaves (NodeT a t1 t2) = a : (leaves t1) ++ (leaves t2)

{-- Ejemplo de uso --}
leavesEjemplo = leaves (NodeT 5 (NodeT 3 EmptyT EmptyT) (NodeT 7 EmptyT EmptyT))

{-- 7. --}
{-- PRECONDICION: El árbol debe ser válido
    Proposito: Devuelve la altura del árbol --}
heightT:: Tree a -> Int
heightT EmptyT = 0
heightT (NodeT a EmptyT t2) = 1 + heightT t2
heightT (NodeT a t1 EmptyT) = 1 + heightT t1
heightT (NodeT a t1 t2) = 1 + (mayor (heightT t1) (heightT t2))

mayor:: Int -> Int -> Int
mayor n1 n2 = if n1 > n2 then n1 else n2


{-- Ejemplo de uso --}
heightTEjemplo = heightT (NodeT 5 (NodeT 3 (NodeT 3 (NodeT 3 EmptyT EmptyT) EmptyT) EmptyT) (NodeT 7 EmptyT EmptyT))

{-- 8. --}
{-- PRECONDICION: El árbol debe ser válido
    Proposito: Devuelve un nuevo árbol con el resultado de reflejar el árbol dado --}
mirrorT:: Tree a -> Tree a 
mirrorT EmptyT = EmptyT
mirrorT (NodeT a EmptyT t2) = (NodeT a (mirrorT t2) EmptyT) 
mirrorT (NodeT a t1 EmptyT) = (NodeT a EmptyT (mirrorT t1)) 
mirrorT (NodeT a t1 t2) = (NodeT a (mirrorT t2) (mirrorT t1))

{-- Ejemplo de uso --}
mirrorTEjemplo = mirrorT (NodeT 5 (NodeT 3 EmptyT EmptyT) (NodeT 7 EmptyT EmptyT))


{-- 9. --} 
{-- PRECONDICION: El árbol debe ser válido
    Proposito: Devuelve una lista con los elementos del árbol en orden --}
toList:: Tree a -> [a]
toList EmptyT = []
toList (NodeT a t1 t2) = toList t1 ++ (a : []) ++  toList t2

{-- Ejemplo de uso --}
toListEjemplo = toList (NodeT 5 (NodeT 3 EmptyT (NodeT 2 EmptyT EmptyT)) (NodeT 7 EmptyT EmptyT))

{-- 10. --}
{-- PRECONDICION: El árbol debe ser válido, el número debe ser mayor o igual a cero
    Proposito: Devuelve una lista con los elementos del nivel n del árbol --}
levelN:: Int -> Tree a -> [a]
levelN n EmptyT = []
levelN n (NodeT a t1 t2) = if(n == 0) then a : [] else levelN (n-1) t1 ++ levelN (n-1) t2

{-- Ejemplo de uso --}
levelNEjemplo = levelN 1 (NodeT 5 (NodeT 3 EmptyT (NodeT 2 EmptyT EmptyT)) (NodeT 7 EmptyT EmptyT))

{-- 11. --}
{-- PRECONDICION: El árbol debe ser válido
    Proposito: Devuelve una lista de listas con los elementos del árbol por nivel --}
listPerLevel :: Tree a -> [[a]]
listPerLevel EmptyT          = []
listPerLevel (NodeT x t1 t2) = [x] : concatenar (listPerLevel t1) (listPerLevel t2)

concatenar :: [[a]] -> [[a]]   -> [[a]]
concatenar  []     yss        = yss
concatenar  xss    []         = xss
concatenar  (xs:xss) (ys:yss) = (xs ++ ys) : concatenar xss yss
{-- Ejemplo de uso --}
listPerLevelEjemplo = listPerLevel (NodeT 5 (NodeT 3 EmptyT (NodeT 2 EmptyT EmptyT)) (NodeT 7 EmptyT EmptyT))

{-- 12.
ramaMasLarga:: Tree a -> [a]
ramaMasLarga EmptyT = []
ramaMasLarga (NodeT a EmptyT EmptyT) = (a :[])
ramaMasLarga (NodeT a t1 t2) = (a: []) ++ (if (mayor (longitud t1) (longitud t2)) then t1 else t2) --}

longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

{-- 13. 
todosLosCaminos:: Tree a -> [[a]]
todosLosCaminos EmptyT = []
todosLosCaminos (NodeT a t1 EmptyT) = [a] : ([a] ++ (todosLosCaminos t1)) 
todosLosCaminos (NodeT a EmptyT t2) = [a] : ([a] ++ (todosLosCaminos t2)) 
todosLosCaminos (NodeT a t1 t2) = [a] : ([a] ++ (todosLosCaminos t1)) : ([a] ++ (todosLosCaminos t2))--}

{-- 2. --}

data ExpA = Valor Int | Sum ExpA ExpA | Prod ExpA ExpA | Neg ExpA deriving Show

{-- EXPRESIONES ARITMETICAS --}
{--  1. --}
{-- PRECONDICION: La expresión debe ser válida
    Proposito: Devuelve el resultado de evaluar la expresión --}
eval:: ExpA -> Int
eval (Neg n) = (eval n)  * (-1)
eval (Valor n) = n
eval (Sum n1 n2) =(eval n1) + (eval n2)
eval (Prod n1 n2) = (eval n1) * (eval n2)

{-- Ejemplo de uso --}
evalEjemplo = eval (Sum (Prod (Valor 2) (Valor 3)) (Neg (Valor 4)))

{-- 2. --}
{-- PRECONDICION: La expresión debe ser válida
    Proposito: Devuelve una nueva expresión con el resultado de simplificar la expresión dada --}
simplificar:: ExpA -> ExpA
simplificar (Sum n1 n2) = simplificacionSuma(simplificar n1) (simplificar n2)
simplificar (Prod n1 n2) = simplificacionProd (simplificar n1) (simplificar n2)
simplificar (Neg (Neg n))  = simplificar n
simplificar (Valor n) = Valor n


{-- Ejemplo de uso --}
simplificarEjemplo = simplificar (Prod (Valor 1) (Neg (Neg(Sum (Neg (Neg (Valor 4))) (Neg (Neg (Valor 0)))))) )


simplificacionSuma :: ExpA -> ExpA -> ExpA
simplificacionSuma n1 n2 = if eval n1 == 0 then n2 else if eval n2 == 0 then n1 else Sum n1 n2


simplificacionProd :: ExpA -> ExpA -> ExpA
simplificacionProd n1 n2 = if eval n1 == 0 || eval n2 == 0 then Valor 0 else (if (eval n1 * 1) == 1 then n2 else if (eval n2 * 1) == 1 then n1 else Prod n1 n2)


 