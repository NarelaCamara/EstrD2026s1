module Empleado 
    (Empleado, consEmpleado, cuil, incorporarSector, sectores)
where 

import SetV1
type SectorId = Int

type CUIL = Int

data Empleado = E Int (Set SectorId)
             --   CUIL  Sectores en los que trabaja
    {- INV. REP.: en E c s 
      * c es un número entre de 11 digitos igual o mayor a cero.
      OBS.: el TAD Set garantiza que no hay sectores duplicados 
     -}

instance Eq Empleado where
  e1 == e2 = cuil e1 == cuil e2

consEmpleado :: CUIL -> Empleado
--Propósito: construye un empleado con dicho CUIL.
--Costo: O(1)
cuil :: Empleado -> CUIL
--Propósito: indica el CUIL de un empleado.
--Costo: O(1)
incorporarSector :: SectorId -> Empleado -> Empleado
--Propósito: incorpora un sector al conjunto de sectores en los que trabaja un empleado.
--Costo: O(log S), siendo S la cantidad de sectores que el empleado tiene asignados.
sectores :: Empleado -> [SectorId]
--Propósito: indica los sectores en los que el empleado trabaja.
--Costo: O(S)

consEmpleado     c          = E c emptyS       
cuil                (E c _) = c   
incorporarSector id (E c s) = E c (addS id s)  -- O(log S) por addS     
sectores            (E c s) = setToList s      -- O(S) por setToList


