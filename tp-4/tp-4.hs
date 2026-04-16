{-- PRACTICA 4 --}


{-- 1. --}

data Pizza = Prepizza | Capa Ingrediente Pizza deriving Show

data Ingrediente = Salsa | Queso | Jamon | Aceitunas Int deriving Show


{-- PRECONDICION: La pizza debe ser válida
    Proposito: Devuelve la cantidad de capas de la pizza --}
cantidadDeCapas :: Pizza -> Int
cantidadDeCapas Prepizza = 0
cantidadDeCapas (Capa i p) = 1 + cantidadDeCapas p

{-- Ejemplo de uso --}
cantidadDeCapasEjemplo = cantidadDeCapas (Capa Salsa (Capa Queso (Capa Queso Prepizza)))

{-- PRECONDICION: La lista de ingredientes debe ser válida
    Proposito: Devuelve una pizza con los ingredientes dados --}
armarPizza:: [Ingrediente] -> Pizza
armarPizza [] = Prepizza
armarPizza (x:xs) = (Capa x (armarPizza xs))

{-- Ejemplo de uso --}
armarPizzaEjemplo = armarPizza [Salsa, Queso, Jamon]


{-- PRECONDICION: La pizza debe ser válida
    Proposito: Devuelve una pizza sin jamón --}
sacarJamon :: Pizza -> Pizza
sacarJamon Prepizza = Prepizza
sacarJamon (Capa i p) = if esJamon i then (sacarJamon p) else (Capa i (sacarJamon p))


esJamon:: Ingrediente -> Bool
esJamon Jamon = True
esJamon _ = False

{-- Ejemplo de uso --}
sacarJamonEjemplo = sacarJamon (Capa Jamon (Capa Salsa (Capa Queso (Capa Jamon Prepizza))))


{-- PRECONDICION: La pizza debe ser válida
    Proposito: Devuelve True si la pizza tiene solo salsa y queso, False en caso contrario --}
tieneSoloSalsaYQueso :: Pizza -> Bool
tieneSoloSalsaYQueso Prepizza = True
tieneSoloSalsaYQueso (Capa i p) = esQuesoOSalsa i && tieneSoloSalsaYQueso p 


esQuesoOSalsa :: Ingrediente -> Bool
esQuesoOSalsa Salsa = True
esQuesoOSalsa Queso = True
esQuesoOSalsa _ = False

{-- Ejemplo de uso --}
tieneSoloSalsaYQuesoEjemplo = tieneSoloSalsaYQueso (Capa Salsa (Capa Queso (Capa Jamon Prepizza)))


{-- PRECONDICION: La pizza debe ser válida
    Proposito: Devuelve una pizza con el doble de aceitunas --}
duplicarAceitunas:: Pizza -> Pizza 
duplicarAceitunas Prepizza = Prepizza
duplicarAceitunas (Capa i p) =  Capa (duplicarCantAceitunas i) (duplicarAceitunas p)


duplicarCantAceitunas:: Ingrediente -> Ingrediente
duplicarCantAceitunas (Aceitunas n) = Aceitunas (n * 2)
duplicarCantAceitunas n = n


{-- Ejemplo de uso --}
duplicarAceitunasEjemplo = duplicarAceitunas (Capa (Aceitunas 3) (Capa (Aceitunas 3) (Capa Queso Prepizza)))

{-- PRECONDICION: La lista de pizzas debe ser válida
    Proposito: Devuelve una lista de tuplas con la cantidad de capas y la pizza correspondiente --}
cantCapasPorPizza :: [Pizza] -> [(Int, Pizza)] 
cantCapasPorPizza [] = []
cantCapasPorPizza (x:xs) = (cantidadDeCapas x , x) : cantCapasPorPizza xs

{-- Ejemplo de uso --}
cantCapasPorPizzaEjemplo = cantCapasPorPizza [Capa Salsa (Capa Queso Prepizza), Capa Jamon (Capa Salsa (Capa Queso Prepizza))]

{-- 2. --}
data Dir = Izq | Der deriving Show
data Objeto = Tesoro | Chatarra deriving Show

data Cofre = CofreC [Objeto] deriving Show

data Mapa = Fin Cofre | Bifurcacion Cofre Mapa Mapa deriving Show

{-- 1. --}

{-- PRECONDICION: El mapa debe ser válido
    Proposito: Devuelve True si hay un tesoro en el mapa, False en caso contrario --}
hayTesoro:: Mapa -> Bool
hayTesoro (Fin c) = hayTesoroEnCofre c
hayTesoro (Bifurcacion c m1 m2) =  (hayTesoroEnCofre c) || hayTesoro m1 || hayTesoro m2


hayTesoroEnCofre:: Cofre -> Bool
hayTesoroEnCofre (CofreC ts) = hayAlgunTesoro ts

hayAlgunTesoro:: [Objeto] -> Bool
hayAlgunTesoro [] = False
hayAlgunTesoro (x:xs) = (esTesoro x) || (hayAlgunTesoro xs)


esTesoro:: Objeto -> Bool
esTesoro Tesoro = True
esTesoro _ = False

