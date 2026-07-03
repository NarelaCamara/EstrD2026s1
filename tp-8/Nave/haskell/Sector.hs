module Sector (
    Sector, 
    crearS,
    sectorId,
    componenteS,
    tripulantesS,
    agregarC,
    agregarT
) where

import Set
import Tipos


data Sector = S SectorId (Set Nombre) [Componente]  deriving Show


{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(1) constante
-}
crearS :: SectorId -> Sector
crearS sId = (S sId emptyS [])

{-
    Proposito: 
    PRECONDICION:   
    COSTO: O(1) constante
-}
sectorId :: Sector -> SectorId 
sectorId (S sId _ _) = sId

{-
    Proposito: 
    PRECONDICION:   
    COSTO: O(1) constante
-}
componenteS :: Sector -> [Componente]
componenteS (S sId _ cs) = cs


{-
    Proposito: 
    PRECONDICION:   
    COSTO: O(1) constante
-}
tripulantesS :: Sector -> Set Nombre
tripulantesS (S sId ts _) = ts

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(1) constante
-}
agregarC :: Componente -> Sector -> Sector
agregarC c (S sId ts cs) = (S sId ts (c:cs))

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(log T) siendo T la longitud de tripulantes
-}
agregarT :: Nombre -> Sector -> Sector
agregarT n (S sId ts cs) =  (S sId (addS n ts) cs)