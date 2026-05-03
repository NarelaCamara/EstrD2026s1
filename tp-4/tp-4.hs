{-- PRACTICA 4 --}


{-- 1. --}

data Pizza = Prepizza | Capa Ingrediente Pizza deriving Show

data Ingrediente = Salsa | Queso | Jamon | Aceitunas Int deriving Show


{-- PRECONDICION: La pizza debe ser válida
    Proposito: Devuelve la cantidad de capas de la pizza --}
cantidadDeCapas :: Pizza -> Int
cantidadDeCapas Prepizza = 0
cantidadDeCapas (Capa i p) = 1 + cantidadDeCapas p

{-- Ejemplo de uso --}
cantidadDeCapasEjemplo = cantidadDeCapas (Capa Salsa (Capa Queso (Capa Queso Prepizza)))

{-- PRECONDICION: La lista de ingredientes debe ser válida
    Proposito: Devuelve una pizza con los ingredientes dados --}
armarPizza:: [Ingrediente] -> Pizza
armarPizza [] = Prepizza
armarPizza (x:xs) = (Capa x (armarPizza xs))

{-- Ejemplo de uso --}
armarPizzaEjemplo = armarPizza [Salsa, Queso, Jamon]


{-- PRECONDICION: La pizza debe ser válida
    Proposito: Devuelve una pizza sin jamón --}
sacarJamon :: Pizza -> Pizza
sacarJamon Prepizza = Prepizza
sacarJamon (Capa i p) = if esJamon i then (sacarJamon p) else (Capa i (sacarJamon p))


esJamon:: Ingrediente -> Bool
esJamon Jamon = True
esJamon _ = False

{-- Ejemplo de uso --}
sacarJamonEjemplo = sacarJamon (Capa Jamon (Capa Salsa (Capa Queso (Capa Jamon Prepizza))))


{-- PRECONDICION: La pizza debe ser válida
    Proposito: Devuelve True si la pizza tiene solo salsa y queso, False en caso contrario --}
tieneSoloSalsaYQueso :: Pizza -> Bool
tieneSoloSalsaYQueso Prepizza = True
tieneSoloSalsaYQueso (Capa i p) = esQuesoOSalsa i && tieneSoloSalsaYQueso p 


esQuesoOSalsa :: Ingrediente -> Bool
esQuesoOSalsa Salsa = True
esQuesoOSalsa Queso = True
esQuesoOSalsa _ = False

{-- Ejemplo de uso --}
tieneSoloSalsaYQuesoEjemplo = tieneSoloSalsaYQueso (Capa Salsa (Capa Queso (Capa Jamon Prepizza)))


{-- PRECONDICION: La pizza debe ser válida
    Proposito: Devuelve una pizza con el doble de aceitunas --}
duplicarAceitunas:: Pizza -> Pizza 
duplicarAceitunas Prepizza = Prepizza
duplicarAceitunas (Capa i p) =  Capa (duplicarCantAceitunas i) (duplicarAceitunas p)


duplicarCantAceitunas:: Ingrediente -> Ingrediente
duplicarCantAceitunas (Aceitunas n) = Aceitunas (n * 2)
duplicarCantAceitunas n = n


{-- Ejemplo de uso --}
duplicarAceitunasEjemplo = duplicarAceitunas (Capa (Aceitunas 3) (Capa (Aceitunas 3) (Capa Queso Prepizza)))

{-- PRECONDICION: La lista de pizzas debe ser válida
    Proposito: Devuelve una lista de tuplas con la cantidad de capas y la pizza correspondiente --}
cantCapasPorPizza :: [Pizza] -> [(Int, Pizza)] 
cantCapasPorPizza [] = []
cantCapasPorPizza (x:xs) = (cantidadDeCapas x , x) : cantCapasPorPizza xs

{-- Ejemplo de uso --}
cantCapasPorPizzaEjemplo = cantCapasPorPizza [Capa Salsa (Capa Queso Prepizza), Capa Jamon (Capa Salsa (Capa Queso Prepizza))]

