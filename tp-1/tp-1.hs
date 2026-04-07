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

data Dir = Norte | Sur | Este | Oeste deriving (Show, Eq)

{-- a. --}

{-- 
    Devuelve la dirección opuesta a la dada.
    PRECOND: La dirección dada debe ser una de las 4 direcciones (norte, sur, este y oeste).
--}

opuesto :: Dir -> Dir
opuesto Norte = Sur
opuesto Sur = Norte
opuesto Este = Oeste
opuesto Oeste = Este

{-- Ejemplo de uso --}
opuestoEjemplo :: Dir
opuestoEjemplo = opuesto Norte

{-- b. --}

{-- 
    Devuelve True si las dos direcciones dadas son iguales, y False en caso contrario.
    PRECOND: Las direcciones dadas deben ser una de las 4 direcciones (norte, sur, este y oeste).   
--}

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
siguiente Sur = Oeste
siguiente Oeste = error "no existe la siguiente dirección a Oeste"

{-- Ejemplo de uso --}
siguienteEjemplo :: Dir
siguienteEjemplo = siguiente Norte


{-- 2. --}

data DiaDeSemana = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo deriving (Show, Eq) 

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

{-- 
    Devuelve True si el día dado empieza con la letra M, y False en caso contrario.
    PRECOND: El día dado debe ser uno de los 7 días (Lunes, Martes, Miercoles, Jueves, Viernes, Sabado y Domingo).
--}

empiezaConM :: DiaDeSemana -> Bool
empiezaConM Martes = True
empiezaConM Miercoles = True
empiezaConM _ = False 

{-- Ejemplo de uso --}
empiezaConMEjemplo :: Bool
empiezaConMEjemplo = empiezaConM Martes

{-- c.  --}

{--
    Devuelve True si los dos días dados son iguales, y False en caso contrario.
    PRECOND: Los días dados deben ser uno de los 7 días (Lunes, Martes, Miercoles, Jueves, Viernes, Sabado y Domingo).  
--}

sonIgualesDias :: DiaDeSemana -> DiaDeSemana -> Bool
sonIgualesDias Lunes Lunes = True
sonIgualesDias Martes Martes = True 
sonIgualesDias Miercoles Miercoles = True
sonIgualesDias Jueves Jueves = True
sonIgualesDias Viernes Viernes = True
sonIgualesDias Sabado Sabado = True
sonIgualesDias Domingo Domingo = True
sonIgualesDias _ _ = False


{-- Ejemplo de uso --}
sonIgualesDiasEjemplo :: Bool
sonIgualesDiasEjemplo = sonIgualesDias Lunes Lunes


{-- 
    Devuelve True si el primer día dado viene después del segundo día dado, y False en caso contrario.
    PRECOND: Los días dados deben ser uno de los 7 días (Lunes, Martes, Miercoles, Jueves, Viernes, Sabado y Domingo).  
--}


vieneDespues :: DiaDeSemana -> DiaDeSemana -> Bool
vieneDespues day1 day2 = 
   ( sonIgualesDias day1 Domingo)  ||
    (sonIgualesDias day1 Martes &&  sonIgualesDias day2 Lunes)  ||
    (sonIgualesDias day1 Miercoles && ( sonIgualesDias day2 Martes || sonIgualesDias day2 Lunes )) ||
    (sonIgualesDias day1 Jueves && ( sonIgualesDias day2 Miercoles || sonIgualesDias day2 Martes || sonIgualesDias day2 Lunes))  ||
    (sonIgualesDias day1 Viernes && ( sonIgualesDias day2 Jueves ||  sonIgualesDias day2 Miercoles || sonIgualesDias day2 Martes || sonIgualesDias day2 Lunes)) ||
    (sonIgualesDias day1 Sabado && ( sonIgualesDias day2 Viernes  || sonIgualesDias day2 Jueves ||  sonIgualesDias day2 Miercoles || sonIgualesDias day2 Martes || sonIgualesDias day2 Lunes)) 
     
    


{-- Ejemplo de uso --}
vieneDespuesEjemplo :: Bool
vieneDespuesEjemplo = vieneDespues Martes Lunes

{-- d.  --}

