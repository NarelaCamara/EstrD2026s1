-- Práctica de ejercicios # 2 - Listas y Recursión

-- 1. Recursión sobre listas
-- 1.1
sumatoria :: [Int] -> Int
sumatoria []     = 0
sumatoria (n:ns) = n + sumatoria ns

-- 1.2
longitud :: [a] -> Int
longitud []     = 0
longitud (x:xs) = 1 + longitud xs

-- 1.3
sucesores :: [Int] -> [Int]
sucesores []     = []
sucesores (n:ns) = n+1 : sucesores ns

-- 1.4
conjuncion :: [Bool] -> Bool
conjuncion []     = True
conjuncion (b:bs) = b && conjuncion bs

-- 1.5
disyuncion :: [Bool] -> Bool
disyuncion []     = False
disyuncion (b:bs) = b || disyuncion bs

-- 1.6
aplanar :: [[a]] -> [a]
aplanar []       = []
aplanar (xs:xss) = xs ++ aplanar xss

-- 1.7
pertenece :: Eq a => a -> [a] -> Bool
pertenece _ []     = False
pertenece e (x:xs) = e==x || pertenece e xs

-- 1.8
apariciones :: Eq a => a -> [a] -> Int
apariciones _ []     = 0
apariciones e (x:xs) = if e==x then 1 + apariciones e xs else apariciones e xs 

-- 1.9
losMenoresA :: Int -> [Int] -> [Int]
losMenoresA m []     = []
losMenoresA m (n:ns) = if n<m then n : losMenoresA m ns else losMenoresA m ns

-- 1.10
lasDeLongitudMayorA :: Int -> [[a]] -> [[a]]
lasDeLongitudMayorA _ []       = []
lasDeLongitudMayorA n (xs:xss) = 
    if length xs > n then xs : lasDeLongitudMayorA n xss
                     else lasDeLongitudMayorA n xss

-- 1.11
agregarAlFinal :: [a] -> a -> [a]
agregarAlFinal []     e = e:[]
agregarAlFinal (x:xs) e = x : agregarAlFinal xs e

-- 1.12
agregar :: [a] -> [a] -> [a]
agregar []     ys = ys
agregar (x:xs) ys = x : agregar xs ys 

-- 1.13
reversa :: [a] -> [a]
reversa []     = []
reversa (x:xs) = reversa xs ++ x:[] 

-- 1.14
zipMaximos :: [Int] -> [Int] -> [Int]
zipMaximos []     ms     = []
zipMaximos ns     []     = []
zipMaximos (n:ns) (m:ms) = maxDelPar (n,m) : zipMaximos ns ms 

maxDelPar :: (Int,Int) -> Int
maxDelPar (n, m) = if (n > m) then n else m

-- 1.15
elMinimo :: Ord a => [a] -> a
elMinimo []     = error "Lista vacía"
elMinimo (x:[]) = x
elMinimo (x:xs) = minEntre x (elMinimo xs) 

minEntre :: Ord a => a -> a -> a
minEntre x y =  if esMenor x y then x else y

esMenor :: Ord a => a -> a -> Bool
esMenor x y = x<y

-- 2. Recursión sobre números
-- 2.1
factorial :: Int -> Int
factorial n = if n<0 
                then error "no existe factorial de números negativos."
                else factorialS n  

factorialS :: Int -> Int 
factorialS 0 = 1
factorialS n = n * factorialS (n-1) 

-- 2.2
cuentaRegresiva :: Int -> [Int]
cuentaRegresiva n =
    if n<1 then []
           else n : cuentaRegresiva (n-1)

-- 2.3
repetir :: Int -> a -> [a]
repetir 0 _ = []
repetir n e = e : repetir (n-1) e

-- 2.4
losPrimeros :: Int -> [a] -> [a]
losPrimeros 0 _      = []
losPrimeros _ []     = []
losPrimeros n (x:xs) = x : losPrimeros (n-1) xs 

