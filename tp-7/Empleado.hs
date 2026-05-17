import Set

module Empleado (
    Empleado,
    consEmpleado,
    CUIL,
    incorporarSector,
    sectores
    )
where

type CUIL = Int
type SectorId = String
data Empleado = E CUIL (Set SectorId) deriving Show

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
consEmpleado:: CUIL -> Empleado
consEmpleado c = (E c (emptyS))


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
CUIL:: Empleado -> CUIL
CUIL (E c _ ) = c 

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante +  O(log ss) logatirmo 
-}
incorporarSector:: :: SectorId -> Empleado -> Empleado 
incorporarSector s (E c ss ) = (E c (addS s ss))

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
sectores::  Empleado -> [SectorId]
sectores (E c ss ) = (setToList ss) 