
{-- PRACTICA 2 --}

{-- 1. --}

{-- Recursion sobre listas--}

{-- 1. --}

{-- PRECOND: La lista debe ser de numeros enteros --}

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

{-- Ejemplo de uso --}
sumatoriaEjemplo = sumatoria [1, 2, 3, 4, 5] 


{-- 2. --}

{-- PRECOND: La lista puede ser de cualquier tipo --}

longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

{-- Ejemplo de uso --}  
longitudEjemplo = longitud [1, 2, 3, 4, 5] 

{-- 3. --}
{-- PRECOND: La lista debe ser de numeros enteros --}

sucesores :: [Int] -> [Int]
sucesores [] = []
sucesores (x:xs) = (x + 1) : sucesores xs

{-- Ejemplo de uso --}  
sucesoresEjemplo = sucesores [1, 2, 3, 4, 5]

{-- 4. --}
{-- PRECOND: La lista debe ser de tipo Bool --}
conjuncion :: [Bool] -> Bool
conjuncion [] = False
conjuncion (x:xs) = x && conjuncion xs

{-- Ejemplo de uso --}
conjuncionEjemplo = conjuncion [True, True, False, True]

{-- 5. --}
{-- PRECOND: La lista debe ser de tipo Bool --}
disyuncion :: [Bool] -> Bool
disyuncion [] = False
disyuncion (x:xs) = x || disyuncion xs

{-- Ejemplo de uso --}
disyuncionEjemplo = disyuncion [False, False, False, True]

{-- 6. --}
{-- PRECOND: La lista debe ser de listas --}
aplanar:: [[a]] -> [a]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

{-- Ejemplo de uso --}
aplanarEjemplo = aplanar [[1, 2], [3, 4], [5, 6]]

{-- 7. --}
{-- PRECOND: La lista puede ser de cualquier tipo que se pueda comparar --}
pertenece :: Eq a => a -> [a] -> Bool
pertenece _ [] = False
pertenece e (x:xs) = (e == x) || pertenece e xs

{-- Ejemplo de uso --}  
perteneceEjemplo = pertenece 3 [1, 2, 3, 4, 5]


{-- 8. --}
{-- PRECOND:  La lista puede ser de cualquier tipo que se pueda comparar --}

apariciones :: Eq a => a -> [a] -> Int
apariciones _ [] = 0
apariciones e (x:xs) = if (e == x) then 1 + apariciones e xs  else apariciones e xs

{-- Ejemplo de uso --}

aparicionesEjemplo = apariciones 3 [1, 2, 3, 4, 5, 3, 3]


{-- 9. --}
{--  PRECOND:  La lista solo puede ser de numeros enteros --}

losMenoresA :: Int -> [Int] -> [Int]
losMenoresA n [] = []
losMenoresA n (x:xs) =  if x > n then x : losMenoresA n xs else losMenoresA n xs

{-- Ejemplo de uso --}

losMenoresAEjemplo = losMenoresA 3 [1, 2, 3, 4, 5]


{-- 10. --}
{-- PRECOND:  La lista solo debe ser de listas --}
lasDeLongitudMayorA :: Int -> [[a]] -> [[a]]
lasDeLongitudMayorA n [] = []
lasDeLongitudMayorA n (x:xs) =  if (longitud x) > n  then x : lasDeLongitudMayorA n xs else lasDeLongitudMayorA n xs

{-- Ejemplo de uso --}
lasDeLongitudMayorAEjemplo = lasDeLongitudMayorA 2 [[1, 2], [3, 4, 5], [6, 7]]

{-- 11. --}
agregarAlFinal :: [a] -> a -> [a]
agregarAlFinal [] a = [a]
agregarAlFinal (x:xs) a = x : agregarAlFinal xs a

{-- Ejemplo de uso --}
agregarAlFinalEjemplo = agregarAlFinal [1, 2, 3] 4

{-- 12. --}
agregar :: [a] -> [a] -> [a]
agregar l1 l2 = l1 ++ l2

