{-- 2. --}
{-- NUMEROS ENTEROS--}

{-- 1. Defina las siguientes funciones --}

{-- a. --}
{--
    Devuelve numeros positivos, no devuelve numeros negativos, ni con coma. 
    PRECOND: number tiene que ser igual o mayor a cero.
--}

sucesor :: Int -> Int
sucesor number = number + 1


{-- Ejemplo de uso --}
ocho :: Int 
ocho = sucesor 7

{-- b. --}
{-
    Devuelve la suma de dos numeros cualquiera sean
    PRECOND: Number1 y  Number2 deben ser igual o mayor que cero
-}

sumar  :: Int -> Int -> Int
sumar  number1 number2  = number1 + number2

{-- Ejemplo de uso --}

nueve :: Int 
nueve = sumar 5 4

{-- c. --}
{-
    devuelve un par donde la primera comp onente es la división del primero p or el segundo, y la segunda comp onente es el resto de dicha división
    PRECOND: Number1 y  Number2 deben ser igual o mayor que cero. Numero1 es el dividendo y el Numero2 es el divisor. Importa el orden.

-}

divisionYResto :: Int -> Int -> (Int, Int)
divisionYResto number1 number2  = ( div number1  number2, mod number1 number2)

{-- Ejemplo de uso --}

tresYUno :: (Int, Int) 
tresYUno = divisionYResto  16 5

{-- d. --}

{-
    Dado un par de números devuelve el mayor de estos
    PRECOND: Number1 y Number2 deben ser igual o mayor que cero.
-}

maxDelPar :: (Int, Int) -> Int
maxDelPar (number1, number2) = if number1 > number2 then number1 else number2

{-- Ejemplo de uso --}

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


{-- 3. --}
{- TIPOS ENUMERATIVOS -}
{-- 1. --}

data Dir = Norte | Sur | Este | Oeste 

{-- a. --}

opuesto :: Dir -> Dir
opuesto Norte = Sur
opuesto Sur = Norte
opuesto Este = Oeste
opuesto Oeste = Este

{-- Ejemplo de uso --}
opuestoEjemplo :: Dir
opuestoEjemplo = opuesto Norte

{-- b. --}

iguales :: Dir -> Dir -> Bool
iguales Norte Norte = True
iguales Sur Sur = True
iguales Este Este = True
iguales Oeste Oeste = True
iguales _ _ = False

{-- Ejemplo de uso --}
igualesEjemplo :: Bool
igualesEjemplo = iguales Norte Norte

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

{-- Ejemplo de uso --}
siguienteEjemplo :: Dir
siguienteEjemplo = siguiente Norte


{-- 2. --}

data DiaDeSemana = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo 

{-- a. --}
{--
    Devuelve el siguiente día de la semana al dado.
    PRECOND: El día dado debe ser uno de los 6 días (Lunes, Martes, Miercoles, Jueves, Viernes y Sabado).  
    Como no existe Domingo. Es una funcion parcial y no se puede utilizar a Domingo.
--}

primeroYUltimoDia :: (DiaDeSemana ,DiaDeSemana)
primeroYUltimoDia = ( Lunes , Domingo)

{-- Ejemplo de uso --}
primeroYUltimoDiaEjemplo :: (DiaDeSemana, DiaDeSemana)
primeroYUltimoDiaEjemplo = primeroYUltimoDia

{-- b. --}
empiezaConM :: DiaDeSemana -> Bool
empiezaConM Martes = True
empiezaConM Miercoles = True
empiezaConM _ = False 

{-- Ejemplo de uso --}
empiezaConMEjemplo :: Bool
empiezaConMEjemplo = empiezaConM Martes

{-- c.  --}

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
    


{-- Ejemplo de uso --}
vieneDespuesEjemplo :: Bool
vieneDespuesEjemplo = vieneDespues Martes Lunes

{-- d.  --}

estaEnElMedio :: DiaDeSemana -> Bool
estaEnElMedio Lunes = False
estaEnElMedio Domingo = False
estaEnElMedio _ = True

{-- Ejemplo de uso --}
estaEnElMedioEjemplo :: Bool
estaEnElMedioEjemplo = estaEnElMedio Miercoles

