Type Categoria = String deriving Show
Type CaminoJ = [Categoria] deriving Show
Type Producto = String deriving Show

data MVTree = MVT (Heap (Int,Producto) )  (Map Categoria MVTree) deriving Show 
