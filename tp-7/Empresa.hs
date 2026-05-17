import Empleado

module Empresa (
    Empresa,
    consEmpresa,
    buscarPorCUIL,
    empleadosDelSector,
    todosLosCUIL,
    todosLosSectores,
    agregarSector,
    agregarEmpleado,
    agregarASector,
    borrarEmpleado
    )
where


type SectorId = Int
type CUIL = Int
data Empresa = ConsE (Map SectorId (Set Empleado))
(Map CUIL Empleado)

{--
* los empleados son un tipo abstracto.
* el primer map relaciona id de sectores con los empleados que traba jan en dicho sector.
* el segundo map relaciona empleados con su número de CUIL.
* un empleado puede estar asignado a más de un sector 
*tanto Map como Set exp onen una interfaz eficiente con costos logarítmicos para inserción,
búsqueda y b orrado, tal cual vimos en clase 
--}