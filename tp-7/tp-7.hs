import Map
import Empleado
import Empresa
import Set
{-- PRACTICA 7 --}

{-- 1. --}
{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n^2) Cuadratico

    heapSort::Ord a => [a] -> [a]
heapSort xs = toListPQ (createPQ xs)  

{-- Ejemplo de uso --}
heapSortEjemplo = heapSort [12,666,1,2,3,18,8]

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(n) Lineal  = 
-}

createPQ ::Ord a => [a] -> PriorityQueue a
createPQ [] = emptyPQ
createPQ (x:xs) = insertPQ x (createPQ xs)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) constante +  O(1) constante +   O(log n) logatirmo +  O(1) constante
-}
toListPQ ::Ord a => PriorityQueue a -> [a]
toListPQ pq = if isEmptyPQ pq then [] else (findMinPQ pq) : (toListPQ (deleteMinPQ pq) ) 


-}


{-- 2. --}
data Tree a = EmptyT | NodeT a (Tree a) (Tree a)
    deriving Show

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(1) Constante +  O(log n) logatirmo 
-}
belongsBST :: Ord a => a -> Tree a -> Bool
belongsBST _ EmptyT = False
belongsBST e (NodeT n t1 t2) = (e == n) || (belongsBST e (elegirRama (e < n) t1 t2)) 

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}

elegirRama:: Bool -> Tree a -> Tree a -> Tree a
elegirRama True t1 t2 = t1
elegirRama False t1 t2 = t2

{-- RAROO 
ejemploTreeBST = NodeT 12 (NodeT 8 EmptyT EmptyT) (NodeT 18 EmptyT EmptyT)

Porque este ejemplo no es un arbol bST, Ya que en los bst el root debe ser el menor de los nodos, y en este caso el root es 12, pero el nodo 8 es menor que el root, entonces no cumple con la propiedad de los bst.--}


{--Ejemplo de uso --}
ejemploTreeBST = NodeT 12 (NodeT 8 (NodeT 4 EmptyT EmptyT) (NodeT 10 EmptyT EmptyT)) (NodeT 18 (NodeT 16 EmptyT EmptyT) (NodeT 25 EmptyT EmptyT))
belongsBSTEjemplo = belongsBST 19 ejemploTreeBST

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante +  O(1) Constante +  O(1) Constante +  O(log n) logatirmo =  O(log n) logatirmo
-}

insertBST :: Ord a => a -> Tree a -> Tree a
insertBST e EmptyT = (NodeT e EmptyT EmptyT)
insertBST e (NodeT n t1 t2) = 
    if (e == n) then (NodeT n t1 t2) else (if (e < n) then (NodeT n (insertBST e t1) t2) else (NodeT n t1 (insertBST e t2)))

{--Ejemplo de uso --}
insertBSTEjemplo = insertBST 2 (insertBST 14 ejemploTreeBST)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
deleteBST :: Ord a => a -> Tree a -> Tree a
deleteBST e EmptyT = EmptyT
deleteBST e (NodeT n t1 t2) = if (e == n) then (refactor t1 t2) else (if (e < n) then (NodeT n (deleteBST e t1) t2) else (NodeT n t1 (deleteBST e t2)))


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
refactor :: Tree a -> Tree a -> Tree a
refactor EmptyT t2 = t2
refactor t1 EmptyT = t1 
refactor (NodeT e t11 t12) t2 = (NodeT e (refactor t11 t12) t2)

{--Ejemplo de uso --}
deleteBSTEjemplo = deleteBST 18 ejemploTreeBST


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
splitMinBST :: Ord a => Tree a -> (a, Tree a)
splitMinBST t = let min = (findMin t) in (min, (deleteBST min t))

{--Ejemplo de uso --}
splitMinBSTEjemplo = splitMinBST ejemploTreeBST

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
findMin::Ord a => Tree a -> a 
findMin (NodeT e EmptyT _) = e
findMin (NodeT e t1 _) = findMin t1 

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
splitMaxBST :: Ord a => Tree a -> (a, Tree a)
splitMaxBST t = let max = (findMax t) in (max,deleteBST max t)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
findMax::Ord a => Tree a -> a 
findMax (NodeT e _ EmptyT) = e
findMax (NodeT e _ t2) = findMax t2 