{-- 2. --}
data Dir = Izq | Der deriving Show
data Objeto = Tesoro | Chatarra deriving Show

data Cofre = CofreC [Objeto] deriving Show

data Mapa = Fin Cofre | Bifurcacion Cofre Mapa Mapa deriving Show

{-- 1. --}

{-- PRECONDICION: El mapa debe ser válido
    Proposito: Devuelve True si hay un tesoro en el mapa, False en caso contrario --}
hayTesoro:: Mapa -> Bool
hayTesoro (Fin c) = hayTesoroEnCofre c
hayTesoro (Bifurcacion c m1 m2) =  (hayTesoroEnCofre c) || hayTesoro m1 || hayTesoro m2


hayTesoroEnCofre:: Cofre -> Bool
hayTesoroEnCofre (CofreC ts) = hayAlgunTesoro ts

hayAlgunTesoro:: [Objeto] -> Bool
hayAlgunTesoro [] = False
hayAlgunTesoro (x:xs) = (esTesoro x) || (hayAlgunTesoro xs)


esTesoro:: Objeto -> Bool
esTesoro Tesoro = True
esTesoro _ = False

{-- Ejemplo de uso --}
hayTesoroEjemplo = hayTesoro (Bifurcacion (CofreC [Chatarra]) (Fin (CofreC [Tesoro])) (Fin (CofreC [])))

{-- PRECONDICION: El mapa debe ser válido
    Proposito: Devuelve True si hay un tesoro en el mapa, False en caso contrario --}
hayTesoroEn:: [Dir] -> Mapa -> Bool
hayTesoroEn [] (Fin c) = hayTesoroEnCofre c
hayTesoroEn [] (Bifurcacion c m1 m2) = hayTesoroEnCofre c
hayTesoroEn _ (Fin c) = False
hayTesoroEn (x:xs) (Bifurcacion c m1 m2) = if esIzquierda x then hayTesoroEn xs m1 else hayTesoroEn xs m2 

{-- Ejemplo de uso --}
hayTesoroEnEjemplo = hayTesoroEn [Izq] (Bifurcacion (CofreC [Chatarra]) (Fin (CofreC [Tesoro])) (Fin (CofreC [])))


esIzquierda:: Dir -> Bool
esIzquierda Izq = True
esIzquierda _ = False

{-- PRECONDICION: El mapa debe ser válido
    Proposito: Devuelve el camino al tesoro en el mapa, si existe --}
caminoAlTesoro:: Mapa -> [Dir]
caminoAlTesoro (Fin c) = []
caminoAlTesoro (Bifurcacion c m1 m2) = if hayTesoroEnCofre c then [] else (if hayTesoro m1 then Izq : caminoAlTesoro m1 else Der : caminoAlTesoro m1)

{-- Ejemplo de uso --}

ejemploCaminoAlTesoro = caminoAlTesoro (Bifurcacion (CofreC [Chatarra]) 
    (Bifurcacion (CofreC [Chatarra]) (Fin (CofreC [Chatarra])) (Fin (CofreC [Tesoro]) ))
    (Bifurcacion (CofreC [Chatarra]) (Fin (CofreC [Chatarra])) (Fin (CofreC [Chatarra]) )))

{-- PRECONDICION: El mapa debe ser válido
    Proposito: Devuelve el camino de la rama más larga en el mapa --}
caminoDeLaRamaMasLarga:: Mapa -> [Dir]
caminoDeLaRamaMasLarga (Fin _) = []
caminoDeLaRamaMasLarga (Bifurcacion c m1 m2) = 
    if longitud (caminoDeLaRamaMasLarga m1) > longitud (caminoDeLaRamaMasLarga m2) 
        then Izq : caminoDeLaRamaMasLarga m1 
        else Der : caminoDeLaRamaMasLarga m2
 
longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs


