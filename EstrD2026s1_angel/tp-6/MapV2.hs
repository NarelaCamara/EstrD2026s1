module MapV2
  (Map, emptyM, assocM, lookupM, deleteM, keys)
 where

data Map k v = M [(k,v)]
  {- INV.REP.: 
    *
  -}

emptyM  :: Map k v
  -- PROP.: describir un map vacío.

assocM  :: Ord k => k -> v -> Map k v -> Map k v
  -- PROP.: describir el map dado con la asociación de la clave y valor dados
  -- X (si estaba asociada a otra cosa, solamente vale la última asociación)

lookupM :: Ord k => k -> Map k v -> Maybe v
  -- PROP.: describir el valor asociado a la clave en el map en caso que exista, sino Nothing. 

deleteM :: Ord k => k -> Map k v -> Map k v
  -- PROP.: describir el map dado, sin la asociación de la clave dada.

keys     :: Ord k => Map k v -> [k] -- domM
  -- PROP.: describir la lista de todas las claves definidas en el map, sin repetidos (el dominio del map)


emptyM              = M []             -- O(1)         
assocM  k v (M kvs) = M ((k,v):kvs)    -- O(1)    
lookupM k   (M kvs) = buscar k kvs     -- O(n) -> n = claves del map
deleteM k   (M kvs) = M (borrar k kvs) -- O(n) -> n = claves del map
keys        (M kvs) = clavesSinRep kvs -- O(n^2) -> n = claves del map                           


-------------------------------------------------------------------------
-- O(n * # por recursión sobre la lista de duplas (k,v) dada, siendo n la cantidad de duplas clave,valor
--       1 por el uso de "==" sobre el resultado de la recursión      
--   ) -> n * 1 => n
-- O(n) + O(1) por el caso base, ya que en el peor caso después de recorrer toda la lista dada, no se encuentra la clave dada
-- O(n)
buscar :: Ord k => k -> [(k,v)] -> Maybe v
buscar _ []           = Nothing -- O(1)
buscar k ((k',v):kvs) = 
    if k==k' then Just v
             else buscar k kvs 

-------------------------------------------------------------------------
-- O(n * # por recursión sobre la lista de duplas (k,v) dada, siendo n la cantidad de duplas clave,valor
--       (  1 por el uso de "==" sobre el resultado de la recursión
--        + 1 por el uso de ":" sobre el resultado de la recursión
--        )
--   ) -> n * (1 + 1) => n * 2 => 2n => n
-- O(n) + O(1) por el caso base, siempre tiene que recorrer la lista y terminar con []
-- O(n)
borrar :: Ord k => k -> [(k,v)] -> [(k,v)] 
borrar _ []            = []  -- O(1)
borrar k ((k',v'):kvs) = 
    if k==k' then borrar k kvs 
             else (k',v') : borrar k kvs 

-------------------------------------------------------------------------
-- O(n * # por recursión sobre la lista de duplas (k,v) dada, siendo n la long de la lista 
--         m por el uso de "elem" sobre el resultado de la recursión
--       + 1 por el uso de ":" sobre el resultado de la recursión
--   ) -> n * (m + 1) => n * m
--       donde potencialmente n es igual a m, en el peor caso posible, que 
--       es cuando la lista no tiene ninguna dupla repetida.
--      n * m => n * n
-- O(n^2) + O(1) por el caso base, siempre tiene que recorrer la lista y terminar con []
-- O(n^2)
clavesSinRep :: Ord k => [(k,v)] -> [k]
clavesSinRep []          = [] --  O(1) 
clavesSinRep ((k,v):kvs) = 
    if elem k (clavesSinRep kvs) then clavesSinRep kvs 
                                 else k : clavesSinRep kvs
                      