{--Ejemplo de uso --}
splitMaxBSTEjemplo = splitMaxBST ejemploTreeBST

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal
-}
esBST :: Ord a => Tree a -> Bool
esBST (NodeT e t1 t2) = (allMin e t1) && (allMax e t2)
esBST _ = True 

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal
-}
allMin:: Ord a => a -> Tree a -> Bool
allMin _ EmptyT = True 
allMin maxVal (NodeT n t1 t2) =
    (n < maxVal) &&
    allMin n t1 &&
    allMax n t2 

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal
-}
allMax:: Ord a => a -> Tree a -> Bool
allMax _ EmptyT = True 
allMax minVal (NodeT n t1 t2) =
    (n > minVal) &&
    allMin n t1 &&
    allMax n t2

{--Ejemplo de uso --}
esBSTEjemplo = esBST ejemploTreeBST

{-
    Proposito:  Propósito : dado un BST y un elemento, devuelve el máximo elemento que sea menor al
elemento dado
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
elMaximoMenorA:: Ord a => a -> Tree a -> Maybe a
elMaximoMenorA e EmptyT = Nothing
elMaximoMenorA e (NodeT n t1 t2) = if (esLaRamaMenorMasCercana e n t1 t2) then (Just n) else (elMaximoMenorA e (elegirRama (e < n) t1 t2))

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
esLaRamaMenorMasCercana ::Ord a => a -> a -> Tree a -> Tree a -> Bool
esLaRamaMenorMasCercana e n t1 t2 = e > n && esMenor e (root t2)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
esMenor::Ord a => a -> Maybe a -> Bool
esMenor e Nothing = True
esMenor e (Just n) = n < e

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
root:: Tree a -> Maybe a
root EmptyT = Nothing
root (NodeT n t1 t2) = (Just n)


{--Ejemplo de uso --}
{--
          12
         /  \
        8    18
       / \   / \
      4  10 16 25
--}
elMaximoMenorAEjemplo = elMaximoMenorA 17 ejemploTreeBST -- 16

{-
    Proposito: dado un BST y un elemento, devuelve el mínimo elemento que sea mayor al
elemento dado
    PRECONDICION:   
    COSTO:   O(1) Constante +  O(1) Constante +  O(log n) logatirmo
-}

elMinimoMayorA:: Ord a => a -> Tree a -> Maybe a
elMinimoMayorA e EmptyT = Nothing
elMinimoMayorA e (NodeT n t1 t2) = if (esLaRamaMayorMasCercano e n t1 t2) then (Just n) else (elMinimoMayorA e (elegirRama (e < n) t1 t2))

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
esLaRamaMayorMasCercano ::Ord a => a -> a -> Tree a -> Tree a -> Bool
esLaRamaMayorMasCercano e n t1 t2 = e <= n && esMayor e (root t1)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
esMayor::Ord a => a -> Maybe a -> Bool
esMayor e Nothing = True
esMayor e (Just n) = e > n

{--Ejemplo de uso --}
{--
          12
         /  \
        8    18
       / \   / \
      4  10 16 25
--}
elMinimoMayorAEjemplo = elMinimoMayorA 17 ejemploTreeBST  -- 18


{-
    Proposito: 
    PRECONDICION:   
    COSTO:  
-}

ejemploTreeNoBalanceado :: Tree Int
ejemploTreeNoBalanceado =
    NodeT 12
        (NodeT 8
            (NodeT 4
                (NodeT 2 EmptyT EmptyT)
                EmptyT
            )
            (NodeT 10 EmptyT EmptyT)
        )
        (NodeT 18 EmptyT EmptyT)

ejemploBalanceado1 :: Tree Int
ejemploBalanceado1 =
    NodeT 12
        (NodeT 8 (NodeT 4 EmptyT EmptyT) (NodeT 10 EmptyT EmptyT))
        (NodeT 18 (NodeT 16 EmptyT EmptyT) (NodeT 25 EmptyT EmptyT))

ejemploNoBalanceado1 :: Tree Int
ejemploNoBalanceado1 =
    NodeT 12
        (NodeT 8
            (NodeT 4
                (NodeT 2 EmptyT EmptyT)
                EmptyT
            )
            EmptyT
        )
        (NodeT 18 EmptyT EmptyT)
{--
          12
         /  \
        8    18
       /
      4
     /
    2
--}

{--
          12
         /  \
        8    18
       / \
      4  10
     /
    2
--}

{--
          10
         /  \
        5    15
       /
      2
     /
    1
--}

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal

-}
balanceado:: Tree a -> Bool
balanceado EmptyT = True
balanceado (NodeT n t1 t2) = (esMenorOIgualAUno (altura t1) (altura t2)) && balanceado t1 && balanceado t2

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
esMenorOIgualAUno:: Int -> Int -> Bool
esMenorOIgualAUno nt1 nt2 = abs (nt1 - nt2) <= 1


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal
-}
altura:: Tree a -> Int 
altura EmptyT = 0
altura (NodeT n t1 t2) = 1  + (max (altura t1) (altura t2)) 

