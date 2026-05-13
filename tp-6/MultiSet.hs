import Map

module MultiSet (
    MultiSet,
    emptyMS,
    addMS,
    ocurrencesMS,
    unionMS,
    intersectionMS,
    multiSetToList,
    multiSetEjemplo1,
    multiSetEjemplo2,
    multiSetEjemplo3
)
where
data MultiSet a = MS (Map a Int) deriving Show

{-
    INVARIANTE DE REPRENSENTACION:  
-}

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
emptyMS :: MultiSet a
emptyMS = (MS emptyM)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  Map V1 >>  O(n) Lineal
-}
addMS :: Ord a => a -> MultiSet a -> MultiSet a
addMS n (MS map) = assocM  n (fromJust''(lookupM n map))

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}

fromJust'':: Maybe Int -> Int
fromJust'' (Just e) = e
fromJust'' Nothing = 0


{-
    Proposito: 
    PRECONDICION:   
    COSTO:  
-}
ocurrencesMS :: Ord a => a -> MultiSet a -> Int
ocurrencesMS n (MS map) = 


