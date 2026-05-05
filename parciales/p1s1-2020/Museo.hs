module Museo(
    Museo,
    nuevoM,
    entrarM,
    salirM,
    cuantosDe
)
where 


data Museo = M (Map DNI Int) (MultiSet Int)

type DNI = Int 