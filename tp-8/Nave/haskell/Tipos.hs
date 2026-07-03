module Tipos (
    SectorId,
    Nombre,
    Rango,
    Componente(..),
    Barril(..)
) where

type SectorId = String
type Nombre = String
type Rango = String

data Barril = Comida | Oxigeno | Torpedo | Combustible deriving (Show, Eq)
data Componente = LanzaTorpedos | Motor Int | Almacen [Barril] deriving (Show, Eq)
