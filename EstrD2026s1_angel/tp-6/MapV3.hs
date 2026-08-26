module MapV3
  (Map, emptyM, assocM, lookupM, deleteM, keys)
 where

data Map k v = M [k] [v]
  {- INV.REP.: para M ks vs :
      * la clave para la posición i en ks está asociada al valor de la misma posición en vs.
      * no hay claves repetidas en ks.          
    -}

emptyM  :: Map k v
  -- PROP.: describir un map vacío.

assocM  :: Ord k => k -> v -> Map k v -> Map k v
  -- PROP.: describir el map dado con la asociación de la clave y valor dados
  -- X (si estaba asociada a otra cosa, solamente vale la última asociación)

lookupM :: (Ord k, Ord v) => k -> Map k v -> Maybe v
  -- PROP.: describir el valor asociado a la clave en el map en caso que exista, sino Nothing. 

deleteM :: Ord k => k -> Map k v -> Map k v
  -- PROP.: describir el map dado, sin la asociación de la clave dada.

keys     :: Ord k => Map k v -> [k] -- domM
  -- PROP.: describir la lista de todas las claves definidas en el map, sin repetidos (el dominio del map)


emptyM                = M [] []           -- O(1)         
assocM  k v (M ks vs) = asociar k v ks vs -- O(n)    
lookupM k   (M ks vs) = buscar k ks vs    -- O(n)                      
deleteM k   (M ks vs) = borrar k ks vs    -- O(n)      
keys        (M ks vs) = ks                -- O(1)                            


-----------------------------------------------------------------------------
asociar :: Ord k => k -> v -> [k] -> [v] -> Map k v 
asociar k v ks vs = case posicion k ks of 
                     Nothing -> M (k:ks) (v:vs)
                     Just i  -> M ks (reemplazarEn i v vs)



reemplazarEn :: Int -> v -> [v] -> [v]
-- OBS.: la precondición se cumple por el INVARIANTE, si o si n tiene que ser una posición
--       válida dentro de la lista, ya que es la posición de k que tiene asociada a la v en
--       esta lista y por invariante, ambas listas tienen la misma cantidad de elementos.
reemplazarEn _ _ []       = error "no existe el valor" 
reemplazarEn 0 v (v':vs') = (v:vs')     
reemplazarEn n v (v':vs') = v' : reemplazarEn (n-1) v vs'


posicion :: Ord k => k -> [k] -> Maybe Int 
posicion _ []       = Nothing
posicion k (k':ks') = if k==k' -- O(1) 
                        then Just 0
                        else case posicion k ks' of
                              Nothing -> Nothing
                              Just i  -> Just (i+1)
        

---------------------------------------------------------------------------
buscar :: Ord k => k -> [k] -> [v] -> Maybe v
buscar k ks vs = case posicion k ks of
                    Nothing -> Nothing
                    Just i -> Just (buscarVEn i vs)

buscarVEn :: Int -> [v] -> v 
-- OBS.: la precondición se cumple por el INVARIANTE.
buscarVEn _ []     = error "posicion invalida en la lista" 
buscarVEn 0 (v:_)  = v
buscarVEn n (_:vs) = buscarVEn (n-1) vs 
                   --           O(1)

---------------------------------------------------------------------------
borrar :: Ord k => k -> [k] -> [v] -> Map k v
borrar k ks vs = case posicion k ks of
                    Nothing -> M ks vs
                    Just i -> M (borrarK k ks) (borrarV i vs)
 

borrarK :: Ord k => k -> [k] -> [k]
-- OBS.: la clave existe en la lista por el INVARIANTE.
borrarK _ []       = []
borrarK k (k':ks') = if k==k' then ks' else k' : borrarK k ks'

borrarV :: Int -> [v] -> [v]
-- OBS.: la precondición se cumple por el INVARIANTE.
borrarV _ []     = error "posición inválida en la lista" 
borrarV 0 (_:vs) = vs
borrarV n (v:vs) = v : borrarV (n-1) vs