{-- 3.  --}

{-- a. --}

negar :: Bool -> Bool
negar True = False
negar False = True


{-- b.  --}
implica :: Bool -> Bool -> Bool
implica True False = False
implica _ _ = True

{-- c.  --}
yTambien :: Bool -> Bool -> Bool
yTambien True True = True
yTambien _ _ = False


{-- d.  --}
oBien :: Bool -> Bool -> Bool
oBien False False = False
oBien _ _ = True



{-- 4.  --} 
{-- REGISTROS --}

{-- 1. --}

data Persona = PersonaC String Int

{-- a. --}

nombre:: Persona -> String
nombre (PersonaC name _) = name

{-- b. --}  
edad :: Persona -> Int
edad (PersonaC _ age) = age

{-- c. --}
crecer :: Persona -> Persona
crecer (PersonaC name age) = PersonaC name (age + 1)

{-- d. --}
cambioDeNombre :: String -> Persona -> Persona
cambioDeNombre newName (PersonaC _ age) = PersonaC newName age

{-- e. --}
esMayorQueLaOtra :: Persona -> Persona -> Bool
esMayorQueLaOtra (PersonaC _ age1) (PersonaC _ age2) = age1 > age2


{-- f. --}
laQueEsMayor :: Persona -> Persona -> Persona
laQueEsMayor (PersonaC name1 age1) (PersonaC name2 age2)  = if esMayorQueLaOtra (PersonaC name1 age1) (PersonaC name2 age2) then (PersonaC name1 age1) else (PersonaC name2 age2)


{--  2. --}
data TipoDePokemon = Agua | Fuego | Planta deriving (Show, Eq)

data Pokemon = PokemonC  Entrenador  TipoDePokemon  Int deriving (Show, Eq)
data Entrenador = EntrenadorC String  Pokemon  Pokemon deriving (Show, Eq)


{-- a. --}

tipoSuperior :: TipoDePokemon -> TipoDePokemon -> Bool
tipoSuperior Agua Fuego = True
tipoSuperior Fuego Planta = True
tipoSuperior Planta Agua = True
tipoSuperior _ _ = False


superaA :: Pokemon -> Pokemon -> Bool
superaA (PokemonC _ tipo1 _) (PokemonC _ tipo2 _) = tipoSuperior tipo1 tipo2


{-- b. --}

mismoTipo :: TipoDePokemon -> TipoDePokemon -> Bool
mismoTipo Agua Agua = True
mismoTipo Fuego Fuego = True
mismoTipo Planta Planta = True
mismoTipo _ _ = False


cantidadDePokemonDe :: TipoDePokemon -> Entrenador -> Int
cantidadDePokemonDe tipo (EntrenadorC _ (PokemonC _ tipo1 _) (PokemonC _ tipo2 _)) =
    if mismoTipo tipo tipo1  && mismoTipo tipo tipo2 then 2
    else if mismoTipo tipo tipo1 || mismoTipo tipo tipo2 then 1
    else 0

{-- c. --}

juntarPokemon :: Entrenador -> Entrenador -> [Pokemon]
juntarPokemon (EntrenadorC _ pokemon1A pokemon2A) (EntrenadorC _ pokemon1B pokemon2B) = [pokemon1A, pokemon2A, pokemon1B, pokemon2B]

{-- 5. --}

{-- FUNCIONES POLIMORFICAS --}

{-- 1. --}

{-- a. --}

loMismo :: a -> a
loMismo x = x

{-- b. --}
siempreSiete :: a -> Int
siempreSiete _ = 7

{-- c. --}  

swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)    


{-- 2. Estas funciones son polimorficas porque pueden ser utilizadas con cualquier tipo de dato. --}


{-- 6. --}
{-- PATTER MATCHING --} 


{-- 2. --}
estaVacia :: [a] -> Bool
estaVacia [] = True
estaVacia _ = False


{-- 3. --}

elPrimero :: [a] -> a
elPrimero (x:xs) = x

{--4 --}
sinElPrimero :: [a] -> [a]
sinElPrimero (x:xs) = xs 

{--5 --}
splitHead ::  [a] -> (a, [a])
splitHead  (x:xs) = (x , xs )


{-- fin  --}