-- 2.5
sinLosPrimeros :: Int -> [a] -> [a]
sinLosPrimeros 0 xs     = xs 
sinLosPrimeros _ []     = []
sinLosPrimeros n (x:xs) = sinLosPrimeros (n-1) xs

-- 3. Registros
data Persona = P String Int
    deriving Show

-- 3.1
-- a
mayoresA :: Int -> [Persona] -> [Persona]
mayoresA ed []     = []
mayoresA ed (p:ps) = if esMayorQue p ed
                        then p : mayoresA ed ps
                        else mayoresA ed ps

esMayorQue :: Persona -> Int -> Bool 
esMayorQue p ed = (edad p)>ed

edad :: Persona -> Int
edad (P _ e) = e

-- b
promedioEdad :: [Persona] -> Int
promedioEdad [] = error "la lista debe poseer al menos una persona."
promedioEdad ps = div (sumaEdades ps) (length ps)

sumaEdades :: [Persona] -> Int
sumaEdades []     = 0
sumaEdades (p:ps) = edad p + sumaEdades ps

-- c
elMasViejo :: [Persona] -> Persona
elMasViejo []     = error "la lista debe poseer al menos una persona."
elMasViejo (p:[]) = p 
elMasViejo (p:ps) = oldie p (elMasViejo ps)

oldie :: Persona -> Persona -> Persona
oldie p p' = if esMayorQue p (edad p') then p else p'

-- 3.2
data TipoDePokemon = Agua | Fuego | Planta
    deriving Show

data Pokemon = ConsPokemon TipoDePokemon Int
    deriving Show

data Entrenador = ConsEntrenador String [Pokemon]
    deriving Show

-- a
cantPokemon :: Entrenador -> Int
cantPokemon (ConsEntrenador _ pks) = length pks

-- b
cantPokemonDe :: TipoDePokemon -> Entrenador -> Int
cantPokemonDe t (ConsEntrenador _ pks) = cantDe pks t 

cantDe :: [Pokemon] -> TipoDePokemon -> Int 
cantDe []       _ = 0
cantDe (pk:pks) t = unoSiMismoT pk t + cantDe pks t

unoSiMismoT :: Pokemon -> TipoDePokemon -> Int 
unoSiMismoT (ConsPokemon tp _) t = if esMismoTipo tp t then 1 else 0

esMismoTipo :: TipoDePokemon -> TipoDePokemon -> Bool 
esMismoTipo Agua     Agua    = True
esMismoTipo Fuego    Fuego   = True
esMismoTipo Planta   Planta  = True
esMismoTipo _        _       = False

-- c
cuantosDeTipo_De_LeGananATodosLosDe_ :: TipoDePokemon -> Entrenador -> Entrenador -> Int
cuantosDeTipo_De_LeGananATodosLosDe_ t (ConsEntrenador _ pks) e = cuantosDeTipo_LeGananATodosLosDe_ t pks e 

