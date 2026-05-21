
module Sector where

import Set
import Map

type SectorId = String
type Nombre = String
type Rango = String



data Componente = LanzaTorpedos | Motor Int | Almacen [Barril]
data Barril = Comida | Oxigeno | Torpedo | Combustible

-- Sector: contiene un ID, lista de componentes y Set de tripulantes
data Sector = Sector SectorId [Componente] (Set Nombre)
  deriving Show

-- Tripulante: contiene nombre, rango y Set de sectores asignados
data Tripulante = Tripulante Nombre Rango (Set SectorId)
  deriving Show

{- ==================== SECTOR ==================== -}

{-
    Proposito: Crea un sector vacío con el ID especificado
    PRECONDICION: -
    COSTO: O(1)
-}
crearS :: SectorId -> Sector
crearS sid = Sector sid [] emptyS

{-
    Proposito: Obtiene el ID del sector
    PRECONDICION: -
    COSTO: O(1)
-}
sectorId :: Sector -> SectorId
sectorId (Sector sid _ _) = sid

{-
    Proposito: Obtiene la lista de componentes del sector
    PRECONDICION: -
    COSTO: O(1)
-}
componentesS :: Sector -> [Componente]
componentesS (Sector _ comps _) = comps

{-
    Proposito: Obtiene el conjunto de nombres de tripulantes asignados
    PRECONDICION: -
    COSTO: O(1)
-}
tripulantesS :: Sector -> Set Nombre
tripulantesS (Sector _ _ trips) = trips

{-
    Proposito: Agrega un componente al sector
    PRECONDICION: -
    COSTO: O(1)
-}
agregarC :: Componente -> Sector -> Sector
agregarC c (Sector sid comps trips) = Sector sid (c:comps) trips

{-
    Proposito: Agrega un tripulante al sector
    PRECONDICION: -
    COSTO: O(log T) siendo T la cantidad de tripulantes en el sector
-}
agregarT :: Nombre -> Sector -> Sector
agregarT nom (Sector sid comps trips) = Sector sid comps (addS nom trips)

{- ==================== TRIPULANTE ==================== -}

{-
    Proposito: Crea un tripulante con nombre y rango, sin sectores asignados
    PRECONDICION: -
    COSTO: O(1)
-}
crearT :: Nombre -> Rango -> Tripulante
crearT nom rng = Tripulante nom rng emptyS

{-
    Proposito: Asigna un sector al tripulante
    PRECONDICION: -
    COSTO: O(log S) siendo S la cantidad de sectores asignados
-}
asignarS :: SectorId -> Tripulante -> Tripulante
asignarS sid (Tripulante nom rng sectores) = Tripulante nom rng (addS sid sectores)

{-
    Proposito: Obtiene el conjunto de sectores asignados al tripulante
    PRECONDICION: -
    COSTO: O(1)
-}
sectoresT :: Tripulante -> Set SectorId
sectoresT (Tripulante _ _ sectores) = sectores

{-
    Proposito: Obtiene el nombre del tripulante
    PRECONDICION: -
    COSTO: O(1)
-}
nombre :: Tripulante -> Nombre
nombre (Tripulante nom _ _) = nom

{-
    Proposito: Obtiene el rango del tripulante
    PRECONDICION: -
    COSTO: O(1)
-}
rango :: Tripulante -> Rango
rango (Tripulante _ rng _) = rng