{--
    Devuelve True si el día dado es un día de semana (Lunes, Martes, Miercoles, Jueves o Viernes), y False en caso contrario.
    PRECOND: El día dado debe ser uno de los 7 días (Lunes, Martes, Miercoles, Jueves, Viernes, Sabado y Domingo).
--}

estaEnElMedio :: DiaDeSemana -> Bool
estaEnElMedio Lunes = False
estaEnElMedio Domingo = False
estaEnElMedio _ = True

{-- Ejemplo de uso --}
estaEnElMedioEjemplo :: Bool
estaEnElMedioEjemplo = estaEnElMedio Miercoles

{-- 3.  --}

{-- a. --}

{--
    Devuelve la negación del valor dado.
    PRECOND: El valor dado debe ser un valor booleano (True o False).
--}

negar :: Bool -> Bool
negar True = False
negar False = True


{-- b.  --}

{--
    Devuelve False si el primer valor dado es True y el segundo valor dado es False, y devuelve True en cualquier otro caso.
    PRECOND: Los valores dados deben ser valores booleanos (True o False).  
--}

implica :: Bool -> Bool -> Bool
implica True b = b 
implica _ _ = True

{-- c.  --}

{--
    Devuelve True si ambos valores dados son True, y False en cualquier otro caso.
    PRECOND: Los valores dados deben ser valores booleanos (True o False).
--}

yTambien :: Bool -> Bool -> Bool
yTambien True True = True
yTambien _ _ = False


{-- d.  --}

{--
    Devuelve False si ambos valores dados son False, y True en cualquier otro caso.
    PRECOND: Los valores dados deben ser valores booleanos (True o False).
--}

oBien :: Bool -> Bool -> Bool
oBien False False = False
oBien _ _ = True



{-- 4.  --} 
{-- REGISTROS --}

{-- 1. --}

data Persona = PersonaC String Int deriving (Show, Eq)

{-- a. --}

{--
    Devuelve el nombre de la persona dada.
    PRECOND: La persona dada debe ser un valor del tipo Persona.
--}

nombre:: Persona -> String
nombre (PersonaC name _) = name

{-- b. --}  

{--
    Devuelve la edad de la persona dada.
    PRECOND: La persona dada debe ser un valor del tipo Persona.
--}

edad :: Persona -> Int
edad (PersonaC _ age) = age

{-- c. --}

{--
    Devuelve una nueva persona con el mismo nombre que la persona dada y con una edad que es un año mayor que la edad de la persona dada.
    PRECOND: La persona dada debe ser un valor del tipo Persona.
--}

crecer :: Persona -> Persona
crecer (PersonaC name age) = PersonaC name (age + 1)

{-- d. --}

{--
    Devuelve una nueva persona con el mismo nombre que la persona dada y con la edad dada.
    PRECOND: La persona dada debe ser un valor del tipo Persona. El nuevo nombre dado debe ser un valor del tipo String.
--}


cambioDeNombre :: String -> Persona -> Persona
cambioDeNombre newName (PersonaC _ age) = PersonaC newName age

{-- e. --}

{--
    Devuelve True si la edad de la primera persona dada es mayor que la edad de la segunda persona dada, y False en caso contrario.
    PRECOND: Las personas dadas deben ser valores del tipo Persona.
--}

esMayorQueLaOtra :: Persona -> Persona -> Bool
esMayorQueLaOtra (PersonaC _ age1) (PersonaC _ age2) = age1 > age2


{-- f. --}

{--
    Devuelve la persona que es mayor entre las dos personas dadas. En caso de que ambas personas tengan la misma edad, devuelve cualquiera de las dos personas.
    PRECOND: Las personas dadas deben ser valores del tipo Persona.
--}

laQueEsMayor :: Persona -> Persona -> Persona
laQueEsMayor p1 p2  = if esMayorQueLaOtra p1 p2 then p1 else p2


{--  2. --}
data TipoDePokemon = Agua | Fuego | Planta deriving (Show, Eq)

data Pokemon = PokemonC  TipoDePokemon  Int deriving Show
data Entrenador = EntrenadorC String  Pokemon  Pokemon deriving Show

{-- a. --}

{--
    Devuelve True si el primer tipo de Pokémon es superior al segundo tipo de Pokémon, y False en caso contrario.
    PRECOND: Los tipos de Pokémon dados deben ser valores del tipo TipoDePokemon.
--}

