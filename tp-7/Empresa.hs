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
data Empresa = ConsE (Map SectorId (Set Empleado)) (Map CUIL Empleado) deriving Show

{--
* los empleados son un tipo abstracto.
* el primer map relaciona id de sectores con los empleados que trabajan en dicho sector.
* el segundo map relaciona empleados con su número de CUIL.
* un empleado puede estar asignado a más de un sector 
* tanto Map como Set exp onen una interfaz eficiente con costos logarítmicos para inserción,
búsqueda y b orrado, tal cual vimos en clase 
--}

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
consEmpresa :: Empresa
consEmpresa = (ConsE emptyM emptyM)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log E) logatirmo  +  O(1) Constante
-}
buscarPorCUIL :: CUIL -> Empresa -> Empleado
buscarPorCUIL c (ConsE mS mE) = fromJust (lookupM c mE)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante
-}
fromJust :: Maybe v -> v
fromJust (Just e) = e
{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(1) Constante +  O(log n) logatirmo
-}

empleadosDelSector :: SectorId -> Empresa -> [Empleado]
empleadosDelSector s (ConsE mS mE) = fromJust (lookupM s mS)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
todosLosCUIL :: Empresa -> [CUIL]
todosLosCUIL (ConsE mS mE) = (keys mE)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
todosLosSectores :: Empresa -> [SectorId]
todosLosSectores (ConsE mS mE) = (keys mS)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo +  O(1) Constante
-}
agregarSector :: SectorId -> Empresa -> Empresa
agregarSector s (ConsE mS mE) = (ConsE (assocM s emptyS mS) mE)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(s) Lineal +  O(log n) logatirmo 
-}
agregarEmpleado :: [SectorId] -> CUIL -> Empresa -> Empresa 
agregarEmpleado ss c (ConsE mS mE) = let e = (agregarSectoresAEmpleado ss (consEmpleado c))
            in  (ConsE (nuevoEmpleadoParaSectores ss e mS) (addS e mE))

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(s) Lineal -> por la cantidad de sectore de la lista +  O(log n) logatirmo
-}
nuevoEmpleadoParaSectores:: [SectorId] -> Empleado -> (Map SectorId (Set Empleado)) -> (Map SectorId (Set Empleado))
nuevoEmpleadoParaSectores [] e mS = mS
nuevoEmpleadoParaSectores (s:ss) e mS = (nuevoEmpleadoParaSectores ss e (agregarEmpleadoEnSector s e mS) )

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
agregarEmpleadoEnSector:: SectorId -> Empleado -> (Map SectorId (Set Empleado)) -> (Map SectorId (Set Empleado))
agregarEmpleadoEnSector s e mS  = assocM s (addS e (fromJust (lookupM s mS))) (deleteM s mS)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:    n (log n) Ene log ene -> donde n es el valor de la lista Sector ID
-}
agregarSectoresAEmpleado :: [SectorId] -> Empleado -> Empleado
agregarSectoresAEmpleado [] e = e
agregarSectoresAEmpleado (x:xs) e = incorporarSector x (agregarSectoresAEmpleado xs e)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
agregarASector :: SectorId -> CUIL -> Empresa -> Empresa 
agregarASector s c (ConsE mS mE) = let e = (incorporarSector s (fromJust (lookupM c mE)))  
    in  (ConsE (actualizarEmpleadoEnSectores s e mS) (actualizarEmpleadoEnEmpleados e mE) )


{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
actualizarEmpleadoEnEmpleados:: Empleado -> (Map CUIL Empleado) -> (Map CUIL Empleado)
actualizarEmpleadoEnEmpleados e mE  = let  mE' = (deleteM (cuil e) mE)
            in assocM (cuil e) e mE'

{-
    Proposito: 
    PRECONDICION:   
    COSTO:   O(log n) logatirmo
-}
actualizarEmpleadoEnSectores:: SectorId -> Empleado -> (Map SectorId (Set Empleado)) -> (Map SectorId (Set Empleado))
actualizarEmpleadoEnSectores s e mS  = let  eS' = (removeS (cuil e) (fromJust (lookupM s mS)))
            in assocM s (addS e eS') (deleteM s mS)

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  
-}
borrarEmpleado :: CUIL -> Empresa -> Empresa 
borrarEmpleado c (ConsE mS mE) = (ConsE (eliminarEmpleadoDeSectrores (keys mS) c mS) (removeS c mE))

eliminarEmpleadoDeSectrores:: [SectorId] -> CUIL -> (Map SectorId (Set Empleado)) -> (Map SectorId (Set Empleado))
eliminarEmpleadoDeSectrores [] c mS = emptyM
eliminarEmpleadoDeSectrores (s:ss) c mS = assocM s (removeS c (fromJust (lookupM s mS))) (eliminarEmpleadoDeSectrores ss c mS)

