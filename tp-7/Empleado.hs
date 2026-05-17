import Set

module Empleado (
    Empleado,
    consEmpleado,
    CUIL,
    incorporarSector,
    sectores
    )
where

type CUIL = Int
type SectorId = String
data Map k v = E CUIL (Set SectorId) deriving Show

consEmpleado:: String 
consEmpleado = "no implementado aun"

CUIL:: String 
CUIL = "no implementado aun"

incorporarSector:: String 
incorporarSector = "no implementado aun"

sectores:: String 
sectores = "no implementado aun"