{-- Ejemplo de uso --}
ejemploCaminoDeLaRamaMasLarga = caminoDeLaRamaMasLarga (Bifurcacion (CofreC [Chatarra]) 
    (Bifurcacion (CofreC [Chatarra]) 
        (Fin (CofreC [Chatarra])) 
        (Fin (CofreC [Chatarra]) ))
    (Fin (CofreC [Chatarra, Tesoro])))


{-- --}
tesorosPorNivel:: Mapa -> [[Objeto]]
tesorosPorNivel (Fin c) = (saquearCofre c) : []
tesorosPorNivel (Bifurcacion c m1 m2) =  (saquearCofre c) : concatenar (tesorosPorNivel m1) (tesorosPorNivel m2)

concatenar:: [[a]] -> [[a]] -> [[a]] 
concatenar [] xs = xs
concatenar xs [] = xs 
concatenar (x:xs) (y:ys) = (x ++ y) : concatenar xs ys

saquearCofre:: Cofre -> [Objeto]
saquearCofre (CofreC ts) = if (hayAlgunTesoro ts) then robar ts else []


robar::[Objeto] -> [Objeto]
robar [] = []
robar (x:xs) = if esTesoro x then x : robar xs else robar xs

{-- --}
ejemploTesorosPorNivel = tesorosPorNivel (Bifurcacion (CofreC [Chatarra, Tesoro, Tesoro]) 
    (Bifurcacion (CofreC [Chatarra]) 
        (Fin (CofreC [Chatarra])) 
        (Fin (CofreC [Tesoro, Tesoro, Tesoro]) ))
    (Fin (CofreC [Chatarra, Tesoro])))

-- devuelve [[Tesoro, Tesoro], [Tesoro], [Tesoro, Tesoro] ]


{--todosLosCaminos:: Mapa -> [[Dir]]
todosLosCaminos (Fin c) = []
todosLosCaminos (Bifurcacion c m1 m2) =  [Izq] : concatenar (todosLosCaminos m1) (todosLosCaminos m2) 

ejemploTodosLosCaminos = todosLosCaminos (Bifurcacion (CofreC [Chatarra, Tesoro, Tesoro]) 
    (Bifurcacion (CofreC [Chatarra]) 
        (Fin (CofreC [Chatarra])) 
        (Fin (CofreC [Tesoro, Tesoro]) ))
    (Fin (CofreC [Chatarra, Tesoro])))

--}
--devuelve [[Izq], [Izq, Izq], [Izq, Der], [Der]]


 {-- 3. NAVE ESPACIAL --}


data Componente = LanzaTorpedos | Motor Int | Almacen [Barril] deriving Show
data Barril = Comida | Oxigeno | Torpedo | Combustible deriving Show

data Sector = S SectorId [Componente] [Tripulante] deriving Show

type SectorId = String 
type Tripulante = String 

data Tree a = EmptyT | NodeT a (Tree a) (Tree a) deriving Show

data Nave = N (Tree Sector) deriving Show


{-- --}

sectores:: Nave -> [SectorId]
sectores (N t) = obtenerSectoresId t

obtenerSectoresId:: Tree Sector -> [SectorId]
obtenerSectoresId (EmptyT) = []
obtenerSectoresId (NodeT a t1 t2) = obtenerSectorId a : obtenerSectoresId t1 ++ obtenerSectoresId t2


obtenerSectorId:: Sector -> SectorId
obtenerSectorId (S id _ _) = id

{-- Ejemplo de uso --}

sectoresEjemplo = sectores (N (NodeT (S "Sector 1" [LanzaTorpedos] ["Tripulante 1"]) (NodeT (S "Sector 2" [LanzaTorpedos] ["Tripulante 1"]) EmptyT (NodeT (S "Sector 3" [LanzaTorpedos] ["Tripulante 1"]) EmptyT EmptyT ) ) EmptyT ))

{-- --}
poderDePropulsion:: Nave -> Int 
poderDePropulsion (N t) = obternerPoderSectores t


