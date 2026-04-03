{- NUMEROS ENTEROS-}

{-- 1. --}

{--
    Devuelve numeros positivos, no devuelve numeros negativos, ni con coma. 
    PRECOND: number tiene que ser igual o mayor a cero.
--}

sucesor :: Int -> Int
sucesor number = number + 1

ocho :: Int 
ocho = sucesor 7

{-
    Devuelve la suma de dos numeros cualquiera sean
    PRECOND: Number1 y  Number2 deben ser igual o mayor que cero
-}

sumar  :: Int -> Int -> Int
sumar  number1 number2  = number1 + number2


nueve :: Int 
nueve = sumar 5 4


{-
    devuelve un par donde la primera comp onente es la división del primero p or el segundo, y la segunda comp onente es el resto de dicha división
    PRECOND: Number1 y  Number2 deben ser igual o mayor que cero. Numero1 es el dividendo y el Numero2 es el divisor. Importa el orden.

-}

divisionYResto :: Int -> Int -> (Int, Int)
divisionYResto number1 number2  = ( div number1  number2, mod number1 number2)


tresYUno :: (Int, Int) 
tresYUno = divisionYResto  16 5


{-
    Dado un par de números devuelve el mayor de estos
    PRECOND: Number1 y Number2 deben ser igual o mayor que cero.
-}

maxDelPar :: (Int, Int) -> Int
maxDelPar (number1, number2) = if number1 > number2 then number1 else number2


diez :: Int 
diez = maxDelPar (5, 10)


{-- 2. --}

diezEjemplo1 :: Int 
diezEjemplo1 =  sumar 6 (sucesor (maxDelPar (divisionYResto 15 5)))


diezEjemplo2  :: Int 
diezEjemplo2 = maxDelPar (divisionYResto 10 (sucesor (sumar 35 64 )))

diezEjemplo3 :: Int 
diezEjemplo3 = sucesor (sumar ( maxDelPar ( divisionYResto 45 20)) 4)

diezEjemplo4 :: Int 
diezEjemplo4 = maxDelPar ((maxDelPar (divisionYResto (sumar 4 6) (sucesor 6))), sumar 2 (maxDelPar (divisionYResto (sumar 2 6) (sucesor 48))))


{- TIPOS ENUMERATIVOS -}
{-- 3. --}

data Dir = Norte | Sur | Este | Oeste 

{-- a. --}


opuesto :: Dir -> Dir
opuesto Norte = Sur
opuesto Sur = Norte
opuesto Este = Oeste
opuesto Oeste = Este


{-- b. --}

sonIguales :: Dir -> Dir -> Bool
sonIguales Norte Norte = True
sonIguales Sur Sur = True
sonIguales Este Este = True
sonIguales Oeste Oeste = True
sonIguales _ _ = False


{-- c. --}

{--
    Devuelve la dirección siguiente a la dada, en el sentido de las agujas del reloj.
    PRECOND: La dirección dada debe ser una de las 3 direcciones (norte, este y sur).  
    Como no existe Oeste. Es una funcion parcial y no se puede utilizar a Oeste.   
--}
siguiente :: Dir -> Dir
siguiente Norte = Este
siguiente Este = Sur
siguiente Sur = Norte

data DiaDeSemana = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo 

{-- 2. --}

{-- a. --}
{--
    Devuelve el siguiente día de la semana al dado.
    PRECOND: El día dado debe ser uno de los 6 días (Lunes, Martes, Miercoles, Jueves, Viernes y Sabado).  
    Como no existe Domingo. Es una funcion parcial y no se puede utilizar a Domingo.
--}

primeroYUltimoDia :: (DiaDeSemana ,DiaDeSemana)
primeroYUltimoDia = ( Lunes , Domingo)


{-- b. --}
empiezaConM :: DiaDeSemana -> Bool
empiezaConM Martes = True
empiezaConM Miercoles = True
empiezaConM _ = False 

{-- c.    --}

sonIgualesDias :: DiaDeSemana -> DiaDeSemana -> Bool
sonIgualesDias Lunes Lunes = True
sonIgualesDias Martes Martes = True 
sonIgualesDias Miercoles Miercoles = True
sonIgualesDias Jueves Jueves = True
sonIgualesDias Viernes Viernes = True
sonIgualesDias Sabado Sabado = True
sonIgualesDias Domingo Domingo = True
sonIgualesDias _ _ = False


vieneDespues :: DiaDeSemana -> DiaDeSemana -> Bool
vieneDespues day1 day2 = 
    if sonIgualesDias day1 Domingo then False
    else if sonIgualesDias day1 Martes &&  sonIgualesDias day2 Lunes then False
    else if sonIgualesDias day1 Miercoles && ( sonIgualesDias day2 Martes || sonIgualesDias day2 Lunes )then False
    else if sonIgualesDias day1 Jueves && ( sonIgualesDias day2 Miercoles || sonIgualesDias day2 Martes || sonIgualesDias day2 Lunes) then False
    else if sonIgualesDias day1 Viernes && ( sonIgualesDias day2 Jueves ||  sonIgualesDias day2 Miercoles || sonIgualesDias day2 Martes || sonIgualesDias day2 Lunes) then False
    else if sonIgualesDias day1 Sabado && ( sonIgualesDias day2 Viernes  || sonIgualesDias day2 Jueves ||  sonIgualesDias day2 Miercoles || sonIgualesDias day2 Martes || sonIgualesDias day2 Lunes) then False
    else True
    

{-- d.  --}

estaEnMedio :: DiaDeSemana -> Bool
estaEnMedio Lunes = False
estaEnMedio Domingo = False
estaEnMedio _ = True


