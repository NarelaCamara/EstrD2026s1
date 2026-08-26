-- TP 1 - Tipos Algebraicos
-- 2. Números enteros
-- 2.1.a
sucesor :: Int -> Int
sucesor n = n+1 

-- 2.1.b
sumar :: Int -> Int -> Int
sumar n m = n+m

-- 2.1.c
divisionYResto :: Int -> Int -> (Int, Int)
-- PRECOND: m no puede ser cero.
divisionYResto n m = (div n m, mod n m)

-- 2.1.d
maxDelPar :: (Int,Int) -> Int
maxDelPar (n, m) =
    if (n == m)     then error "Los numeros de la dupla son iguales."
    else if (n > m) then n 
    else                 m

-- 2.2
-- sucesor (sumar 2 (maxDelPar (divisionYResto 31 4)))
-- sumar (sucesor 8) (maxDelPar (divisionYResto 1 1))
-- maxDelPar (maxDelPar(divisionYResto 90 9), (sucesor (sumar 1 2)))
-- sumar 8 (sumar (sucesor (-1)) (maxDelPar (divisionYResto 4 2)))

-- 3. Tipos enumerativos
-- 3.1
data Dir = Norte | Este | Sur | Oeste
    deriving Show

-- 3.1.a
opuesto :: Dir -> Dir
opuesto Norte   = Sur
opuesto Este    = Oeste
opuesto Sur     = Norte
opuesto Oeste   = Este

-- 3.1.b
iguales :: Dir -> Dir -> Bool
iguales Norte   Norte   = True
iguales Este    Este    = True
iguales Sur     Sur     = True
iguales Oeste   Oeste   = True
iguales _       _       = False

-- 3.1.c
siguiente :: Dir -> Dir
-- PRECOND: la dirección Oeste no tiene siguiente.
siguiente Norte = Este
siguiente Este  = Sur
siguiente Sur   = Oeste
siguiente Oeste = error "Dir Oeste no tiene siguiente"
-- Posee una precondición ya que no se encuentra definida para todas las direcciones posibles, por lo tanto es parcial.

-- 3.2
data DiaDeSemana = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo
    deriving Show

-- 3.2.a
primeroYUltimoDia :: (DiaDeSemana, DiaDeSemana)
primeroYUltimoDia = (Lunes, Domingo)

-- 3.2.b
empiezaConM :: DiaDeSemana -> Bool
empiezaConM Martes      = True
empiezaConM Miercoles   = True
empiezaConM _           = False

-- 3.2.c
vieneDespues :: DiaDeSemana -> DiaDeSemana -> Bool
vieneDespues d1 d2  = diaNumero d1 > diaNumero d2

diaNumero :: DiaDeSemana -> Int
diaNumero Lunes      = 1
diaNumero Martes     = 2
diaNumero Miercoles  = 3
diaNumero Jueves     = 4
diaNumero Viernes    = 5
diaNumero Sabado     = 6
diaNumero Domingo    = 7

-- 3.2.d
estaEnElMedio :: DiaDeSemana -> Bool
estaEnElMedio Lunes     = False
estaEnElMedio Domingo   = False
estaEnElMedio _         = True

-- 3.3.a
negar :: Bool -> Bool
negar True  = False
negar False = True

-- 3.3.b
implica :: Bool -> Bool -> Bool
implica True b = b
implica _    _ = True

-- 3.3.c
yTambien :: Bool -> Bool -> Bool
yTambien True b = b
yTambien _    _ = False

-- 3.3.d
oBien :: Bool -> Bool -> Bool
oBien False b = b
oBien _     _ = True

-- 4. Registros
-- 4.1
data Persona = P String Int
            -- P nombre edad
    deriving Show

-- 4.1.a
nombre :: Persona -> String
nombre (P n _) = n

-- 4.1.b
edad :: Persona -> Int
edad (P _ e) = e 

