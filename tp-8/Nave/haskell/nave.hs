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
        COSTO: O(log K + log M) donde:
            - K es la cantidad de claves en `mts` (map de tripulantes)
            - M es la cantidad de elementos en `mxts` (heap de tripulantes)
        Detalle: `crearT` es O(1) (construcción del tripulante),
                        `assocM` cuesta O(log K) y `insertH` cuesta O(log M),
                        por lo tanto la operación total es O(log K + log M).
-}
ingresarT :: Nombre -> Rango -> Nave -> Nave
ingresarT n r (N mss mts mxts) = let tN = (crearT n r)
    in (N mss (assocM n tN mts) (insertH t mxts))


{-
    Proposito: 
    PRECONDICION: Debe existe el nombre de ese tripulante en del map
    COSTO:  O(log L) siendo L -> K + 1 
        - lookupM cuesta O(log K) siendo K el valor de las clave del map
        - sectoresT cuesta constante O(1)
-}

sectoresAsignados :: Nombre -> Nave -> Set SectorId
sectoresAsignados n (N mss mts mxts) = 
    case lookupM n mts of
        Nothing -> Error "No existe ese tripulante"
        Just t  -> sectoresT t


{-
    Proposito: 
    PRECONDICION: Debe existir el sectorId en la nave   
    COSTO:  O(log L) siendo L -> K +1 +1
        - lookupM O(log K) siendo K la cantidad de claves del map de sectores
        - tripulantesS y componentesS siendo ambas constantes
-}

datosDeSector :: SectorId -> Nave -> (Set Nombre, [Componente])
datosDeSector s (N mss mts mxts) = 
    case lookupM sf mss of 
        Just sf -> (tripulantesS sf, componenteS sf)
        Nothing -> Error "Debe existir un sector con dicho id"


{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(log T) -> siendo el costo de tripulantesOrd.
-}
tripulantesN :: Nave -> [Tripulante]
tripulantesN (N mss mts mxts) = tripulantesOrd mxts


{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(log T) siendo T el valor de M +1 +1
            - isEmptyH costo O(1)
            - maxH costo O(1)
            - deleteMaxH costo O (log M) M siendo la longitud del Heap Tripulantes
-}

tripulantesOrd :: MaxHeap Tripulante -> [Tripulante]
tripulantesOrd ts = if isEmptyH ts then [] else (maxH ts) : tripulantesOrd (deleteMaxH ts)




{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(C + log S) -> siendo S la union de S1 + S2
        - C el costo de addComptsASector
        - looupM O(log S1) siendo S la cantidad  de los Sectores en el map
        - assocN O(log S2) siendo S la cantidad de los Sectores en el map 
-}

agregarASector :: [Componente] -> SectorId -> Nave -> Nave
agregarASector css sId (N mss mts mxts) =
    case lookupM sId mss
    of
        Just s  -> (N (assocM sId (addComptsASector sf) mss)  mts mxts)
        Nothing -> (N mss mts mxts)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(C) C siendo C' +1
            - C' es la longitud de la lista de componentes 
            - agregarC es de costo O(1)
-}

addComptsASector::[Componente] -> Sector -> Sector
addComptsASector [] s = s 
addComptsASector (x:xs) s = agregarC x s : addComptsASector xs s



{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(log S + log T + log T) --- REVISAR
        - lookupM O(log T) siendo T la cantidad de claves del map de Tripulantes
        - asignarS O(log S) siendo S la cantidad de sectores asignados del tripulante
        - asignarEnMSS O(log S) siendo el costo de esta funcion
        - asignarEnMTS O(log T) siendo el costo de  esta funcion
        -insetH O(log T) siendo T la cantidad de tripulantes de la nave
-}

asignarASector:: Nombre-> SectorID -> Nave -> Nave
asignarASector n sId (N mss mts mxts) = 
    case lookupM n mts
    Just t' -> let t = asignarS sId t' in (N (asignarEnMSS t sId mss) (asignarEnMTS t n mts) (insertH t mxts))
    Nothing -> Error "debe existir el tripulante"


{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(log R) siendo R la union de (S1 + S2 + T)
        - lookupM O(log S1) siendo S1 la cantidad de claves del map de Sector
        - assocM O(log S2) siendo S2 la cantidad de claves del map de Sector
        - agregarT O(log T) siendo T la cantidad de del tripulantes en el sector
-}

asignarEnMSS :: Tripulante -> SectorId -> Map SectorId Sector -> Map SectorId Sector 
asignarEnMSS t sId mss = 
    case  lookupM sId mss
    Just s  -> assocM sId (agregarT n s) mss
    Nothing -> mss


{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(log T) siendo T la union de  T1 + T2
        - lookupM tiene un costo O(log T1) donde T1 es la cantidad de claves del map Tripulantes
        - assocM tiene un costo O(log T2) donde T2 es la cantidad de claves del map Tripulantes
-}

asignarEnMTS :: Tripulante -> Nombre -> Map Nombre Tripulante -> Map Nombre Tripulante 
asignarEnMTS t n mts = 
    case  lookupM n mts
    Just t  -> assocM n t mts
    Nothing -> mts