{-- Ejemplo de uso --}
agregarEjemplo = agregar [1, 2, 3] [4, 5, 6]

{-- 13. --}
reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = agregarAlFinal (reversa xs) x

{-- Ejemplo de uso --}
reversaEjemplo = reversa [1, 2, 3, 4, 5]

{-- 14. --}
zipMaximos:: [Int] -> [Int] -> [Int]
zipMaximos l1 [] = l1
zipMaximos [] l2 = l2
zipMaximos [] [] = []
zipMaximos (x:xs) (l:ls) = (if x > l then x else l) : zipMaximos xs ls

{-- Ejemplo de uso --}
zipMaximosEjemplo = zipMaximos [1, 2, 3] [4, 5, 6]


{-- 15. --}
elMinimo :: Ord a => [a] -> a 
elMinimo [] = error "No puede ser una lista vacia"
elMinimo (x:[]) = x
elMinimo (x:xs) = if x > primerElemento xs then elMinimo (x: sinPrimerElemento xs) else elMinimo xs

{-- Ejemplo de uso --}
elMinimoEjemplo = elMinimo [1, 2, 3, 4, 5]


primerElemento:: [a] -> a
primerElemento (x:[]) = x
primerElemento (x:xs) = x


sinPrimerElemento :: [a] -> [a]
sinPrimerElemento (x:[]) = []
sinPrimerElemento (x:xs) = xs


{-- 2. --}

{-- Recursion sobre numeros --}

{-- 1. --}
factorial :: Int -> Int
factorial 0 = 1
factorial n = if n > 0 then n * factorial ( n - 1 ) else error "No se puede calcular el factorial de un numero negativo"

{-- Ejemplo de uso --}
factorialEjemplo = factorial 5

{-- 2. --}

cuentaRegresiva :: Int -> [Int]
cuentaRegresiva 0 = []
cuentaRegresiva n = if n < 0 then cuentaRegresiva 0 else n : cuentaRegresiva (n-1)

{-- Ejemplo de uso --}
cuentaRegresivaEjemplo = cuentaRegresiva 5

{-- 3. --}
repetir :: Int -> a -> [a]
repetir 0 _ = []
repetir n e = if n < 0 then [] else e : repetir (n-1) e

{-- Ejemplo de uso --}
repetirEjemplo = repetir 3 5

{-- 4. --}
losPrimeros :: Int -> [a] -> [a]
losPrimeros n [] = []
losPrimeros 0 _ = []
losPrimeros n (x:xs) = x : losPrimeros (n-1) xs

{-- Ejemplo de uso --}
losPrimerosEjemplo = losPrimeros 3 [1, 2, 3, 4, 5]
  
{-- 5. --}
sinLosPrimeros :: Int -> [a] -> [a]
sinLosPrimeros 0 ls = ls
sinLosPrimeros n [] = []
sinLosPrimeros n (x:xs) = sinLosPrimeros (n-1) xs

{-- Ejemplo de uso --}
sinLosPrimerosEjemplo = sinLosPrimeros 2 [1, 2, 3, 4, 5]

{-- 3. --}

{-- Registros --}

{-- 1. --}

{-- a. --}
data Persona = P name age Deriving Show

mayoresA :: Int -> [Persona] -> [Persona]
mayoresA n [] = []
mayoresA n (x:xs) = if esMayorA n x  then x : mayoresA n xs else mayoresA n xs

{-- Ejemplo de uso --}
mayoresAEjemplo = mayoresA 18 [P "Alice" 20, P "Bob" 17, P "Charlie" 25]


esMayorA :: Int -> Persona -> Bool
esMayorA n p = edad p > n

edad:: Persona -> Int
edad (P name age) = age

{-- b. --}
promedioEdad :: [Persona] -> Int
promedioEdad [] = 0
promedioEdad ps = sumaEdades ps / longitud ps


{-- Ejemplo de uso --}
promedioEdadEjemplo = promedioEdad [P "Alice" 20, P "Bob" 17, P "Charlie" 25]

