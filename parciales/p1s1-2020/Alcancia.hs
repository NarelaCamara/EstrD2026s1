module Alcancia(
    Alcancia,
    nuevaA, 
    ponerA, 
    contarA
)
where 

data Alcancia = A (Moneda, Int) (Moneda, Int) (Moneda, Int)  deriving Show  

type Moneda = Int
-- constante
nuevaA :: Alcancia 
nuevaA = (A (5,0) (2,0) (1,0))

-- constante + constante 
ponerA:: Moneda -> Alcancia -> Alcancia 
ponerA 5 (A m5 m2 m1) = (A (aumentarUno m5) m2 m1)
ponerA 2 (A m5 m2 m1) = (A m5 (aumentarUno m2) m1)
ponerA 1 (A m5 m2 m1) = (A m5 m2 (aumentarUno m1))
ponerA n (A m5 m2 m1) = (A m5 m2 m1)

aumentarUno::(Moneda, Int) -> (Moneda, Int) 
aumentarUno (m, c) = (m, c+1) 

--constante
contarA:: Moneda -> Alcancia -> Int 
contarA 5 (A  (m5,c5) m2 m1) = c5
contarA 2 (A  m5 (m2,c2) m1) = c2
contarA 1 (A  m5 m2 (m1,c1)) = c1    
contarA n (A  m5 m2 m1) = 0