tipoSuperior :: TipoDePokemon -> TipoDePokemon -> Bool
tipoSuperior Agua Fuego = True
tipoSuperior Fuego Planta = True
tipoSuperior Planta Agua = True
tipoSuperior _ _ = False


{-- 
    Devuelve True si el primer Pokémon dado es superior al segundo Pokémon dado, y False en caso contrario.
    PRECOND: Los Pokémon dados deben ser valores del tipo Pokemon.
--}

superaA :: Pokemon -> Pokemon -> Bool
superaA (PokemonC tipo1 _) (PokemonC tipo2 _) = tipoSuperior tipo1 tipo2


{-- b. --}

{--
    Devuelve la cantidad de Pokémon que el entrenador dado tiene del tipo dado.
    PRECOND: El entrenador dado debe ser un valor del tipo Entrenador. El tipo dado debe ser un valor del tipo TipoDePokemon.
--}

mismoTipo :: TipoDePokemon -> TipoDePokemon -> Bool
mismoTipo Agua Agua = True
mismoTipo Fuego Fuego = True
mismoTipo Planta Planta = True
mismoTipo _ _ = False


{--
    Devuelve la cantidad de Pokémon que el entrenador dado tiene del tipo dado.
    PRECOND: El entrenador dado debe ser un valor del tipo Entrenador. El tipo dado debe ser un valor del tipo TipoDePokemon.
--}
   

cantidadDePokemonDe :: TipoDePokemon -> Entrenador -> Int
cantidadDePokemonDe tipo (EntrenadorC _ (PokemonC  tipo1 _) (PokemonC  tipo2 _)) =
    if mismoTipo tipo tipo1  && mismoTipo tipo tipo2 then 2
    else if mismoTipo tipo tipo1 || mismoTipo tipo tipo2 then 1
    else 0

{-- c. --}

{--
    Devuelve una lista con todos los Pokémon de los dos entrenadores dados.
    PRECOND: Los entrenadores dados deben ser valores del tipo Entrenador.
--}

juntarPokemon :: Entrenador -> Entrenador -> [Pokemon]
juntarPokemon  e1 e2 =  pokemons e1 ++ pokemons e2



pokemons :: Entrenador -> [Pokemon]
pokemons (EntrenadorC _ pokemon1A pokemon2A) = pokemon1A : pokemon2A []

{-- 5. --}

{-- FUNCIONES POLIMORFICAS --}

{-- 1. --}

{-- a. --}

{--
    Devuelve el mismo valor que se le pasa como argumento.
    PRECOND: El valor dado debe ser un valor del tipo a.
--}

loMismo :: a -> a
loMismo x = x

{-- b. --}

{--
    Devuelve el número 7 sin importar el valor que se le pase como argumento.
    PRECOND: El valor dado debe ser un valor del tipo a.
--}

siempreSiete :: a -> Int
siempreSiete _ = 7

{-- c. --}  

{--
    Devuelve una tupla con los elementos en orden inverso.
    PRECOND: Los valores dados deben ser valores del tipo a y b.
--}

swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)    


{-- 2. Estas funciones son polimorficas porque pueden ser utilizadas con cualquier tipo de dato. --}


{-- 6. --}
{-- PATTER MATCHING --} 


{-- 2. --}

{--
    Devuelve True si la lista dada está vacía, y False en caso contrario.
    PRECOND: La lista dada debe ser un valor del tipo [a].
--}

estaVacia :: [a] -> Bool
estaVacia [] = True
estaVacia _ = False


{-- 3. --}

{--
    Devuelve el primer elemento de la lista dada.
    PRECOND: La lista dada debe ser un valor del tipo [a].
--}

elPrimero :: [a] -> a
elPrimero (x:xs) = x

{--4 --}

{--
    Devuelve la lista dada sin su primer elemento.
    PRECOND: La lista dada debe ser un valor del tipo [a].
--}
sinElPrimero :: [a] -> [a]
sinElPrimero (x:xs) = xs 

{--5 --}

{--
    Devuelve una tupla con el primer elemento de la lista dada y la lista dada sin su primer elemento.
    PRECOND: La lista dada debe ser un valor del tipo [a].
--}    
splitHead ::  [a] -> (a, [a])
splitHead  (x:xs) = (x , xs )


{-- fin  --}