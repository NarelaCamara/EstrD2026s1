-- +---------------------+
-- |  Parte 1 - DualNet  |
-- +---------------------+

-- INV.REP.:
-- * Si un cliente es clave en el map, entonces está conectado en el switch
--   con la ruta que tiene como valor asociado en el map.
-- * Si in cliente está conectado en el switch entonce está como clave en
--   el map y tiene asociada la ruta que permite llegar a dicha conexión.
-- * Dado lo anterior, no es posible que dos valores del map se repitan.

-- O(1)
cantidadDeClientesConectados :: Dualnet -> Int
cantidadDeClientesConectados (DN _ m) = sizeM m


-- O(2^r)
-- O(r * 2^r) 
estaDisponible :: Ruta -> Dualnet -> Bool
estaDisponible r (DN sw m) = elem r (disponiblesADistancia sw (length r))

-- O(L + logC)
-- conectar + desconectar + lookupM + assocM = r + r + logC + locC = 
-- L porque el cliente podría tener asociada la ruta mas larga.
conectarCliente :: Ruta -> Cliente -> Dualnet -> Dualnet
conectarCliente r c (DN sw mc) = case lookupM c mc of
    Just r' -> DN (conectar r' (desconectar r' sw)) (assocM cr mc)
    Nothing -> DN (conectar r c sw) (assocM cr mc)


pinPorCliente :: Dualnet -> Heap (Int, Cliente)
pinPorCliente (DN sw mc) = pinPorClienteM (keys mc) mc

-- O(n *(log m + log n + r))
-- O(C *(log C + log C + L))
-- O(C * logC + C * L)
pinPorClienteM :: [Cliente] -> Map CLiente Ruta -> Heap (Int, Cliente)
pinPorClienteM []     m = emptyH
pinPorClienteM (c:cs) m = insertH (length (fromJust (lookupM c m)), c) (pinPorClienteM cs m)

pinPorClienteM' :: [Cliente] -> Map CLiente Ruta -> Heap (Int, Cliente)
pinPorClienteM' []     m = emptyH
pinPorClienteM' (c:cs) m = case lookupM c m of
    Nothing -> error " "
    Just r  -> insertH (length r, c) (pinPorClienteM' cs m)


-- +--------------------+
-- |  Parte 2 - Switch  |
-- +--------------------+

data Switch a = Terminal | Conmutador (RedPrivada a) (Switch a) (Switch a)

-- INV.REP.:
-- * No puede hacer un conmutador sin algún dato conectado o bien en su
--   red privada o en alguna de sus bocas.

-- O(1)
newSw :: Switch a
newSw = Terminal

-- O(r) donde r es la longitud de la ruta.
conectar :: Ruta -> a -> Switch a -> Switch a
conectar [] x Terminal               = Conmutador (Conexion x) Terminal Terminal
conectar [] x (Conmutador r sw1 sw2) = case r of
    Conexion _ -> error "la conexion no esta disponible"
    Disponible -> Conmutador (Conexion x) sw1 sw2
conectar (t:ts) x Terminal = error " "
conectar (t:ts) x (Conmutador r sw1 sw2) = case t of
    Boca1 -> Conmutador r (conectar ts x sw1) sw2
    Boca2 -> Conmutador r sw1 (conectar ts x sw2)

-- O(r) donde r es la longitud de la ruta.
desconectar :: Ruta -> a -> Switch a -> Switch a
desconectar _  Terminal               = error "La ruta no está siendo utilizada"
desconectar [] (Conmutador r sw1 sw2) = case r of
    Conexion _ -> disponible sw1 sw2
    Disponible -> error "La ruta no está siendo utilizada"
desconectar (t:ts) x (Conmutador r sw1 sw2) = case t of
    Boca1 -> Conmutador r (desconectar ts sw1) sw2
    Boca2 -> Conmutador r sw1 (desconectar ts sw2)


disponible Terminal Terminal = Terminal
disponible sw1      sw2      = Conmutador Disponible sw1 sw2


disponiblesADistancia :: Swtich a -> Int -> [Ruta]
disponiblesADistancia Terminal 0 = [[]]
disponiblesADistancia (Conmutador r sw1 sw2) 0 = case r of
    Conexion _ -> []
    Disponible -> [[]]
disponiblesADistancia Terminal n = []
disponiblesADistancia (Conmutador r sw1 sw2) n =
    consAll Boca1 (disponiblesADistancia sw1 (n-1)) ++
    consAll Boca2 (disponiblesADistancia sw2 (n-1))