obternerPoderSectores:: Tree Sector -> Int 
obternerPoderSectores (EmptyT) = 0
obternerPoderSectores (NodeT s t1 t2) = obtenerPoderMotor s + obternerPoderSectores t1 + obternerPoderSectores t2


obtenerPoderMotor:: Sector -> Int
obtenerPoderMotor (S _ cs ts) = obtenerPoderMotores cs


obtenerPoderMotores:: [Componente]-> Int
obtenerPoderMotores [] = 0
obtenerPoderMotores (x:xs) = siEsMotorPoder x + obtenerPoderMotores xs


siEsMotorPoder :: Componente -> Int
siEsMotorPoder (Motor p) = p
siEsMotorPoder _ = 0

{-- Ejemplo de uso --}
poderDePropulsionEjemplo = poderDePropulsion (N (NodeT (S "Sector 1" [LanzaTorpedos, (Motor 10), (Motor 10)] ["Tripulante 1"]) (NodeT (S "Sector 2" [LanzaTorpedos, (Motor 10)] ["Tripulante 1"]) EmptyT (NodeT (S "Sector 3" [LanzaTorpedos, (Motor 10)] ["Tripulante 1"]) EmptyT EmptyT ) ) EmptyT ))


{-- --}
barriles:: Nave -> [Barril]
barriles (N t) = obtenerBarriles t

obtenerBarriles :: Tree Sector -> [Barril]
obtenerBarriles EmptyT = []
obtenerBarriles (NodeT s t1 t2) = obtenerBarrilesSector s ++  obtenerBarriles t1 ++ obtenerBarriles t2


obtenerBarrilesSector :: Sector -> [Barril]
obtenerBarrilesSector (S _ cs _) = obtenerBarrilesComponentes cs

obtenerBarrilesComponentes::[Componente] -> [Barril]
obtenerBarrilesComponentes [] = []
obtenerBarrilesComponentes (x:xs) = obtenerBarrilesComponente x ++ obtenerBarrilesComponentes xs

obtenerBarrilesComponente:: Componente -> [Barril]
obtenerBarrilesComponente (Almacen bs) = bs
obtenerBarrilesComponente _ = []


{-- Ejemplo de uso --}
barrilesEjemplo = barriles (N (NodeT (S "Sector 1" [LanzaTorpedos, (Motor 10), (Motor 10),(Almacen [Comida]),(Almacen [Comida])] ["Tripulante 1"]) (NodeT (S "Sector 2" [LanzaTorpedos, (Motor 10), (Almacen [Oxigeno])] ["Tripulante 1"]) EmptyT (NodeT (S "Sector 3" [LanzaTorpedos, (Motor 10), (Almacen [Torpedo]), (Almacen [Combustible, Oxigeno])] ["Tripulante 1"]) EmptyT EmptyT ) ) EmptyT ))


{-- --}
agregarASector:: [Componente] -> SectorId -> Nave -> Nave
agregarASector cs sId (N t) = (N (agregarATree cs sId t))


agregarATree:: [Componente] -> SectorId -> Tree Sector -> Tree Sector
agregarATree _ _ EmptyT = EmptyT
agregarATree cs sId (NodeT s t1 t2 ) = (NodeT (siEsAgregar cs sId s) (agregarATree  cs sId t1) (agregarATree  cs sId t2))

siEsAgregar::[Componente] -> SectorId -> Sector -> Sector
siEsAgregar cs sId s = if (obtenerId s) == sId then agregarComponentes cs s else s

obtenerId:: Sector -> SectorId
obtenerId (S id _ _) = id

agregarComponentes:: [Componente] -> Sector -> Sector 
agregarComponentes cs1 (S id cs ts ) = (S id  (cs++cs1) ts) 