{--Ejemplo de uso --}
balanceadoEjemplo = balanceado ejemploNoBalanceado1

{-- 5. --}
{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(sc) Lineal  -> donde sc es la suma de las longitudes de las listas sectores y cuils 
-}
comenzarCon :: [SectorId] -> [CUIL] -> Empresa 
comenzarCon sss css = agregarEmpleados css (agregarSectores sss consEmpresa)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo +  O(s) Lineal -> depende de la longitud de sectores
-}
agregarSectores:: [SectorId] -> Empresa -> Empresa
agregarSectores [] em = em 
agregarSectores (s:ss) em = agregarSector s (agregarSectores ss em)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(1) Constante +  O(c) Lineal -> Depende de la longitud de la lista de Cuils -> 
-}

agregarEmpleados:: [CUIL] -> Empresa -> Empresa
agregarEmpleados [] em = em
agregarEmpleados (c:css) em = agregarEmpleado [] c (agregarEmpleados css em) 

{--Ejemplo de uso --} -- RAROO
comenzarConEjemplo = comenzarCon [1111, 2222, 3333] [4444, 5555, 6666] 


{-
    Proposito: 
    PRECONDICION:   
    COSTO:  
-}
recorteDePersonal :: Empresa -> Empresa
recorteDePersonal em = rearmarEmpresa (eliminarLaMitad (todosLosCUIL em)) em

{--Ejemplo de uso --}
empresaEjemplo = agregarEmpleado [2222, 1111] 8888 (agregarEmpleado [2222] 7777 (agregarEmpleado [1111] 6666 (agregarEmpleado [1111] 5555 (agregarSectores [1111, 2222, 3333, 4444] consEmpresa))))
recorteDePersonalEjemplo = recorteDePersonal empresaEjemplo

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  
-}
rearmarEmpresa:: [CUIL] -> Empresa -> Empresa 
rearmarEmpresa [] em = em
rearmarEmpresa (c:css) em = borrarEmpleado c (rearmarEmpresa css em)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante -> por elc calculo + el  O(n) Lineal 
-}
eliminarLaMitad:: [CUIL] -> [CUIL]
eliminarLaMitad css = elimnarCantidad (length css `div` 2) css

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal -> n es el valor de el numero n
-}
elimnarCantidad:: Int ->  [CUIL] -> [CUIL]
elimnarCantidad 0 css = css 
elimnarCantidad n (c:css) = elimnarCantidad (n-1) css


{-
    Proposito: 
    PRECONDICION:   
    COSTO:  
-}
convertirEnComodin :: CUIL -> Empresa -> Empresa
convertirEnComodin c em = agregarleSectoresAEmpleado c (todosLosSectores em) em


agregarleSectoresAEmpleado::CUIL -> [SectorId] -> Empresa -> Empresa
agregarleSectoresAEmpleado c [] em = em 
agregarleSectoresAEmpleado c (s:ss) em = agregarASector s c (agregarleSectoresAEmpleado c ss em )


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(n) Lineal 
-}

esComodin :: CUIL -> Empresa -> Bool
esComodin c em = estaEnTodosLosSectores (buscarPorCUIL c em) (todosLosSectores em) 

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(s) Lineal -> s siendo el largo de la lista de sectores
-}
estaEnTodosLosSectores :: Empleado -> [SectorId] -> Bool
estaEnTodosLosSectores e [] = True
estaEnTodosLosSectores e (x:xs) =  x  `elem` (sectores e) && (estaEnTodosLosSectores e xs) 


