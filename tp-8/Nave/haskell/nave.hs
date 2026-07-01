
data Nave = N (Map SectorId Sector) (Map Nombre Tripulante) (MaxHeap Tripulante)


{-
    INVARIANTE DE REPRENSENTACION:  
    El tipo  SectorId identifica a un solo sector y no se repiten en mas de un tipo SectorId
    El tipo Nombre identifica a un solo Tripulante y no se repiten en mas de un tipo Tripulante
    

-}