{-- Ejemplo de uso --}
agregarASectorEjemplo = agregarASector [LanzaTorpedos, (Motor 666), (Motor 777),(Almacen [Comida])] "Sector 3" (N (NodeT (S "Sector 1" [LanzaTorpedos, (Motor 10), (Motor 10),(Almacen [Comida]),(Almacen [Comida])] ["Tripulante 1"]) (NodeT (S "Sector 2" [LanzaTorpedos, (Motor 10), (Almacen [Oxigeno])] ["Tripulante 1"]) EmptyT (NodeT (S "Sector 3" [LanzaTorpedos, (Motor 10), (Almacen [Torpedo]), (Almacen [Combustible, Oxigeno])] ["Tripulante 1"]) EmptyT EmptyT ) ) EmptyT ))

{-- --}
asignarTripulanteA:: Tripulante -> [SectorId] -> Nave -> Nave
asignarTripulanteA n sIds (N t) = (N (asignarATree n sIds t))

asignarATree :: Tripulante -> [SectorId] -> Tree Sector -> Tree Sector
asignarATree n sIds (EmptyT) = EmptyT
asignarATree n sIds (NodeT s t1 t2) = NodeT (asignarSiEs n sIds s) (asignarATree n sIds t1) (asignarATree n sIds t2)

asignarSiEs ::Tripulante -> [SectorId] -> Sector -> Sector
asignarSiEs n sIds s = if pertenece (obtenerId s) sIds then asignarASector n s else s 

pertenece:: Eq a => a -> [a] -> Bool
pertenece n [] = False
pertenece n (x:xs) = n == x || pertenece n xs

asignarASector ::Tripulante -> Sector -> Sector
asignarASector t (S id cs ts) = (S id cs (t:ts))


{-- Ejemplo de uso --}
asignarTripulanteAEjemplo = asignarTripulanteA "Tripulante 666" ["Sector 2", "Sector 3"] (N (NodeT (S "Sector 1" [LanzaTorpedos, (Motor 10), (Motor 10),(Almacen [Comida]),(Almacen [Comida])] ["Tripulante 1"]) (NodeT (S "Sector 2" [LanzaTorpedos, (Motor 10), (Almacen [Oxigeno])] ["Tripulante 1"]) EmptyT (NodeT (S "Sector 3" [LanzaTorpedos, (Motor 10), (Almacen [Torpedo]), (Almacen [Combustible, Oxigeno])] ["Tripulante 1"]) EmptyT EmptyT ) ) EmptyT ))


{-- --}
sectoresAsignados:: Tripulante -> Nave -> [SectorId]
sectoresAsignados n (N t) = sectoresAsignadosTree n t

sectoresAsignadosTree:: Tripulante -> Tree Sector -> [SectorId]
sectoresAsignadosTree n (EmptyT) = []
sectoresAsignadosTree n (NodeT s t1 t2) = if(sectorAsignado n s) then (obtenerId s) : sectoresAsignadosTree n t1 ++ sectoresAsignadosTree n t2 else  sectoresAsignadosTree n t1 ++ sectoresAsignadosTree n t2

sectorAsignado::Tripulante -> Sector -> Bool
sectorAsignado t (S _ _ ts) = pertenece t ts


{-- Ejemplo de uso --}
sectoresAsignadosEjemplo = sectoresAsignados "Tripulante 666"  (N (NodeT (S "Sector 1" [LanzaTorpedos, (Motor 10), (Motor 10),(Almacen [Comida]),(Almacen [Comida])] ["Tripulante 1","Tripulante 666"]) (NodeT (S "Sector 2" [LanzaTorpedos, (Motor 10), (Almacen [Oxigeno])] ["Tripulante 1"]) EmptyT (NodeT (S "Sector 3" [LanzaTorpedos, (Motor 10), (Almacen [Torpedo]), (Almacen [Combustible, Oxigeno])] ["Tripulante 1", "Tripulante 666"]) EmptyT EmptyT ) ) EmptyT ))


{-- --}
tripulantes:: Nave -> [Tripulante]
tripulantes (N t) = eliminarRepetidos (tripulantesTree t)


