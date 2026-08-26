-- Práctica de ejercicios #3 - Tipos recursivos

-- 1. Tipos recursivos simples
-- 1.1. Celdas con bolitas
data Color = Azul | Rojo
    deriving Show

data Celda = Bolita Color Celda | CeldaVacia
    deriving Show

-- 1.1.a
nroBolitas :: Color -> Celda -> Int 
nroBolitas _  CeldaVacia    = 0
nroBolitas c (Bolita co cd) = unoSi (esMismoColor c co) + nroBolitas c cd

unoSi :: Bool -> Int
unoSi True = 1
unoSi _    = 0

esMismoColor :: Color -> Color -> Bool
esMismoColor Azul   Azul    = True
esMismoColor Rojo   Rojo    = True
esMismoColor _      _       = False

-- 1.1.b
poner :: Color -> Celda -> Celda
poner c cd = Bolita c cd

-- 1.1.c
sacar :: Color -> Celda -> Celda
sacar c CeldaVacia     = CeldaVacia 
sacar c (Bolita cr cd) =
    if esMismoColor c cr
        then cd
        else (Bolita cr (sacar c cd))

-- 1.1.d
ponerN :: Int -> Color -> Celda -> Celda
ponerN 0 _ cd = cd
ponerN n c cd = Bolita c (ponerN (n-1) c cd)

-- 1.2. Camino hacia el tesoro
data Objeto = Cacharro | Tesoro
    deriving Show

data Camino = Fin | Cofre [Objeto] Camino | Nada Camino
    deriving Show

-- 1.2.a
hayTesoro :: Camino -> Bool
hayTesoro Fin          = False
hayTesoro (Cofre os c) = tieneTesoro os || hayTesoro c
hayTesoro (Nada c)     = hayTesoro c 

tieneTesoro :: [Objeto] -> Bool 
tieneTesoro []     = False   
tieneTesoro (o:os) = esTesoro o || tieneTesoro os

esTesoro :: Objeto -> Bool
esTesoro Tesoro = True 
esTesoro _      = False

-- 1.2.b
pasosHastaTesoro :: Camino -> Int
pasosHastaTesoro Fin          = error "el camino no tiene al menos un tesoro."
pasosHastaTesoro (Nada c)     = 1 + pasosHastaTesoro c
pasosHastaTesoro (Cofre os c) = if tieneTesoro os
                                 then 0
                                 else 1 + pasosHastaTesoro c

-- 1.2.c
hayTesoroEn :: Int -> Camino -> Bool
hayTesoroEn 0 c             = tieneTesoroEn c
hayTesoroEn _ Fin           = False
hayTesoroEn p (Nada c)      = hayTesoroEn (p-1) c
hayTesoroEn p (Cofre _ c)   = hayTesoroEn (p-1) c

tieneTesoroEn :: Camino -> Bool
tieneTesoroEn (Cofre os _) = tieneTesoro os
tieneTesoroEn _            = False

-- 1.2.d
alMenosNTesoros :: Int -> Camino -> Bool
alMenosNTesoros 0 _            = True
alMenosNTesoros _ Fin          = False
alMenosNTesoros n (Cofre os c) = n <= cantTesorosEn os || alMenosNTesoros (n-(cantTesorosEn os)) c
alMenosNTesoros n (Nada c)     = alMenosNTesoros n c 

cantTesorosEn :: [Objeto] -> Int 
cantTesorosEn []     = 0
cantTesorosEn (o:os) = if esTesoro o then 1 + cantTesorosEn os
                                     else cantTesorosEn os
-- 1.2.e
cantTesorosEntre :: Int -> Int -> Camino -> Int
cantTesorosEntre n m c = if n <= m
                            then cantTesorosHasta m (caminoDesde n c)
                            else cantTesorosEntre m n c 

cantTesorosHasta :: Int -> Camino -> Int 
cantTesorosHasta 0 (Cofre os c) = cantTesorosEn os
cantTesorosHasta 0 _            = 0  
cantTesorosHasta n Fin          = 0                                                                                                          
cantTesorosHasta n (Nada c)     = cantTesorosHasta (n-1) c                      
cantTesorosHasta n (Cofre os c) = cantTesorosEn os + cantTesorosHasta (n-1) c     

caminoDesde :: Int -> Camino -> Camino 
caminoDesde 0 c           = c
caminoDesde n Fin         = Fin 
caminoDesde n (Nada c)    = caminoDesde (n-1) c
caminoDesde n (Cofre _ c) = caminoDesde (n-1) c

-- 2. Tipo Arbóreos
-- 2.1. Árboles binarios
data Tree a = EmptyT | NodeT a (Tree a) (Tree a)
    deriving Show