{-- Ejemplo de uso --}
hayTesoroEjemplo = hayTesoro (Bifurcacion (CofreC [Chatarra]) (Fin (CofreC [Tesoro])) (Fin (CofreC [])))

{-- PRECONDICION: El mapa debe ser válido
    Proposito: Devuelve True si hay un tesoro en el mapa, False en caso contrario --}
hayTesoroEn:: [Dir] -> Mapa -> Bool
hayTesoroEn [] (Fin c) = hayTesoroEnCofre c
hayTesoroEn [] (Bifurcacion c m1 m2) = hayTesoroEnCofre c
hayTesoroEn _ (Fin c) = False
hayTesoroEn (x:xs) (Bifurcacion c m1 m2) = if esIzquierda x then hayTesoroEn xs m1 else hayTesoroEn xs m2 

{-- Ejemplo de uso --}
hayTesoroEnEjemplo = hayTesoroEn [Izq] (Bifurcacion (CofreC [Chatarra]) (Fin (CofreC [Tesoro])) (Fin (CofreC [])))


esIzquierda:: Dir -> Bool
esIzquierda Izq = True
esIzquierda _ = False

{-- PRECONDICION: El mapa debe ser válido
    Proposito: Devuelve el camino al tesoro en el mapa, si existe --}
caminoAlTesoro:: Mapa -> [Dir]
caminoAlTesoro (Fin c) = []
caminoAlTesoro (Bifurcacion c m1 m2) = if hayTesoroEnCofre c then [] else (if hayTesoro m1 then Izq : caminoAlTesoro m1 else Der : caminoAlTesoro m1)

{-- Ejemplo de uso --}

ejemploCaminoAlTesoro = caminoAlTesoro (Bifurcacion (CofreC [Chatarra]) 
    (Bifurcacion (CofreC [Chatarra]) (Fin (CofreC [Chatarra])) (Fin (CofreC [Tesoro]) ))
    (Bifurcacion (CofreC [Chatarra]) (Fin (CofreC [Chatarra])) (Fin (CofreC [Chatarra]) )))

{-- PRECONDICION: El mapa debe ser válido
    Proposito: Devuelve el camino de la rama más larga en el mapa --}
caminoDeLaRamaMasLarga:: Mapa -> [Dir]
caminoDeLaRamaMasLarga (Fin _) = []
caminoDeLaRamaMasLarga (Bifurcacion c m1 m2) = 
    if longitud (caminoDeLaRamaMasLarga m1) > longitud (caminoDeLaRamaMasLarga m2) 
        then Izq : caminoDeLaRamaMasLarga m1 
        else Der : caminoDeLaRamaMasLarga m2
 
longitud :: [Dir] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs


{-- Ejemplo de uso --}
ejemploCaminoDeLaRamaMasLarga = caminoDeLaRamaMasLarga (Bifurcacion (CofreC [Chatarra]) 
    (Bifurcacion (CofreC [Chatarra]) 
        (Fin (CofreC [Chatarra])) 
        (Fin (CofreC [Chatarra]) ))
    (Fin (CofreC [Chatarra, Tesoro])))


{-- --}
tesorosPorNivel:: Mapa -> [[Objeto]]
tesorosPorNivel (Fin c) = (saquearCofre c) : []
tesorosPorNivel (Bifurcacion c m1 m2) =  (saquearCofre c) : concatenar (tesorosPorNivel m1) (tesorosPorNivel m2)

concatenar:: [[Objeto]] -> [[Objeto]] -> [[Objeto]] 
concatenar [] xs = xs
concatenar xs [] = xs 
concatenar (x:xs) (y:ys) = (x ++ y) : concatenar xs ys

saquearCofre:: Cofre -> [Objeto]
saquearCofre (CofreC ts) = if (hayAlgunTesoro ts) then robar ts else []


robar::[Objeto] -> [Objeto]
robar [] = []
robar (x:xs) = if esTesoro x then x : robar xs else robar xs

{-- --}
ejemploTesorosPorNivel = tesorosPorNivel (Bifurcacion (CofreC [Chatarra, Tesoro, Tesoro]) 
    (Bifurcacion (CofreC [Chatarra]) 
        (Fin (CofreC [Chatarra])) 
        (Fin (CofreC [Tesoro, Tesoro, Tesoro]) ))
    (Fin (CofreC [Chatarra, Tesoro])))

-- devuelve [[Tesoro, Tesoro], [Tesoro], [Tesoro, Tesoro] ]


{-- 
todosLosCaminos:: Mapa -> [[Dir]]
todosLosCaminos (Fin c) = []
todosLosCaminos (Bifurcacion c m1 m2) =

ejemploTodosLosCaminos = todosLosCaminos (Bifurcacion (CofreC [Chatarra, Tesoro, Tesoro]) 
    (Bifurcacion (CofreC [Chatarra]) 
        (Fin (CofreC [Chatarra])) 
        (Fin (CofreC [Tesoro, Tesoro]) ))
    (Fin (CofreC [Chatarra, Tesoro])))
--}
--devuelve [[Izq], [Izq, Izq], [Izq, Der], [Der]]