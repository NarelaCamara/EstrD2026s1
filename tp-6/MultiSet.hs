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
data MultiSet a = MS a deriving Show