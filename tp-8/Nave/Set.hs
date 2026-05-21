module Set (Set, emptyS, addS, belongsS, unionS, removeS, setToList, sizeS) where

data Tree a = EmptyT | NodeT a (Tree a) (Tree a)

data Set a  = S (Tree a) Int
  {- INV.REP.: en (S t n), t cumple ser un BST y n es el sizeT t -}

-- O(1)
emptyS   :: Set a
emptyS = S EmptyT 0

-- O(log N) en promedio
addS     :: Ord a => a -> Set a -> Set a
addS x (S t n) = armarS (insertarBST x (t,n))

-- O(log N) en promedio
belongsS  :: Ord a => a -> Set a -> Bool
belongsS x (S t _) = buscarBST x t

-- O(N log N) en promedio
unionS :: Ord a => Set a -> Set a -> Set a
unionS (S t1 _) (S t2 n2) = armarS (agregarTodos (inorder t1) t2 n2)

-- O(log N) en promedio
removeS  :: Ord a => a -> Set a -> Set a
removeS x (S t n) = armarS (borrarBST x (t,n))

-- O(N)
setToList :: Ord a => Set a -> [a]
setToList (S t _) = inorder t

-- O(1)
sizeS :: Set a -> Int
sizeS (S _ n) = n

-- ==========================
-- Auxiliares
-- ==========================
armarS (t, n) = S t n

-- O(log N) en promedio
buscarBST :: Ord a => a -> Tree a -> Bool
  -- PRECOND: el árbol es BST
buscarBST x EmptyT          = False
buscarBST x (NodeT y ti td) =
    if (x == y)      then True
     else if (x < y) then buscarBST x ti
                     else buscarBST x td

-- O(log N) en promedio
insertarBST :: Ord a => a -> (Tree a, Int) -> (Tree a, Int)
  -- PRECOND: el árbol es BST
insertarBST x (EmptyT       , n) = (NodeT x EmptyT EmptyT, n+1)
insertarBST x (NodeT y ti td, n) =
    if (x==y)        then (NodeT x ti td, n)
     else if (x < y) then armarNodeIzq y (insertarBST x (ti, n)) td
                     else armarNodeDer y ti (insertarBST x (td, n))

armarNodeIzq y (ti', n') td = (NodeT y ti' td, n')
armarNodeDer y ti (td', n') = (NodeT y ti td', n')

-- O(log N) en promedio
borrarBST :: Ord a => a -> (Tree a, Int) -> (Tree a, Int)
  -- PRECOND: el árbol es BST
borrarBST _ (EmptyT       , n) = (EmptyT, n)
borrarBST x (NodeT y ti td, n) =
    if (x==y)        then (rearmarBST ti td, n-1)
     else if (x < y) then armarNodeIzq y (borrarBST x (ti, n)) td
                     else armarNodeDer y ti (borrarBST x (td, n))

rearmarBST :: Ord a => Tree a -> Tree a -> Tree a
  -- PRECOND: los dos árboles son BSTs
rearmarBST EmptyT td = td
rearmarBST ti     td = let (m, ti') = splitMaxBST ti
                        in NodeT m ti' td

splitMaxBST :: Ord a => Tree a -> (a, Tree a)
  -- PRECOND: el árbol es BST, y NO está vacío
splitMaxBST (NodeT x ti EmptyT) = (x, ti)  
splitMaxBST (NodeT x ti td)     = let (m, td') = splitMaxBST td
                                   in (m, NodeT x ti td')

-- O(N)
inorder :: Tree a -> [a]
inorder EmptyT          = []
inorder (NodeT x ti td) = inorder ti ++ [x] ++ inorder td

agregarTodos :: Ord a => [a] -> Tree a -> Int -> (Tree a, Int)
agregarTodos []     t n = (t,n)
agregarTodos (x:xs) t n = insertarBST x (agregarTodos xs t n)
