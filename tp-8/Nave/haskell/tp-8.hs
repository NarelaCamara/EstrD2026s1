import Nave


-- USUARIO
{-
    Proposito: 
    PRECONDICION:   
    COSTO:  
-}
sectores:: Nave -> Set SectorId
sectores n = allSectors (tripulantesN n) n

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  
-}

allSectors:: [Tripulante] -> Nave -> Set SectorId
allSectors [] n = emptyS
allSectors (t:ts) n = unionS (sectoresT t) (allSectors ts n)  
