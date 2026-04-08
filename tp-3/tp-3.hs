{-- PRACTICA 3 --}

{-- 1. --}

{-- Tipos recursivos simples --}

{-- 1. --}
data Color = Rojo | Azul deriving (Show, Eq)

data Celda =  Bolita Color Celda | CeldaVacia Deriving Show