tripulantesTree ::Tree Sector -> [Tripulante]
tripulantesTree EmptyT = []
tripulantesTree (NodeT s t1 t2) = obtenerTripulantes s ++  tripulantesTree t1 ++ tripulantesTree t2

obtenerTripulantes::Sector -> [Tripulante]
obtenerTripulantes (S _ _ ts) = ts


eliminarRepetidos :: Eq a => [a] -> [a]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = if pertenece x xs then eliminarRepetidos xs else x : eliminarRepetidos xs


{-- Ejemplo de uso --}
tripulantesEjemplo = tripulantes  (N (NodeT (S "Sector 1" [LanzaTorpedos, (Motor 10), (Motor 10),(Almacen [Comida]),(Almacen [Comida])] ["Tripulante 1","Tripulante 666"]) (NodeT (S "Sector 2" [LanzaTorpedos, (Motor 10), (Almacen [Oxigeno])] ["Tripulante 1"]) EmptyT (NodeT (S "Sector 3" [LanzaTorpedos, (Motor 10), (Almacen [Torpedo]), (Almacen [Combustible, Oxigeno])] ["Tripulante 1", "Tripulante 666"]) EmptyT EmptyT ) ) EmptyT ))

{-- 4. --}

type Presa = String
type Territorio = String
type Nombre = String

data Lobo = Cazador Nombre [Presa] Lobo Lobo Lobo | Explorador Nombre [Territorio] Lobo Lobo | Cria Nombre deriving Show
data Manada = M Lobo deriving Show

{-- --}
buenaCaza :: Manada -> Bool
buenaCaza (M l) = cantidadCaza l > cantidadCrias l

cantidadCaza :: Lobo -> Int
cantidadCaza (Cria _) = 0
cantidadCaza (Explorador _ _ l1 l2) = cantidadCaza l1 + cantidadCaza l2
cantidadCaza (Cazador _ p l1 l2 l3) = longitud p + cantidadCaza l1 + cantidadCaza l2 + cantidadCaza l3


cantidadCrias :: Lobo -> Int
cantidadCrias (Cria _) = 1
cantidadCrias (Explorador _ _ l1 l2 ) = cantidadCrias l1 + cantidadCrias l1
cantidadCrias (Cazador _ _ l1 l2 l3 ) = cantidadCrias l1 + cantidadCrias l1 + cantidadCrias l3

{-- Ejemplo de uso --}

buenaCazaEjemplo = buenaCaza  (M (Cazador "Cazador 1" ["Presa 1", "Presa 1","Presa 1","Presa 1","Presa 1","Presa 1","Presa 1","Presa 1","Presa 1"] (Explorador "Explorador 1" ["Territorio 1"] (Cria "Cria 1") (Cria "Cria 2")) (Explorador "Explorador 1" ["Territorio 1"] (Cria "Cria 3") (Cria "Cria 4")) (Explorador "Explorador 1" ["Territorio 1"] (Cria "Cria 5") (Cria "Cria 6"))))

{-- --}

elAlfa :: Manada -> (Nombre, Int)
elAlfa (M l) = elAlfaLobo l 

elAlfaLobo:: Lobo -> (Nombre, Int)
elAlfaLobo (Cria n) = (n, 0)
elAlfaLobo (Explorador n _ l1 l2) = devuelveMayor (elAlfaLobo l1) (elAlfaLobo l2)
elAlfaLobo (Cazador n p l1 l2 l3) = devuelveMayor (devuelveMayor (n, (longitud p)) (elAlfaLobo l1))  (devuelveMayor  (elAlfaLobo l2) (elAlfaLobo l3))


devuelveMayor:: (Nombre, Int) -> (Nombre, Int) -> (Nombre, Int)
devuelveMayor (n1,c1) (n2,c2) = if c1  >= c2 then (n1,c1) else (n2,c2)

{-- Ejemplo de uso --}