cuantosDeTipo_LeGananATodosLosDe_ :: TipoDePokemon -> [Pokemon] -> Entrenador -> Int 
cuantosDeTipo_LeGananATodosLosDe_ t pks (ConsEntrenador _ pks') = cuantosDeTipo t pks pks' 

cuantosDeTipo :: TipoDePokemon -> [Pokemon] -> [Pokemon] -> Int 
cuantosDeTipo _ []       _    = 0
cuantosDeTipo t (pk:pks) pks' = 
    if esMismoTipo t (tipoPokemon pk) && superaATodos pk pks' 
        then 1 + cuantosDeTipo t pks pks'
        else cuantosDeTipo t pks pks'

tipoPokemon :: Pokemon -> TipoDePokemon
tipoPokemon (ConsPokemon t _) = t 

superaATodos :: Pokemon -> [Pokemon] -> Bool 
superaATodos _ []        = True
superaATodos p (p':pks') = tipoSuperaA (tipoPokemon p) (tipoPokemon p') && superaATodos p pks'

tipoSuperaA :: TipoDePokemon -> TipoDePokemon -> Bool
tipoSuperaA     Agua    Fuego   = True
tipoSuperaA     Fuego   Planta  = True
tipoSuperaA     Planta  Agua    = True
tipoSuperaA     _       _       = False

-- d
esMaestroPokemon :: Entrenador -> Bool
esMaestroPokemon (ConsEntrenador _ pks) = tieneUnoDe pks Agua && tieneUnoDe pks Fuego && tieneUnoDe pks Planta

tieneUnoDe :: [Pokemon] -> TipoDePokemon -> Bool 
tieneUnoDe []       t = False
tieneUnoDe (pk:pks) t = esMismoTipo (tipoPokemon pk) t || tieneUnoDe pks t

-- 3.3
data Seniority = Junior | SemiSenior | Senior
    deriving Show

data Proyecto = ConsProyecto String
    deriving Show

data Rol = Developer Seniority Proyecto | Management Seniority Proyecto
    deriving Show

data Empresa = ConsEmpresa [Rol]
    deriving Show

-- a
proyectos :: Empresa -> [Proyecto]
proyectos (ConsEmpresa rs) = proyectosAux rs 

proyectosAux :: [Rol] -> [Proyecto]
proyectosAux []     = []
proyectosAux (r:rs) = if perteneceA (proyectoDe r) (proyectosAux rs)
                        then proyectosAux rs 
                        else (proyectoDe r) : proyectosAux rs  

perteneceA :: Proyecto -> [Proyecto] -> Bool 
perteneceA _   []    = False 
perteneceA py (p:ps) = esElMismoP py p || perteneceA py ps 

esElMismoP :: Proyecto -> Proyecto -> Bool 
esElMismoP (ConsProyecto s) (ConsProyecto s') = s==s'

proyectoDe :: Rol -> Proyecto
proyectoDe (Developer  _ p) = p
proyectoDe (Management _ p) = p 

-- b
losDevSenior :: Empresa -> [Proyecto] -> Int
losDevSenior (ConsEmpresa rs) ps = devsSeniorEn rs ps 

devsSeniorEn :: [Rol] -> [Proyecto] -> Int 
devsSeniorEn []     _  = 0
devsSeniorEn (r:rs) ps = if esDevSeniorYTrabajaEn r ps 
                            then 1 + devsSeniorEn rs ps
                            else devsSeniorEn rs ps

esDevSeniorYTrabajaEn :: Rol -> [Proyecto] -> Bool 
esDevSeniorYTrabajaEn (Developer s p) ps = esSenior s && perteneceA p ps
esDevSeniorYTrabajaEn _               _  = False

esSenior :: Seniority -> Bool 
esSenior Senior = True 
esSenior _      = False 

-- c
cantQueTrabajanEn :: [Proyecto] -> Empresa -> Int
cantQueTrabajanEn [] _                = 0 
cantQueTrabajanEn ps (ConsEmpresa rs) = cantTrabajanEn rs ps 

cantTrabajanEn :: [Rol] -> [Proyecto] -> Int 
cantTrabajanEn []     _  = 0
cantTrabajanEn (r:rs) ps = if perteneceA (proyectoDe r) ps 
                             then 1 + cantTrabajanEn rs ps
                             else cantTrabajanEn rs ps

-- d 
asignadosPorProyecto :: Empresa -> [(Proyecto, Int)]
asignadosPorProyecto (ConsEmpresa rs) = proyectosYAsignados rs 

proyectosYAsignados :: [Rol] -> [(Proyecto, Int)] 
proyectosYAsignados []     = []
proyectosYAsignados (r:rs) = actualizar (proyectoDe r) (proyectosYAsignados rs)

actualizar :: Proyecto -> [(Proyecto, Int)] -> [(Proyecto, Int)] 
actualizar py []          = (py,1):[]
actualizar py ((p,a):pas) = if esElMismoP py p 
                            then (p,a+1) : pas
                            else (p,a) : actualizar py pas