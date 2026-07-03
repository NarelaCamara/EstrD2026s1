import Nave


-- USUARIO
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