elAlfaEjemplo = elAlfa  (M (Cazador "Cazador 1" ["Presa 1", "Presa 1","Presa 1","Presa 1","Presa 1","Presa 1","Presa 1","Presa 1","Presa 1"] (Explorador "Explorador 1" ["Territorio 1"] (Cria "Cria 1") (Cria "Cria 2")) (Explorador "Explorador 1" ["Territorio 1"] (Cria "Cria 3") (Cria "Cria 4")) (Explorador "Explorador 1" ["Territorio 1"] (Cria "Cria 5") (Cria "Cria 6"))))


{-- --}
loQueExploraron:: Territorio -> Manada -> [Nombre]
loQueExploraron t (M l) = loQueExploraronLobos t l

loQueExploraronLobos ::  Territorio -> Lobo -> [Nombre]
loQueExploraronLobos t (Cria _) = [] 
loQueExploraronLobos t (Explorador n ts l1 l2) = if pertenece t ts then n : (loQueExploraronLobos t l1)  ++ (loQueExploraronLobos t l2) else (loQueExploraronLobos t l1) ++ (loQueExploraronLobos t l2)
loQueExploraronLobos t (Cazador _ _ l1 l2 l3) = (loQueExploraronLobos t l1) ++ (loQueExploraronLobos t l2) ++ (loQueExploraronLobos t l3)

{-- Ejemplo de uso --}
loQueExploraronEjemplo = loQueExploraron "Territorio 666" (M (Cazador "Cazador 1" ["Presa 1", "Presa 1","Presa 1","Presa 1","Presa 1","Presa 1","Presa 1","Presa 1","Presa 1"] (Explorador "Explorador 1" ["Territorio 1"] (Cria "Cria 1") (Cria "Cria 2")) (Explorador "Explorador 666" ["Territorio 666"] (Cria "Cria 3") (Cria "Cria 4")) (Explorador "Explorador 1" ["Territorio 1"] (Cria "Cria 5") (Cria "Cria 6"))))


{-- --}
exploradoresPorTerritorio:: Manada -> [(Territorio, [Nombre])]
exploradoresPorTerritorio (M l) = exploradoresLobos l (sinRepetir (territorios l))  

territorios ::Lobo -> [Territorio]
territorios (Cria _) = []
territorios (Explorador _ ts l1 l2) = ts ++ territorios l1 ++ territorios l2
territorios (Cazador _ _ l1 l2 l3) = territorios l1 ++ territorios l2 ++ territorios l3

sinRepetir::[Territorio] -> [Territorio]
sinRepetir [] = []
sinRepetir (x:xs) = if pertenece x xs then sinRepetir xs else x : sinRepetir xs

exploradoresLobos:: Lobo -> [Territorio] -> [(Territorio, [Nombre])]
exploradoresLobos l [] = []
exploradoresLobos l (x:xs) = (x, pertenecenLobos l x) : exploradoresLobos l xs

pertenecenLobos:: Lobo -> Territorio -> [Nombre]
pertenecenLobos (Cria _) t = []
pertenecenLobos (Explorador n ts l1 l2) t = if pertenece t ts then n : pertenecenLobos l1 t ++ pertenecenLobos l2 t else pertenecenLobos l1 t ++ pertenecenLobos l2 t
pertenecenLobos (Cazador _ _ l1 l2 l3) t = pertenecenLobos l1 t ++ pertenecenLobos l2 t ++ pertenecenLobos l3 t


{-- Ejemplo de uso --}
exploradoresPorTerritorioEjemplo = exploradoresPorTerritorio  (M (Cazador "Cazador 1" ["Presa 1", "Presa 1","Presa 1","Presa 1","Presa 1","Presa 1","Presa 1","Presa 1","Presa 1"] (Explorador "Explorador 2" ["Territorio 1"] (Cria "Cria 1") (Cria "Cria 2")) (Explorador "Explorador 666" ["Territorio 666"] (Cria "Cria 3") (Cria "Cria 4")) (Explorador "Explorador 1" ["Territorio 1"] (Cria "Cria 5") (Cria "Cria 6"))))