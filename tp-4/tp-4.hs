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