module Empresa 
    (Empresa, consEmpresa, buscarPorCUIL, empleadosDelSector, todosLosCUIL, 
              todosLosSectores, agregarSector, agregarEmpleado, 
              agregarASector, borrarEmpleado)
where 

import Empleado
import Map
import Set 

type SectorId = Int

type CUIL = Int

data Empresa = ConsE (Map SectorId (Set Empleado))
                     (Map CUIL Empleado)
            {- INV. REP.: en ConsE ms me
            * si un empleado e es valor en me y tiene asociado un sector s que tiene id i,
              entonces ese empleado pertenece como elemento e al set que es el valor asociado a la clave i en ms.
            * para toda cuil c que es clave en me y que tiene asociado como valor a un empleado e, 
              entonces e tiene c como cuil. 
            -}

--instance Eq Empleado where
--  e1 == e2 = cuil e1 == cuil e2

consEmpresa :: Empresa                                               -- O(1)   
-- Propósito: construye una empresa vacía.

buscarPorCUIL :: CUIL -> Empresa -> Empleado                         -- O(log E) 
-- Propósito: devuelve el empleado con dicho CUIL.
-- Precondición: el CUIL es de un empleado de la empresa.

empleadosDelSector :: SectorId -> Empresa -> [Empleado]             -- O(log S + E)
-- Propósito: indica los empleados que trabajan en un sector dado.

todosLosCUIL :: Empresa -> [CUIL]                                   -- O(E)
-- Propósito: indica todos los CUIL de empleados de la empresa.

todosLosSectores :: Empresa -> [SectorId]                           -- O(S)

agregarSector :: SectorId -> Empresa -> Empresa                     -- O(log S)
-- Propósito: agrega un sector a la empresa, inicialmente sin empleados.

agregarEmpleado :: [SectorId] -> CUIL -> Empresa -> Empresa         -- O(E + s * (log S + log E))
-- Propósito: agrega un empleado a la empresa, que trabajará en dichos sectores y tendrá el CUIL dado.

agregarASector :: SectorId -> CUIL -> Empresa -> Empresa            -- O(log S + log E)
-- Propósito: agrega un sector al empleado con dicho CUIL.

borrarEmpleado :: CUIL -> Empresa -> Empresa                        --  O(S * (log S + log E))    
-- Propósito: elimina al empleado que posee dicho CUIL.



------------------------------------------------------------- consEmpresa -----------------------------------
-- O(1)
consEmpresa                        = ConsE emptyM emptyM  
------------------------------------------------------------- buscarPorCUIL --------------------------------
-- O(log E) siendo E la cantidad de empleados de la empresa dada
-- por el uso de lookupM que es O(log N), como se utiliza en el map de empleados de la empresa -> O(log E)
buscarPorCUIL c (ConsE _ mc) = 
    case lookupM c mc of
        Just e  -> e 
        Nothing -> error "el cuil dado no pertenece a un empleado de la empresa."
------------------------------------------------------ empleadosDelSector ---------------------------------
-- O(log S + E) siendo S  y E, la cantidad de sectores de la empresa dada y E la cantidad de empleados del sector dado
-- por el uso de lookupM O(log N) sobre el map de sectores -> O(log S) 
-- por el uso de setToList sobre el sector dado -> O(E)
empleadosDelSector id (ConsE ms _) = 
    case lookupM id ms of 
        Just s  -> setToList s 
        Nothing -> []
------------------------------------------------------ todosLosCUIL -------------------------------------
-- O(E) siendo E la cantidad de empleados de la empresa dada
-- por el uso de keys O(N) -> O(E) ya que la cantidad de claves del map representan la cantidad de empleados de la empresa
todosLosCUIL (ConsE _ mc) = keys mc 
------------------------------------------------- todosLosSectores ---------------------------------
-- O(S), siendo S la cantidad de sectores de la empresa
-- por el uso de keys O(N) -> O(S) ya que ms representa la cantidad de sectores de la empresa
todosLosSectores (ConsE ms _) = keys ms 
------------------------------------------------ agregarSector ---------------------------------
-- O(log S) siendo S la cantidad de sectores de la empresa dada
-- por el uso de lookupM O(log N) y assocM O(log N) -> O(log S) ya que las claves de ms representan a los sectores de la empresa
-- O(log S) + O(log S) = 2O(log S) => O(log S)
-- O(log S) + O(1) por plog attern matching sobre constructor al abrir y reconstruir la estructura
-- O(log S) + O(1) => O(log S)
agregarSector id (ConsE ms me) =
    case lookupM id ms of 
        Just _ -> error "sector ya existe en la empresa."
        Nothing -> Cons (assocM id emptyS ms) me 
