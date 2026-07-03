import Nave


-- USUARIO
-- i
{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(S log S) 
        - siendo allSectors O(S log S)
-}
sectores:: Nave -> Set SectorId
sectores n = allSectors (tripulantesN n) n

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(s log s + t) siendo s la cantiad de sectores y siento T la cantiidad de Tripulantes de la lista
        - emptyS tiene un costo O(1)
        - unionS tiene un costo O(s log s) siendo s la cantidad de elementos del set
        - sectoresT tiene un costo O(1)
-}

allSectors:: [Tripulante] -> Nave -> Set SectorId
allSectors [] n = emptyS
allSectors (t:ts) n = unionS (sectoresT t) (allSectors ts n)  


-- j

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(T) siendo la longitud de la lista
-}

sinSectoresAsignados:: Nave -> [Tripulante]
sinSectoresAsignados n = sinSectorT (tripulantesN n)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(T) 
    - siendo T el la longitud de la lista de tripulantes
    - O(1) siendo constante
-}

sinSectorT :: [Tripulante] -> [Tripulante]
sinSectorT [] = []
sinSectorT (t:ts) = if sizeS (sectoresT t) > 0 then sinSectorT ts else t: sinSectorT ts

-- k

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  
-}
barriles:: Nave -> [Barril]
barriles n = allBarriles (setToList (sectores n)) n


allBarriles :: [SectorId] -> Nave -> [Barril]
allBarriles [] n = []
allBarriles (s:ss) n = 
    let (_, cs) = (datosDeSector s n) 
    in allBarrilesDe cs ++ allBarriles ss n 


allBarrilesDe:: [Componente] -> [Barril]
allBarrilesDe [] = []
allBarrilesDe (c:cs) = 
    case allBarril c of 
    Just b -> b :  allBarrilesDe cs 
    Nothing -> allBarrilesDe css


allBarril :: Componente -> MayBe [Barril]
allBarril Almacen xs = Just xs
allBarril _ = Nothing