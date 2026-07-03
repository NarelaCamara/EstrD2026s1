module Tripulante (
    Tripulante,
    crearT,
    asignarS,
    sectoresT,
    nombre,
    rango
) where

import Set
import Tipos


data Tripulante = T Nombre Rango (Set SectorId) deriving (Show, Eq, Ord)

{-
    Proposito:
    PRECONDICION:
    COSTO: O(1) es constante
-}
crearT :: Nombre -> Rango -> Tripulante
crearT n r = T n r emptyS

{-
    Proposito:
    PRECONDICION:
    COSTO: O(log S) siendo S la cantidad de Sectores del Set
-}
asignarS :: SectorId -> Tripulante -> Tripulante
asignarS s (T n r ss) = T n r (addS s ss)

{-
    Proposito:
    PRECONDICION:
    COSTO: O(1) es constante
-}
sectoresT :: Tripulante -> Set SectorId
sectoresT (T n r ss) = ss

{-
    Proposito:
    PRECONDICION:
    COSTO: O(1) es constante
-}
nombre :: Tripulante -> Nombre
nombre (T n r ss) = n

{-
    Proposito:
    PRECONDICION:
    COSTO: O(1) es constante
-}
rango :: Tripulante -> Rango
rango (T n r ss) = r