----------------------------------------- agregarEmpleado ------------------------------------
-- O(E) por el uso de lookupM
-- O(s * (log S + log E)) por el uso de asociarSectores
-- O(s*log S) por el uso de incorporarSectores 
-- O(E + s * (log S + log E))
agregarEmpleado :: [SectorId] -> CUIL -> Empresa -> Empresa
agregarEmpleado ids c (ConsE ms me) =
    let e = consEmpleado c
        e' = incorporarSectores ids e
        ms' = asociarSectores ids e' ms
        me' = assocM c e' me
    in ConsE ms' me'

-- O(n * por recursión sobre la lista de ids dada, siendo n la cantidad de ids 
--     O(log S) por uso de incorporarSector 
-- O(s*log S) 
incorporarSectores :: [SectorId] -> Empleado -> Empleado
incorporarSectores []       e = e 
incorporarSectores (id:ids) e = incorporarSector id (incorporarSectores ids e)

-- O(n * por recursión sobre la lista de ids dada, siendo n la cantidad de ids 
--      # O(log S), por el uso de lookupM, siendo S la cantidad de sectores del map dado
--      # O(log S), por el uso de assocM, idem anterior
--      # O(log E), por el uso de addS, siendo E la cantidad de empleados de un sector (peor caso posible un sector tiene los sectores que existen en el map)
--  ) O(n) * [O(log S) + O(log S) + O(log E)]
-- O(n*log S) + O(n*log E)
-- O(s * (log S + log E))
asociarSectores :: [SectorId] -> Empleado -> Map SectorId (Set Empleado)
asociarSectores []       _ m = m
asociarSectores (id:ids) e m = 
    case lookupM id m of 
        Just setE -> assocM id (addS e setE)   (asociarSectores ids e m) 
        Nothing   -> assocM id (addS e emptyS) (asociarSectores ids e m)  

----------------------------------------------------------------------------------------------------------------------------------------
-- O(log S + log E) por el uso de agregarE 
-- O(log E) por el uso de assocM sobre el map de empleados
-- O(log S + log E) + O(log E)
-- O(log S + log E) + O(1) por PM e incorporarSector
-- O(log S + log E)
agregarASector id c (ConsE ms me) = 
    case lookupM c me of
        Just e  -> ConsE (agregarE id e ms) (assocM c (incorporarSector id e) me)
        Nothing -> let nuevoE = consEmpleado c
                    in ConsE (agregarE id nuevoE ms) (assocM c (incorporarSector nuevoE c) me) 

-- O(log S por el uso de accocM, siendo S la cantidad de sectores del map dado)
-- O(E por el uso de addS, siendo E la cantidad de empleados de un sector)
-- peor caso posible, un sector tiene todos los empleados que hay en el map
-- O(log S + log E)
agregarE :: SectorId -> Empleado -> Map SectorId (Set Empleado)
agregarE id e m = case lookupM id m of 
                    Just setE -> assocM id (addS e setE) m
                    Nothing   -> assocM id (addS e emptyS) m
--------------------------------- borrarEmpleado-----------------------------------------------------------------------------------------------
-- O(S * (log S + log E)) por el uso de borrarE
-- O(log E) por el uso de deleteM
-- (log E + x) * y > log E 
-- O(S * (log S + log E))
borrarEmpleado c (ConsE ms me) =
    case lookupM c me of
        Nothing -> ConsE ms me 
        Just e -> ConsE (borrarE e ms) (deleteM c me)

-- O(s *(log S + log E))
-- siendo s la cantidad de sectores del empleado dado, S y E, la cantidad de sectores y empleados respectivamente, del map dado
-- en el peor caso el empleado está en todos los sectores del map => s = S
-- O(S * (log S + log E))
borrarE :: Empleado -> Map SectorId (Set Empleado) -> Map SectorId (Set Empleado)
borrarE e m = borrarDe (sectores e) e m 

-- O( n * por recursión sobre la lista de ids dada)
--      # O(log S siendo S la cantidad de sectores del map, por el uso de lookupM y assocM)
--      # O(log E siendo E la cantidad de empleados de un sector, por el uso de removeS)
--    ) -> n * O(log S) + O(log S) + O(log E)
-- peor caso posible un sector tiene todos los empleados que hay en el map
-- O(log S) + O(log S) + O(log E) 
-- O(log S) + O(log S) = 2 log(S) => log(S) 
-- O(n *(log S + log E))
borrarDe :: [SectorId] -> Empleado -> Map SectorId (Set Empleado) -> Map SectorId (Set Empleado)
borrarDe []       _ m = m 
borrarDe (id:ids) e m = 
    case lookupM id m of
        Just setE -> assocM id (removeS e setE) (borrarDe ids e m) 
        Nothing -> (borrarDe ids e m) 