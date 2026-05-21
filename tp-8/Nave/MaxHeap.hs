module MaxHeap (MaxHeap, emptyH, isEmptyH, insertH, maxH, deleteMaxH) where

data MaxHeap a = H [a]

-- O(1)
emptyH :: MaxHeap a
emptyH = H []

-- O(1)
isEmptyH :: MaxHeap a -> Bool
isEmptyH (H xs) = null xs

-- O(n) - inserta un elemento manteniendo el invariante MaxHeap
insertH :: Ord a => a -> MaxHeap a -> MaxHeap a
insertH x (H xs) = H (insertarOrd x xs)

-- O(1)
maxH :: Ord a => MaxHeap a -> a
maxH (H xs) = maximum xs

-- O(n)
deleteMaxH :: Ord a => MaxHeap a -> MaxHeap a
deleteMaxH (H xs) = H (borrarMax xs)

-- ==========================
-- Auxiliares
-- ==========================

-- O(n)
insertarOrd :: Ord a => a -> [a] -> [a]
insertarOrd x [] = [x]
insertarOrd x (y:ys)
  | x >= y    = x : y : ys
  | otherwise = y : insertarOrd x ys

-- O(n)
borrarMax :: Ord a => [a] -> [a]
borrarMax xs = borrar (maximum xs) xs

-- O(n)
borrar :: Eq a => a -> [a] -> [a]
borrar x []     = []
borrar x (y:ys) = if x==y then ys else y : borrar x ys
