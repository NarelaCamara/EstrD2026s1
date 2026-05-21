module Nave (
) where

import Map
import Set
import MaxHeap

type SectorId = String
type Nombre = String
type Rango = String

data Nave = N (Map SectorId Sector) (Map Nombre Tripulante) (MaxHeap Tripulante) deriving Show

data Componente = LanzaTorpedos | Motor Int | Almacen [Barril]
data Barril = Comida | Oxigeno | Torpedo | Combustible


{-
    INVARIANTE DE REPRENSENTACION:  

* El tipo Sector es un tipo abstracto, y representa al sector de una nave, el cual contiene componentes y tripulantes asignados.
* El tipo Tripulante es un tipo abstracto, y representa a un tripulante dentro de la nave, el cual tiene un nombre, un rango y sectores asignados.
* El tipo SectorId es sinónimo de String, e identifica al sector de forma unívoca.
* Los tipos Nombre y Rango son sinónimos de String. Todos los nombres de tripulantes son únicos.
* Un sector está vacío cuando no tiene tripulantes, y la nave está vacía si no tiene ningún tripulante.
* Puede haber tripulantes sin sectores asignados.
-}

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  
-}
construir :: [SectorId] -> Nave
construir [] = (N )
construir (x:xs) =