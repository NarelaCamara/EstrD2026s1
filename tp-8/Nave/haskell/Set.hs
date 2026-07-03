module Set(
    Set,
    emptyS,
    addS,
    belongsS,
    sizeS,
    removeS,
    unionS,
    setToList 
)
where 

data Set a = Set [a] deriving (Show, Eq, Ord)

{--
    Proposito: Devulve un set vacio
    PRECONDICION: ninguna
    COSTO: O(1) Constante porque solo se hace una operacion
--}
emptyS :: Set a
emptyS = (Set [])

{--
    Proposito: Añade un elemento al Set dado, si el elemento ya pertenece al Set, no se hace nada
    PRECONDICION: no pueden ser elementos no comparables.
    COSTO: O(n) Lineal porque en el peor caso se recorre toda la lista para verificar si el elemento ya pertenece al Set, y luego se agrega al principio de la lista si no pertenece.
--}
addS:: Eq a => a -> Set a -> Set a
addS x (Set []) = Set [x]
addS x (Set xs) = if pertenece x xs then Set xs else Set (x:xs)

{-- 
    Con este ejemplo se lo utiliza para la precondicion - no pueden ser elementos no comparables - 
    porque 'a' no es comparable con los elementos del Set.
    addSEjemplo = addS 'a' (Set [1,2,3,4]) 
--}

{--
    Proposito: Determina si un elemento pertenece al Set
    PRECONDICION: no pueden ser elementos no comparables.
    COSTO: O(1) + O(n) Lineal, la suma del caso base y la recursividad, porque en el peor caso se recorre toda la lista para verificar si el elemento pertenece al Set.
--}
belongsS :: Eq a => a -> Set a -> Bool
belongsS x (Set []) = False
belongsS x (Set xs) = pertenece x xs

pertenece::Eq a => a -> [a]-> Bool
pertenece y [] = False
pertenece y (x:xs) = y == x || pertenece y xs

{--
    Proposito: Determina el tamaño del Set.
    PRECONDICION: ninguna
    COSTO:  O(1) + O(n) Lineal, la suma del caso base y la recursividad, porque se recorre toda la lista para contar los elementos.
--}

sizeS :: Eq a => Set a -> Int
sizeS (Set xs) = longitud xs  

longitud:: Eq a => [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

{--
    Proposito: Elimina un elemento del Set dado.
    PRECONDICION: ninguna
    COSTO: O(1) +  O(n) Lineal, la suma del caso base y la recursividad, porque se recorre toda la lista para encontrar y eliminar el elemento.
--}

removeS :: Eq a => a -> Set a -> Set a
removeS x (Set xs) = Set (remove x xs)

remove:: Eq a => a -> [a] -> [a]
remove x [] = []
remove y (x:xs) = if y == x then remove y xs else x : remove y xs

{--
    Proposito: Devuelve la unión de dos Sets.
    PRECONDICION: Deven ser Sets del mismo tipo, y no pueden contener elementos no comparables.
    COSTO: O(1) + O(n*n) = O(n^2)  Cuadrativo porque se recorre una vez la lista ys para verificar si ele elemento de xs puede agregarse a la nueva lista.
--}
unionS :: Eq a => Set a -> Set a -> Set a
unionS (Set xs) (Set ys) = (Set (unirSinRepetidos xs ys)) 

unirSinRepetidos::  Eq a => [a] -> [a]-> [a]
unirSinRepetidos [] ys = ys
unirSinRepetidos (x:xs) ys = if pertenece x ys then unirSinRepetidos xs ys else x : unirSinRepetidos xs ys

{--
    Proposito: Devuelve una lista con los elementos del Set.
    PRECONDICION: ninguna
    COSTO: O(1) Constante porque solo se devuelve la lista interna del Set.
--}
setToList :: Eq a => Set a -> [a]
setToList (Set xs) = xs
