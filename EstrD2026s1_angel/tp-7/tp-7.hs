
-- Ejericio 1
heapSort :: Ord a => [a] -> [a]
heapSort xs = pqToList (listToPQ xs)
-- O[n(log n)] por el useo de pqToList[n(log n)] y listToPQ[m(log m)]
-- en este caso n=m ya que la PQ dada a pqToList es una lista que tiene la mismca
-- cantidad de elementos de la lista dada a heapSort


listToPQ :: Ord a => [a] -> PriorityQueue a 
listToPQ xs = if null xs then emptyPQ else listToPQAux xs 

listToPQAux :: Ord a => [a] -> PriorityQueue a 
listToPQAux []     = error "lista vacía."
listToPQAux (x:[]) = insertPQ x emptyPQ
listToPQAux (x:xs) = insertPQ x (listToPQAux xs)
-- O(n * # por recursión sobre la lista de elementos dada, siendo n la cantidad de elementos de la lista
--       log m por el uso de inserPQ sobre el resultado de la recursión
--     ) n por (log m) = > n(log m)
--    en este caso la PQ en la que se usa insertPQ es la PQ resultante de la recursión por lo tanto tiee
--    la misma cantidad de elementos que la lista dada => n = m
-- n (log n) + O(1) del caso base => n(log n)
-- O[n(log n)]

pqToList :: Ord a => PriorityQueue a -> [a]
pqToList pq =
    if isEmptyPQ pq then []
                    else findMinPQ pq : pqToList (deleteMinPQ pq)
-- O(n * por recursión sobre la PQ dada, siendo n la cantidad de elementos de la PQ
--       (  1 por el uso de findMinPQ sobre el resultado de la recursión
--        + log m por el uso de deleteMinPQ sobre el resultado de la recursión
--      )) -> n * (1 + m) => n*(log m)
--    como la lista resultante es producto de la recursión sobbre la PQ, entonces la lista tiene la
--    misma cantidad de elementos de la PQ => n=m
-- n(log n) + O(1) por el caso base
-- O[n(log n)]

-- Ejercicio 2
-- 2.1.
belongsBST :: Ord a => a -> Tree a -> Bool
belongsBST _ EmptyT          = False
belongsBST e (NodeT x ti td) = 
    if e==x then True 
            else if e<x then belongsBST e ti
                        else belongsBST e td  
-- Costo: O(log N) siendo N la cantidad de elementos del árbol dado. 
-- Tiene este costo porque se recorre sola una rama del árbol de forma completa, ya que en cada nodo se elije si
-- ir a izq o der, entonces en el peor caso posible se va hasta el fondo del árbol, es decir, se recorre toda su 
-- altura h, y como N = 2^h - 1 => log2 N = h => O(h) = O(log N) 

-- 2.2.
insertBST :: Ord a => a -> Tree a -> Tree a
insertBST e EmptyT          = (NodeT e EmptyT EmptyT) 
insertBST e (NodeT x ti td) =
    if e==x then error "el elemento ya está en el BST dado" -- o (NodeT e ti td)
            else if e<x then NodeT x (insertBST e ti) td
                        else NodeT x ti (insertBST e td) 
-- Costo: O(log N)

-- 2.3.
deleteBST :: Ord a => a -> Tree a -> Tree a
deleteBST _ EmptyT          = EmptyT
deleteBST e (NodeT x ti td) = 
    if e==x then rearmarBST ti td
            else if e<x then NodeT x (deleteBST e ti) td
                        else NodeT x ti (deleteBST e td)
-- Costo: O(log N)

