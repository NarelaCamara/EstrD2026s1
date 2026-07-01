module Empleado (
    Nave, construir, ingresarT
    )
where

import Map
import MaxHeap

data Nave = N (Map SectorId Sector) (Map Nombre Tripulante) (MaxHeap Tripulante) deriving (Show, Eq)


{-
    INVARIANTE DE REPRENSENTACION:  
    El tipo  SectorId identifica a un solo sector y no se repiten en mas de un tipo SectorId
    El tipo Nombre identifica a un solo Tripulante y no se repiten en mas de un tipo Tripulante
    Los tipo Tripulantes no necesariamente existen en el tipo Sector  
    En el MaxHeap los tripulantes no se repiten y son los mismos que en el Map de tripulantes
-}

// costo: O(S), lineal por addSectores que tiene un costo O(S), siendo S el largo de la lista del tipo SectorId
construir:: [SectorId] -> Nave
construir ss = (N (addSectores ss emptyM) emptyM emptyH)

// costo:  O(S), lineal, siendo S el largo de la lista del tipo SectorId
addSectores:: [SectorId] -> Map SectorId Sector -> Map SectorId Sector 
addSectores [] = emptyM
addSectores (x:xs) = assocM x (addSectores xs) 

// costo: O(log T), siendo T el valor de K + M, donde assocM tiene un costo O(log k) siendo k las keys del map de SectorId y sumado a que insertH tiene un costo de O(log M) siendo M el largo logaritmico
ingresarT:: Nombre -> Rango -> Nave -> Nave
ingresarT n r (N ss nt ts) = 
    let t = (creatT n r) in (N ss (assocM n t nt) (insertH t ts) 

// costo: O(log M), siendo M el valor de K, lookupM tiene un costo O(log k) siendo k la cantidad de keys del map y sumado a sectoresT tiene un costo de constante O(1)
sectoresAsignados:: Nombre -> Nave -> Set SectorId
sectoresAsignados n (N ss nt ts) = case lookupM n nt on 
Just t -> sectoresT t
Nothing -> error "el Nombre debe  existir en la nave"

// costo: O(log S), siendo S la suma de K + funciones constantes que suman pero no lo suficiente para modificar el costo principal, lookupM teniendo un costo de O(log K), tripulantesS y ComponenteS ambas siendo constantes, no modifican en gran medida los costos en general
datosDeSector : SectorId -> Nave -> (Set Nombre, [Componente])
datosDeSector sId (N ss nt ts) =  
    let s = lookupM sId ss in ((tripulantesS s), (ComponenteS s))  