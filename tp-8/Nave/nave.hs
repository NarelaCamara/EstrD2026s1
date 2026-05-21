module Nave (
) where

import Map
import Set
import MaxHeap

type SectorId = String
type Nombre = String
type Rango = String

data Nave = N (Map SectorId Sector) (Map Nombre Tripulante) (MaxHeap Tripulante) deriving Show

{-
    INVARIANTE DE REPRENSENTACION:  
    Sea N mss mnt mh
    En mh no existen tripulantes repetidos
    Para todo tripulante que es value en mnt se encuentra en mh
    Para todo tripulante que esta en mh debe estar en mnt en el value
    Para todo tripulante t que es valor en mnt, su clave asociada es el nombre de t
-}

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(n) Lineal ->  n siendo el valor de la longitud de la lista
-}
construir :: [SectorId] -> Nave
construir (x:xs) = (N crearSectores xs) (emptyM) (emptyH)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal -> n siendo el valor de la longitud de la lista
-}
crearSectores :: [SectorId] -> Map SectorId Sector
crearSectores [] = emptyM
crearSectores (x:xs) = assocM x (crearS x) (crearSectores xs)



{-
    Proposito: 
    PRECONDICION:   
    COSTO:  
-}
ingresarT :: Nombre -> Rango -> Nave -> Nave
ingresarT n r (N mss mts mxts) = let tN = (crearT n r)
    in (N mss (assocM n tN mts) (insertH t mxts))




agregarASector :: [Componente] -> SectorId -> Nave -> Nave
agregarASector css sId (N mss mts mxts) = (N (AgregarComponentesASector sId mss)  mts mxts)


AgregarComponentesASector::[Componente] -> (Map SectorId Sector)
AgregarComponentesASector [] = 
AgregarComponentesASector (x:xs)