rearmarBST :: Ord a => Tree a -> Tree a -> Tree a
rearmarBST EmptyT bst    = bst
rearmarBST bst    EmptyT = bst
rearmarBST ti     td     = let (x, td')=splitMinBST td
                            in NodeT x ti td'
-- 2.4.
splitMinBST :: Ord a => Tree a -> (a, Tree a)
splitMinBST EmptyT              = error "el tree dado es vacío."
splitMinBST (NodeT x EmptyT td) = (x, ti)
splitMinBST (NodeT x ti td)     = let (min, ti') = splitMinBST ti
                                    in (min, NodeT x ti' td)
-- Costo: O(log N)

-- 2.5.
splitMaxBST :: Ord a => Tree a -> (a, Tree a)
splitMaxBST EmptyT              = error "el tree dado es vacío."
splitMaxBST (NodeT x ti EmptyT) = (x, ti)
splitMaxBST (NodeT x ti td)     = let (max,td')=splitMaxBST td 
                                    in (max, NodeT x ti td')
-- Costo: O(log N)

-- 2.6.
esBST :: Tree a -> Bool
esBST EmptyT          = True
esBST (NodeT x ti td) = esMayorQueTodos x ti 
                      && esMenorQueTodos x td                                                  
                      && esBST ti                         
                      && esBST td                          
-- Costo: O(N^2)

esMayorQueTodos :: Tree a -> Bool
esMayorQueTodos EmptyT     =
esMayorQueTodos (NodeT x )

-- 2.7
elMaximoMenorA :: Ord a => a -> Tree a -> Maybe a
 -- PROP.: dado un BST y un elemento, devuelve el máximo elemento que sea menor al elemento dado.
elMaximoMenorA _ EmptyT           = Nothing  
elMaximoMenorA x (NodeT x' ti td) = 
                 if x<=x' then elMaximoMenorA x ti
                          else case elMaximoMenorA x td of 
                            Nothing -> Just x' 
                            Just _  -> elMaximoMenorA x td  

-- 2.8 
elMinimoMayorA :: Ord a => a -> Tree a -> Maybe a
-- PROP.: dado un BST y un elemento, devuelve el mínimo elemento que sea mayor al elemento dado.
elMinimoMayorA _ EmptyT           = Nothing  
elMinimoMayorA x (NodeT x' ti td) = 
                 if x>=x' then elMinimoMayorA x td
                          else case elMinimoMayorA x ti  of 
                            Nothing -> Just x'
                            Just y  -> Just y

-- 2.9 
balanceado :: Tree a -> Bool
-- PROP.: indica si el árbol está balanceado. Un árbol está balanceado cuando para cada nodo la diferencia de alturas entre el subarbol izquierdo y el derecho es menor o igual a 1.
balanceado EmptyT          = True 
balanceado (NodeT x ti td) = estanBalanceados ti td 
                     && balanceado ti
                     && balanceado td

-- O(N * # por recursión sobre el árbol dado
--   m # por '+'[O(1)] y 'max'[O(1)] sobre el resultado de la recursión.
-- ) -> N * m = N * (1 + 1) = 2N => N
-- O(N)
altura :: Tree a -> Int 
altura EmptyT          = 0
altura (NodeT _ ti td) = 1 + max (altura ti) (altura td)

-- O(1)
estanBalanceados :: Tree a -> Tree a -> Bool 
estanBalanceados t t' = abs (altura t - altura t') <= 1  

-- Ejercicio 5 =================================================================================================================
type SectorId = Int
type CUIL = Int

-- 5.1 -------------------------------------------------------------------------------------------------------------
-- O(
comenzarCon :: [SectorId] -> [CUIL] -> Empresa
-- Propósito: construye una empresa con la información de empleados dada. Los sectores no tienen empleados.
comenzarCon ids cs = construirE cs (construirS ids consEmpresa)

construirS :: [SectorId] -> Empresa -> Empresa
construirS []       e = e 
construirS (id:ids) e = construirS ids (agregarSector id e)

-- O(n * por recursión sobre la lista de cuils dada, sinedo n la cantidad de cuils
--      # O(E + s * (log S + log E)) por el uso de agregar empleado)
-- n * (E + s * (log S + log E)), como la lista que se le pasa a agregarEmpleado es vacía s = 0
-- O(n*E)
construirE :: [CUIL] -> Empresa -> Empresa
construirE []     e = e 
construirE (c:cs) e = construirE cs (agregarEmpleado [] c e)
 
-- 5.2 -------------------------------------------------------------------------------------------------------------
-- O(
recorteDePersonal :: Empresa -> Empresa
-- Propósito: dada una empresa elimina a la mitad de sus empleados (sin importar a quiénes).
recorteDePersonal e = let planta = todosLosCUIL e
                       in despedirMitad planta ((length planta)/2) e

despedirMitad :: [CUIL] -> Int -> Empresa -> Empresa 
despedirMitad _      0 e = e 
despedirMitad (c:cs) x e = despedirMitad cs (x-1) (borrarEmpleado c e) 
         
-- 5.3 -------------------------------------------------------------------------------------------------------------
-- O 
convertirEnComodin :: CUIL -> Empresa -> Empresa
convertirEnComodin c e = agregarEmpleado (todosLosSectores e) c e
-- 5.4 -------------------------------------------------------------------------------------------------------------
-- O 
esComodin :: CUIL -> Empresa -> Bool
-- Propósito: dado un CUIL de empleado indica si el empleado está en todos los sectores.
esComodin c e = estaEnTodos (buscarPorCUIL c e) (todosLosSectores e)

estaEnTodos :: Empleado -> [SectorId] -> Bool 
estaEnTodos _ []       = True 
estaEnTodos e (id:ids) = elem id (sectores e) && estaEnTodos e ids 

     