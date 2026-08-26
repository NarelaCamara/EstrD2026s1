module MapV1
  (Map, emptyM, assocM, lookupM, deleteM, keys)
 where

data Map k v = M [(k,v)]
    deriving Show
  {- INV.REP.: en M kvs:
       * no hay claves repetidas en kvs.  
   -}

emptyM  :: Map k v
  -- PROP.: describir un map vacío.

assocM  :: Ord k => k -> v -> Map k v -> Map k v
  -- PROP.: describir el map dado con la asociación de la clave y valor dados
  -- (si estaba asociada a otra cosa, solamente vale la última asociación)

lookupM :: Ord k => k -> Map k v -> Maybe v
  -- PROP.: describir el valor asociado a la clave en el map en caso que exista, sino Nothing. 

deleteM :: Ord k => k -> Map k v -> Map k v
  -- PROP.: describir el map dado, sin la asociación de la clave dada.

keys     :: Ord k => Map k v -> [k] -- domM
  -- PROP.: describir la lista de todas las claves definidas en el map, sin repetidos (el dominio del map)


emptyM              = M []                -- O(1)         
assocM  k v (M kvs) = M (asociar k v kvs) -- O(n) siendo n las k del map.  
lookupM k   (M kvs) = buscar k kvs        -- O(n) siendo n las k del map.                 
deleteM k   (M kvs) = M (borrar k kvs)    -- O(n) siendo n las k del map.     
keys        (M kvs) = claves kvs          -- O(n) siendo n las k del map.                           

------------------------------------------------------------------------------------------------------------------------------------
-- O(n * # por recursión sobre la lista de duplas (k,v) dada, siendo n la cantidad de duplas clave,valor
--       (  1 por el uso de "==" sobre el resultado de la recursión
--        + 1 por el uso de "cons" sobre el resultado de la recursión
--        )
--   ) -> n * (1 + 1) => n * 2 => 2n => n
-- O(n) + O(1) por el caso base, ya que en el peor caso se recorre toda la lista de kvs sin que esté
-- O(n)
asociar :: Ord k => k -> v -> [(k,v)] -> [(k,v)]
asociar k v []            = (k,v):[] -- O(1)
asociar k v ((k',v'):kvs) = 
    if k==k' then (k,v) : kvs 
             else (k',v') : asociar k v kvs
------------------------------------------------------------------------------------------------------------------------------------
-- O(n * # por recursión sobre la lista de duplas (k,v) dada, siendo n la cantidad de duplas clave,valor
--       1 por el uso de "==" sobre el resultado de la recursión      
--   ) -> n * 1 => n
-- O(n) + O(1) por el caso base, ya que en el peor caso después de recorrer toda la lista dada, no se encuentra la clave dada
-- O(n)
buscar :: Ord k => k -> [(k,v)] -> Maybe v
buscar _ []            = Nothing -- O(1)
buscar k ((k',v):kvs) =
     if k==k' then Just v
              else buscar k kvs 

------------------------------------------------------------------------------------------------------------------------------------
-- O(n * # por recursión sobre la lista de duplas (k,v) dada, siendo n la cantidad de duplas clave,valor
--       (  1 por el uso de "==" sobre el resultado de la recursión
--        + 1 por el uso de ":" sobre el resultado de la recursión
--        )
--   ) -> n * (1 + 1) => n * 2 => 2n => n
-- O(n) + O(1) por el caso base, ya que en el peor caso se recorre toda la lista de kvs sin que esté
-- O(n)
borrar :: Ord k => k -> [(k,v)] -> [(k,v)] 
borrar _ []            = [] -- O(1)
borrar k ((k',v'):kvs) = 
    if k==k' then kvs 
             else (k',v') : borrar k kvs 

------------------------------------------------------------------------------------------------------------------------------------
-- O(n * # por recursión sobre la lista de duplas (k,v) dada, siendo n la cantidad de duplas clave,valor
--        1 # por "cons" sobre el resultado de la recursión
--   ) -> n * 1 => n
-- O(n) + O(1) por el caso base, siempre se va llegar a una lista vacía
-- O(n)
claves :: Ord k => [(k,v)] -> [k] 
claves []          = [] -- O(1)
claves ((k,v):kvs) = k : claves kvs 