sumaEdades :: [Persona] -> Int
sumaEdades [] = 0
sumaEdades (x:xs) = edad x + sumaEdades xs

{-- c. --}
elMasViejo :: [Persona] -> Persona
elMasViejo [] = error "No debe ser una lista Vacia"
elMasViejo (x:[]) = x
elMasViejo (x:xs) = if edad x > edad (primerElemento xs) then elMasViejo (x: (sinPrimerElemento xs)) else elMasViejo xs

{-- Ejemplo de uso --}
elMasViejoEjemplo = elMasViejo [P "Alice" 20, P "Bob" 17, P "Charlie" 25]

{-- 2. --}

data TipoDePokemon = Agua | Fuego | Planta deriving (Show, Eq)

data Pokemon = PokemonC  TipoDePokemon  Int deriving Show
data Entrenador = EntrenadorC String  [Pokemon]  deriving Show

{-- a. --}
cantPokemon :: Entrenador -> Int
cantPokemon e = longitud (pokemons e)

{-- Ejemplo de uso --}
cantPokemonEjemplo = cantPokemon (EntrenadorC "Ash" [PokemonC Agua 10, PokemonC Fuego 20, PokemonC Planta 30])  


pokemons:: Entrenador -> [Pokemon]
pokemons (EntrenadorC _ xs) = xs


{-- b. --}

cantPokemonDe :: TipoDePokemon -> Entrenador -> Int
cantPokemonDe t e = pokemonsTipoDe t (pokemons e)

{-- Ejemplo de uso --}
cantPokemonDeEjemplo = cantPokemonDe Agua (EntrenadorC "Ash" [PokemonC Agua 10, PokemonC Fuego 20, PokemonC Planta 30])


pokemonsTipoDe :: TipoDePokemon ->  [Pokemon]
pokemonsTipoDe t [] = []
pokemonsTipoDe t (x:xs) = if t == pokemonTipo x then x : pokemonsTipoDe t xs else pokemonsTipoDe t xs

pokemonTipo :: Pokemon -> TipoDePokemon
pokemonTipo (PokemonC t _) = t


{-- c. --}

cuantosDeTipo_De_LeGananATodosLosDe_ :: TipoDePokemon -> Entrenador -> Entrenador -> Int
cuantosDeTipo_De_LeGananATodosLosDe_ e1 e2 = pokemonsQueGananA (pokemons e1) (pokemons e2)

{-- Ejemplo de uso --}
cuantosDeTipo_De_LeGananATodosLosDe_Ejemplo = cuantosDeTipo_De_LeGananATodosLosDe_ Agua (EntrenadorC "Ash" [PokemonC Agua 10, PokemonC Fuego 20, PokemonC Planta 30]) (EntrenadorC "Misty" [PokemonC Agua 15, PokemonC Fuego 25, PokemonC Planta 35])   

pokemonsQueGananA :: [Pokemon] -> [Pokemon] -> [Pokemon]
pokemonsQueGananA [] n = []
pokemonsQueGananA (x:xs) n = if leGanaATodos x n then x : pokemonsQueGananA xs n else pokemonsQueGananA xs n


leGanaATodos :: Pokemon -> [Pokemon] -> Bool
leGanaATodos p [] = True
leGanaATodos p (x:xs) = tipoSuperior (pokemonTipo p) (pokemonTipo x) && leGanaATodos p xs


tipoSuperior :: TipoDePokemon -> TipoDePokemon -> Bool
tipoSuperior Agua Fuego = True
tipoSuperior Fuego Planta = True
tipoSuperior Planta Agua = True
tipoSuperior _ _ = False

{-- d. --}

esMaestroPokemon :: Entrenador -> Bool
esMaestroPokemon e = tieneTipo Agua (pokemons e) && tieneTipo Fuego (pokemons e) && tieneTipo Planta (pokemons e)


{-- Ejemplo de uso --}
esMaestroPokemonEjemplo = esMaestroPokemon (EntrenadorC "Ash" [PokemonC Agua 10, PokemonC Fuego 20, PokemonC Planta 30])


