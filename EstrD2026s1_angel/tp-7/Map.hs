module Map
  (Map, emptyM, assocM, lookupM, deleteM, keys)
 where

data Map k v = M [(k,v)]
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
assocM  k v (M kvs) = M (asociar k v kvs) -- O(n) n son las k del map.  
lookupM k   (M kvs) = buscar k kvs        -- O(n) n son las k del map.                 
deleteM k   (M kvs) = M (borrar k kvs)    -- O(n)      
keys        (M kvs) = claves kvs          -- O(n)                            

----------------------------------------------------------------------------
-- O(n * # por recursión sobre la lista de duplas (k,v) dada
--   m # por '=='[O(1)] y 'cons'[O(1)] sobre el resultado de la recursión
--   ) -> n * (1 + 1) => n * 2 => 2n => n
-- O(n)
asociar :: Ord k => k -> v -> [(k,v)] -> [(k,v)]
asociar k v []            = [(k,v)]
asociar k v ((k',v'):kvs) = if k==k' -- O(1) 
                              then (k',v)  : kvs
                              else (k',v') : asociar k v kvs
                         --               O(1) 

----------------------------------------------------------------------------
-- O(n * # por recursión sobre la lista de duplas (k,v) dada
--   m # por '=='[O(1)] sobre el resultado de la recursión
--   ) -> n * 1  => n
-- O(n)
buscar :: Ord k => k -> [(k,v)] -> Maybe v
buscar _ []            = Nothing
buscar k ((k',v'):kvs) = if k==k' -- O(1)
                          then Just v'
                          else buscar k kvs 

-------------------------------------------------------------------------
-- O(n * # por recursión sobre la lista de duplas (k,v) dada
--   m # por '=='[O(1)] y 'cons'[O(1)] sobre el resultado de la recursión
--   ) -> n * (1 + 1) => n * 2 => 2n => n
-- O(n)
borrar :: Ord k => k -> [(k,v)] -> [(k,v)] 
borrar _ []            = [] 
borrar k ((k',v'):kvs) = if k==k' then kvs else (k',v') : borrar k kvs 
                      --    O(1)                       O(1) 

-------------------------------------------------------------------------
-- O(n * # por recursión sobre la lista de duplas (k,v) dada
--   m # por 'cons'[O(1)] sobre el resultado de la recursión
--   ) -> n * 1 => n
-- O(n)
claves :: Ord k => [(k,v)] -> [k] 
claves []          = []
claves ((k,v):kvs) = k : claves kvs 
                  -- O(1)