-- 2.1.1.
sumarT :: Tree Int -> Int
sumarT EmptyT          = 0
sumarT (NodeT n ti td) = n + sumarT ti + sumarT td  

-- 2.1.2.
sizeT :: Tree a -> Int
sizeT EmptyT          = 0
sizeT (NodeT x ti td) = 1 + sizeT td + sizeT ti  

-- 2.1.3.
mapDobleT :: Tree Int -> Tree Int
mapDobleT EmptyT          = EmptyT
mapDobleT (NodeT n ti td) = NodeT (n*2) (mapDobleT ti) (mapDobleT td)

-- 3.1.4.
perteneceT :: Eq a => a -> Tree a-> Bool
perteneceT _ EmptyT           = False
perteneceT x (NodeT x' ti td) = x==x' || perteneceT x ti || perteneceT x td

-- 3.1.5.
aparicionesT :: Eq a => a -> Tree a-> Int
aparicionesT _ EmptyT           = 0
aparicionesT e (NodeT x ti td) = unoSi (e==x) + aparicionesT e ti + aparicionesT e td

-- 3.1.6.
leaves :: Tree a -> [a]
leaves EmptyT                  = []
leaves (NodeT x EmptyT EmptyT) = x:[]
leaves (NodeT _ ti td)         = leaves ti ++ leaves td 

-- 3.1.7. 
heightT :: Tree a -> Int
heightT EmptyT          = 0
heightT (NodeT _ ti td) = 1 + max (heightT ti) (heightT td)

-- 3.1.8.
mirrorT :: Tree a -> Tree a
mirrorT EmptyT          = EmptyT
mirrorT (NodeT x ti td) = NodeT x (mirrorT td) (mirrorT ti)

-- 3.1.9.
toList :: Tree a -> [a]
toList EmptyT          = []
toList (NodeT x ti td) = toList ti ++ x : toList td

-- 3.1.10.
levelN :: Int -> Tree a -> [a]
levelN _ EmptyT          = []
levelN 0 (NodeT x _  _)  = x:[]
levelN n (NodeT _ ti td) = levelN (n-1) ti ++ levelN (n-1) td

-- 3.1.11.
listPerLevel :: Tree a -> [[a]]
listPerLevel EmptyT          = []
listPerLevel (NodeT x ti td) = [x] : juntarNiveles (listPerLevel ti) (listPerLevel td) 
 
juntarNiveles :: [[a]] -> [[a]] -> [[a]]
juntarNiveles []       yss      = yss 
juntarNiveles xss      []       = xss 
juntarNiveles (xs:xss) (ys:yss) = (xs++ys) : juntarNiveles xss yss 

-- 3.1.12.
ramaMasLarga :: Tree a -> [a]
ramaMasLarga EmptyT          = []
ramaMasLarga (NodeT x ti td) = if length(ramaMasLarga ti) > length(ramaMasLarga td)
                                    then x : ramaMasLarga ti
                                    else x : ramaMasLarga td 

-- 3.1.13.
todosLosCaminos :: Tree a -> [[a]]
todosLosCaminos EmptyT          = []
todosLosCaminos (NodeT x ti td) = [x] : consATodos x ((todosLosCaminos ti) ++ (todosLosCaminos td))

consATodos :: a -> [[a]] -> [[a]]
consATodos x []       = []
consATodos x (xs:xss) = (x:xs) : consATodos x xss 

-- 2.2. Expresiones Aritméticas
data ExpA = Valor Int
            | Sum ExpA ExpA
            | Prod ExpA ExpA
            | Neg ExpA
    deriving Show

-- 2.2.1
eval :: ExpA -> Int
eval (Valor i)   = i
eval (Sum e e')  = eval e + eval e'
eval (Prod e e') = eval e * eval e'
eval (Neg e)     = - eval e

-- 2.2.2.
simplificar :: ExpA -> ExpA
simplificar (Valor i)     = Valor i
simplificar (Sum   e e')  = simplificarSum (simplificar e) (simplificar e')
simplificar (Prod  e e')  = simplificarProd (simplificar e) (simplificar e')
simplificar (Neg   e)     = simplificarNeg (simplificar e)

simplificarSum :: ExpA -> ExpA -> ExpA
simplificarSum (Valor 0)  e         = e
simplificarSum e          (Valor 0) = e
simplificarSum e           e'       = (Sum e e')

simplificarProd :: ExpA -> ExpA -> ExpA
simplificarProd (Valor 0)     _         = Valor 0
simplificarProd _             (Valor 0) = Valor 0
simplificarProd (Valor 1)     e         = e
simplificarProd e             (Valor 1) = e 
simplificarProd e             e'        = (Prod e e')

simplificarNeg :: ExpA -> ExpA
simplificarNeg (Neg e) = e 
simplificarNeg e       = Neg e