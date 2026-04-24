module Set(
    Set,
    emptyS,
    addS,
    belongs,
    sizeS,
    removeS,
    unionS,
    setToList 
)
where 

data Set a = Set [a]  deriving Show  

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
emptyS :: Set a
emptyS = (Set [])

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
addS:: Eq a => a -> Set a -> Set a
addS x (Set []) = Set [x]
addS x (Set xs) = if pertenece x xs then Set xs else Set (x:xs)

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
belongs :: Eq a => a -> Set a -> Bool
belongs x (Set []) = False
belongs x (Set xs) = pertenece x xs

pertenece::Eq a => a -> [a]-> Bool
pertenece y [] = False
pertenece y (x:xs) = y == x || pertenece y xs

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}

sizeS :: Eq a => Set a -> Int
sizeS (Set xs) = longitud xs  

longitud:: Eq a => [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}

removeS :: Eq a => a -> Set a -> Set a
removeS x (Set xs) = Set (remove x xs)

remove:: Eq a => a -> [a] -> [a]
remove x [] = []
remove y (x:xs) = if y == x then remove y xs else x : remove y xs

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
unionS :: Eq a => Set a -> Set a -> Set a
unionS (Set xs) (Set ys) = (Set (unirSinRepetidos xs ys)) 

unirSinRepetidos::  Eq a => [a] -> [a]-> [a]
unirSinRepetidos [] ys = ys
unirSinRepetidos (x:xs) ys = if pertenece x ys then unirSinRepetidos xs ys else x : unirSinRepetidos xs ys

{--
    Proposito: 
    PRECONDICION: 
    COSTO: 
--}
setToList :: Eq a => Set a -> [a]
setToList (Set xs) = xs