tieneTipo :: TipoDePokemon -> [Pokemon] -> Bool
tieneTipo t [] = False
tieneTipo t (x:xs) =  (pokemonTipo x) == t || tieneTipo t xs

{-- 3. --}


data Seniority = Junior | SemiSenior | Senior Deriving Show
data Proyecto = ConsProyecto String Deriving Show
data Rol = Developer Seniority Proyecto | Management Seniority Proyecto Deriving Show
data Empresa = ConstEmpresa [Rol]

{-- a. --}
proyectos :: Empresa -> [Proyecto]
proyectos [] = []
proyectos (ConstEmpresa (xs)) = filtrarProyectosRepetidos(allProyectos xs)

{-- Ejemplo de uso --}
proyectosEjemplo = proyectos empresaEjemplo


filtrarProyectosRepetidos :: [Proyecto] -> [Proyecto]
filtrarProyectosRepetidos [] = []
filtrarProyectosRepetidos (x:xs) = if yaExiste x xs then filtrarProyectosRepetidos xs else x : filtrarProyectosRepetidos xs

yaExiste :: Proyecto -> [Proyecto] -> Bool
yaExiste p [] = False
yaExiste p (x:xs) =  mismoProyecto p x || yaExiste  p xs


mismoProyecto :: Proyecto -> Proyecto -> Bool
mismoProyecto (ConsProyecto s1) (ConsProyecto s2) = s1 == s2


allProyectos :: [Rol] -> [Proyecto]
allProyectos [] = []
allProyectos (x:xs) = (proyecto x) : allProyectos xs
    

proyecto :: Rol -> Proyecto
proyecto (Developer s p) = p
proyecto (Management s p ) = p

{-- b. --}
losDevSenior :: Empresa -> [Proyecto] -> Int
losDevSenior (ConstEmpresa xs) ps =  longitud (losDevQuePertenecen xs ps)


{-- Ejemplo de uso --}
losDevSeniorEjemplo = losDevSenior empresaEjemplo [ConsProyecto "Proyecto A"]

losDevQuePertenecen :: [Rol] -> [Proyecto] -> [Rol]
losDevQuePertenecen [] ps = []
losDevQuePertenecen (x:xs) ps = if ((esDeveloper x )&& (yaExiste (proyecto x) ps)) then x : losDevQuePertenecen xs ps else losDevQuePertenecen xs ps 


esDeveloper :: Rol -> Bool
esDeveloper (Developer s p) = True
esDeveloper (Management s p) = False  

 
{-- c. --}

cantQueTrabajaEn :: [Proyecto] -> Empresa -> Int
cantQueTrabajaEn ps (ConstEmpresa rs) = longitud ( trabajanEn ps rs ) 


trabajanEn :: [Proyecto] -> [Rol] -> [Rol]
trabajanEn ps [] = []
trabajanEn ps (x:xs) = if (yaExiste (proyecto x) ps) then x : trabajanEn ps xs else trabajanEn ps xs 
 
{-- Ejemplo de uso --}
cantQueTrabajaEnEjemplo = cantQueTrabajaEn [ConsProyecto "Proyecto A"] empresaEjemplo


{-- d. --}

asignadosPorProyecto :: Empresa -> [(Proyecto, Int)]
asignadosPorProyecto e = proyectoAsignados (proyectos e) e


proyectoAsignados :: [Proyecto] -> Empresa -> [(Proyecto, Int)]
proyectoAsignados [] e = []
proyectoAsignados (x:xs) e = (x , cantQueTrabajaEn (x:[]) e) : proyectoAsignados xs e

{-- Ejemplo de uso --}
empresaEjemplo = ConstEmpresa [Developer Senior (ConsProyecto "Proyecto A"), Management SemiSenior (ConsProyecto "Proyecto B"), Developer Junior (ConsProyecto "Proyecto A"), Developer Senior (ConsProyecto "Proyecto C")]