-- 4.1.c
crecer :: Persona -> Persona
crecer (P n e) = P n (e+1)

-- 4.1.d
cambioDeNombre :: String -> Persona -> Persona
cambioDeNombre newn (P n e) = (P newn e)

-- 4.1.e
esMayorQueLaOtra :: Persona -> Persona -> Bool
esMayorQueLaOtra p p' = (edad p > edad p')

-- 4.1.f
laQueEsMayor :: Persona -> Persona -> Persona
laQueEsMayor p p' = 
      if        esMayorQueLaOtra p p' then p
      else if   esMayorQueLaOtra p' p then p'
      else      error "Ambas personas tienen la misma edad." 

-- 4.2
data Pokemon = Pok TipoDePokemon Int
               --  TipoDePokemon Energía (%)
    deriving Show

data TipoDePokemon = Agua | Fuego | Planta
    deriving Show

data Entrenador =   Ent String Pokemon Pokemon
                    --  Nombre Pokemons
    deriving Show

-- 4.2.a
superaA :: Pokemon -> Pokemon -> Bool 
superaA poke1 poke2 = tipoPokeSuperaA (tipoPoke poke1) (tipoPoke poke2)

tipoPoke :: Pokemon -> TipoDePokemon
tipoPoke (Pok t _) = t

tipoPokeSuperaA :: TipoDePokemon -> TipoDePokemon -> Bool
tipoPokeSuperaA Agua    Fuego   = True 
tipoPokeSuperaA Fuego   Planta  = True
tipoPokeSuperaA Planta  Agua    = True
tipoPokeSuperaA _       _       = False

-- 4.2.b
cantidadDePokemonDe :: TipoDePokemon -> Entrenador -> Int
cantidadDePokemonDe tdp (Ent _ poke1 poke2) =
    unoSiEsMismoTipoPoke tdp (tipoPoke poke1) + unoSiEsMismoTipoPoke tdp (tipoPoke poke2)

unoSiEsMismoTipoPoke :: TipoDePokemon -> TipoDePokemon -> Int
unoSiEsMismoTipoPoke t1 t2 = if esMismoTipo t1 t2 then 1 else 0

esMismoTipo :: TipoDePokemon -> TipoDePokemon -> Bool
esMismoTipo Agua    Agua    = True
esMismoTipo Fuego   Fuego   = True
esMismoTipo Planta  Planta  = True
esMismoTipo _       _       = False

-- 4.2.c
juntarPokemon :: (Entrenador, Entrenador) -> [Pokemon]
juntarPokemon (e1, e2) = pokesDe e1 ++ pokesDe e2 

pokesDe :: Entrenador -> [Pokemon]
pokesDe (Ent _ poke1 poke2) = poke1:poke2:[]

-- 5. Funciones polimórficas
-- 5.1.a
loMismo :: a -> a
loMismo e = e

-- 5.1.b
siempreSiete :: a -> Int
siempreSiete e = 7

-- 5.1.c
swap :: (a,b) -> (b, a)
swap (x,y) = (y,x)
--  Existen dos variables de tipo diferentes ya que son funciones polimórficas, estructuras de datos genéricas, que se pueden utilizar con cualquier tipo de datos.

-- 5.2
-- Estas funciones son polimórficas porque definiendo en una única función, se pueden usar para cualquier tipo de datos.

-- 6. Pattern matching sobre listas
-- 6.2
estaVacia :: [a] -> Bool
estaVacia [] = True
estaVacia _  = False

-- 6.3
elPrimero :: [a] -> a
elPrimero []    = error "La lista es vacia." 
elPrimero (x:_) = x

-- 6.4
sinElPrimero :: [a] -> [a]
sinElPrimero []     = error "La lista es vacia."  
sinElPrimero (x:xs) = xs

-- 6.5
splitHead :: [a] -> (a, [a])
splitHead []     = error "La lista es vacia." 
splitHead (x:xs) = (x,xs)