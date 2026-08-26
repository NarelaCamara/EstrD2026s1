-- Práctica de ejercicios #4 - Ejercicios Integradores
-- 1. Pizzas
data Pizza = Prepizza
            | Capa Ingrediente Pizza
    deriving Show

data Ingrediente = Salsa
                   | Queso
                   | Jamon
                   | Aceitunas Int
    deriving Show

-- 1.a.
cantidadDeCapas :: Pizza -> Int
cantidadDeCapas Prepizza   = 0
cantidadDeCapas (Capa _ p) = 1 + cantidadDeCapas p

-- 1.b.
armarPizza :: [Ingrediente] -> Pizza
armarPizza []     = Prepizza
armarPizza (i:is) = Capa i (armarPizza is)

-- 1.c.
sacarJamon :: Pizza -> Pizza
sacarJamon Prepizza   = Prepizza
sacarJamon (Capa i p) = if esJamon i 
                            then sacarJamon p
                            else Capa i (sacarJamon p)

esJamon :: Ingrediente -> Bool 
esJamon Jamon = True 
esJamon _     = False

-- 1.d.
tieneSoloSalsaYQueso :: Pizza -> Bool
tieneSoloSalsaYQueso Prepizza   = True
tieneSoloSalsaYQueso (Capa i p) = esSalsaOQueso i && tieneSoloSalsaYQueso p

esSalsaOQueso :: Ingrediente -> Bool
esSalsaOQueso Salsa = True
esSalsaOQueso Queso = True
esSalsaOQueso _     = False

-- 1.e.
duplicarAceitunas :: Pizza -> Pizza
duplicarAceitunas Prepizza   = Prepizza
duplicarAceitunas (Capa i p) = Capa (duplicarSiEsAceituna i) (duplicarAceitunas p)

duplicarSiEsAceituna :: Ingrediente -> Ingrediente
duplicarSiEsAceituna (Aceitunas c) = Aceitunas (c*2)
duplicarSiEsAceituna i             = i

-- 1.f.
cantCapasPorPizza :: [Pizza] -> [(Int, Pizza)]
cantCapasPorPizza []     = []
cantCapasPorPizza (p:ps) = (cantidadDeCapas p,p) : cantCapasPorPizza ps

-- 2. Mapa de tesoros (con bifurcaciones)
data Dir = Izq | Der
    deriving Show

data Objeto = Tesoro | Chatarra
    deriving Show
    
data Cofre = Cofre [Objeto]
    deriving Show
    
data Mapa = Fin Cofre
            | Bifurcacion Cofre Mapa Mapa
    deriving Show
    
-- 2.1.
hayTesoro :: Mapa -> Bool
hayTesoro (Fin c)               = hayTesoroCofre c
hayTesoro (Bifurcacion c mi md) = hayTesoroCofre c || hayTesoro mi || hayTesoro md

hayTesoroCofre :: Cofre -> Bool
hayTesoroCofre (Cofre os) = hayTesoroOs os 

hayTesoroOs :: [Objeto] -> Bool
hayTesoroOs []     = False
hayTesoroOs (o:os) = esTesoro o || hayTesoroOs os 

esTesoro :: Objeto -> Bool
esTesoro Tesoro = True
esTesoro _      = False 

-- 2.2.
hayTesoroEn :: [Dir] -> Mapa -> Bool
hayTesoroEn []     (Fin co)               = hayTesoroCofre co
hayTesoroEn []     (Bifurcacion co _ _)   = hayTesoroCofre co
hayTesoroEn (d:_)  (Fin co)               = False  
hayTesoroEn (d:ds) (Bifurcacion co mi md) = if esIzq d 
                                             then hayTesoroEn ds mi
                                             else hayTesoroEn ds md       

esIzq :: Dir -> Bool 
esIzq Izq = True
esIzq _   = False

-- 2.3.
caminoAlTesoro :: Mapa -> [Dir]
caminoAlTesoro (Fin co)               = if hayTesoroCofre co
                                          then []
                                          else error "El camino dado no tiene ningún tesoro."    
caminoAlTesoro (Bifurcacion co mi md) =  if hayTesoroCofre co && hayTesoro mi && hayTesoro md
                                            then error "El camino dado tiene más de un tesoro."
                                            else if hayTesoro mi && hayTesoro md
                                                then error "El camino dado tiene más de un tesoro."
                                                else if hayTesoroCofre co && not (hayTesoro mi) && not (hayTesoro md)
                                                   then []
                                                   else if not (hayTesoro mi) && not (hayTesoro md)
                                                          then error "El camino dado no tiene ningún tesoro." 
                                                          else if hayTesoro mi
                                                                 then Izq : caminoAlTesoro mi
                                                                 else Der : caminoAlTesoro md

-- 2.4
caminoDeLaRamaMasLarga :: Mapa -> [Dir]
caminoDeLaRamaMasLarga (Fin _)               = []
caminoDeLaRamaMasLarga (Bifurcacion _ mi md) =
     if length (caminoDeLaRamaMasLarga mi) >= length (caminoDeLaRamaMasLarga md)
        then Izq : caminoDeLaRamaMasLarga mi 
        else Der : caminoDeLaRamaMasLarga md

-- 2.5
tesorosPorNivel :: Mapa -> [[Objeto]]
tesorosPorNivel (Fin co)               = if null (losTesorosDe co)
                                            then []
                                            else losTesorosDe co :[]
tesorosPorNivel (Bifurcacion co mi md) = if null (losTesorosDe co )
                                            then juntarTesorosPorNivel (tesorosPorNivel mi) (tesorosPorNivel md)
                                            else losTesorosDe co : juntarTesorosPorNivel (tesorosPorNivel mi) (tesorosPorNivel md)

losTesorosDe :: Cofre -> [Objeto]
losTesorosDe (Cofre os) = losTesoros os 

losTesoros :: [Objeto] -> [Objeto]
losTesoros []     = []
losTesoros (o:os) = if esTesoro o 
                      then o : losTesoros os 
                      else losTesoros os

juntarTesorosPorNivel :: [[Objeto]] -> [[Objeto]] -> [[Objeto]]
juntarTesorosPorNivel []     os'      = os'
juntarTesorosPorNivel os     []       = os
juntarTesorosPorNivel (o:os) (o':os') = (o++o') : juntarTesorosPorNivel os os'

-- 2.6
todosLosCaminos :: Mapa -> [[Dir]]
todosLosCaminos (Fin _)                = [] 
todosLosCaminos (Bifurcacion _  mi md) = [Izq] : agregarDir Izq (todosLosCaminos mi) 
                                        ++ [Der] : agregarDir Der (todosLosCaminos md)

agregarDir :: Dir -> [[Dir]] -> [[Dir]]
agregarDir d []       = []
agregarDir d (ds:dss) = (d:ds) : agregarDir d dss 

-- 3. Nave Espacial
data Componente = LanzaTorpedos | Motor Int | Almacen [Barril]
    deriving Show

data Barril = Comida | Oxigeno | Torpedo | Combustible
    deriving Show

data Sector = S SectorId [Componente] [Tripulante]
    deriving Show

type SectorId = String

type Tripulante = String

data Tree a = EmptyT | NodeT a (Tree a) (Tree a)
    deriving Show

data Nave = N (Tree Sector)
    deriving Show

-- 3.1.
sectores :: Nave -> [SectorId]
sectores (N tS) = sectoresIds tS 

sectoresIds :: Tree Sector -> [SectorId]
sectoresIds EmptyT          = []
sectoresIds (NodeT s ti td) = (sectorId s) : sectoresIds ti ++ sectoresIds td

sectorId :: Sector -> SectorId
sectorId (S id _ _) = id

-- 3.2.
poderDePropulsion :: Nave -> Int
poderDePropulsion (N tS) = poderProp tS 

poderProp :: Tree Sector -> Int
poderProp EmptyT          = 0
poderProp (NodeT s ti td) = poderDelS s + poderProp ti + poderProp td

poderDelS :: Sector -> Int 
poderDelS (S _ cs _) = poderCs cs 

poderCs :: [Componente] -> Int 
poderCs []     = 0
poderCs (c:cs) = poder c + poderCs cs  

poder :: Componente -> Int
poder (Motor i) = i 
poder _         = 0

-- 3.3.
barriles :: Nave -> [Barril]
barriles (N tS) = barrilesT tS 

barrilesT :: Tree Sector -> [Barril]
barrilesT EmptyT          = []
barrilesT (NodeT s ti td) = barrilesS s ++ barrilesT ti ++ barrilesT td

barrilesS :: Sector -> [Barril]
barrilesS (S _ cs _) = barrilesCs cs 

barrilesCs :: [Componente] -> [Barril]
barrilesCs []     = []
barrilesCs (c:cs) = soloLosBs c ++ barrilesCs cs

soloLosBs :: Componente -> [Barril]
soloLosBs (Almacen bs) = bs 
soloLosBs _            = []

-- 3.4.
agregarASector :: [Componente] -> SectorId -> Nave -> Nave
agregarASector cs id (N tS) = N (agregarA cs id tS) 

agregarA :: [Componente] -> SectorId -> Tree Sector -> Tree Sector
agregarA _  _  EmptyT          = EmptyT
agregarA cs id (NodeT s ti td) = if id==sectorId s
                                    then NodeT (agregar cs s) ti td  
                                    else NodeT s (agregarA cs id ti) (agregarA cs id td)

agregar :: [Componente] -> Sector -> Sector 
agregar cs (S id cms ts) = S id (cs++cms) ts   

-- 3.5.
asignarTripulanteA :: Tripulante -> [SectorId] -> Nave -> Nave
asignarTripulanteA t ids (N tS) = if estanTodas ids tS
                                    then N (asignarTripulante t ids tS)
                                    else error "no todas las ids dadas están en la nave."

asignarTripulante :: Tripulante -> [SectorId] -> Tree Sector -> Tree Sector
asignarTripulante _ []       sT = sT
asignarTripulante t (id:ids) sT = asignarT t id (asignarTripulante t ids sT)         

asignarT ::  Tripulante -> SectorId -> Tree Sector -> Tree Sector
asignarT _ _  EmptyT          = EmptyT 
asignarT t id (NodeT s ti td) = if id==sectorId s 
                                  then NodeT (asignar t s) ti td  
                                  else NodeT s (asignarT t id ti) (asignarT t id td)
                                    
asignar :: Tripulante -> Sector -> Sector
asignar t (S id cs ts) = S id cs (t:ts)

estanTodas :: [SectorId] -> Tree Sector -> Bool
estanTodas []       st = False
estanTodas (id:ids) sT = estaIdEn id sT && estanTodas ids sT

estaIdEn :: SectorId -> Tree Sector -> Bool
estaIdEn _  EmptyT          = False
estaIdEn id (NodeT s ti td) = (id==sectorId s) || estaIdEn id ti || estaIdEn id td

-- 3.6.
sectoresAsignados :: Tripulante -> Nave -> [SectorId]
sectoresAsignados t (N sT) = sectoresAsig t sT

sectoresAsig :: Tripulante -> Tree Sector -> [SectorId]
sectoresAsig _ EmptyT          = []
sectoresAsig t (NodeT s ti td) = if estaAsignado t s
                                  then (sectorId s) : sectoresAsig t ti ++ sectoresAsig t td
                                  else sectoresAsig t ti ++ sectoresAsig t td

estaAsignado :: Tripulante -> Sector -> Bool
estaAsignado t (S _ _ ts) = elem t ts

-- 3.7.
tripulantes :: Nave -> [Tripulante]
tripulantes (N sT) = tripulantesDe sT 

tripulantesDe :: Tree Sector -> [Tripulante]
tripulantesDe EmptyT          = []
tripulantesDe (NodeT s ti td) = tripulantesDelSectorSinRep s (juntarSinRep (tripulantesDe ti) (tripulantesDe td))

tripulantesDelSectorSinRep :: Sector -> [Tripulante] -> [Tripulante]
tripulantesDelSectorSinRep (S _ _ ts) tps = juntarSinRep ts tps 

juntarSinRep :: [Tripulante] -> [Tripulante] -> [Tripulante]
juntarSinRep []     ts' = ts'
juntarSinRep (t:ts) ts' = if elem t ts' 
                            then juntarSinRep ts ts' 
                            else t : juntarSinRep ts ts'

-- 4. Manada de lobos
type Presa = String 
          -- nombre de presa

type Territorio = String
               -- nombre de territorio

type Nombre = String
           -- nombre de lobo

data Lobo = Cazador Nombre [Presa] Lobo Lobo Lobo
            | Explorador Nombre [Territorio] Lobo Lobo
            | Cria Nombre
    deriving Show

data Manada = M Lobo
    deriving Show

-- 4.1
manadaE1 :: Manada
manadaE1 = M (Cazador "Cazador0" ["Conejo", "Liebre", "Roedor", "Jabali", "Ciervo", "Alce"]
                ( Explorador "Explorador0" ["Rivera", "Costa Sur"]
                    (Cria "Cria0")
                    (Explorador "Explorador1" ["Costa Este"]
                        (Cria "Cria1")
                        (Cria "Cria2")
                    )                     
                )
                (Cria "Cria3")
                (Cria "Cria4")
             )

-- 4.2.
buenaCaza :: Manada -> Bool
buenaCaza (M l) = esBuenaCaza l 

esBuenaCaza :: Lobo -> Bool 
esBuenaCaza l = let (alimento, crias) = cantAlimentoYCrias l
                    in alimento > crias

cantAlimentoYCrias :: Lobo -> (Int, Int) -- (alimento, crias)
cantAlimentoYCrias (Cria _)                = (0, 1)  
cantAlimentoYCrias (Explorador _ _ li ld)  = let (ai, ci) = cantAlimentoYCrias li                                                       
                                                 (ad, cd) = cantAlimentoYCrias ld
                                                 in 
                                                    (ai+ad, ci+cd)
cantAlimentoYCrias (Cazador _ ps li lc ld) = let (ai, ci) = cantAlimentoYCrias li
                                                 (ac, cc) = cantAlimentoYCrias lc      
                                                 (ad, cd) = cantAlimentoYCrias ld
                                                 in 
                                                    ((length ps)+ai+ac+ad, ci+cc+cd)          

-- 4.3.
elAlfa :: Manada -> (Nombre, Int)
elAlfa (M l) = alfa l

alfa :: Lobo -> (Nombre, Int)
alfa (Cria n)                = (n, 0)  
alfa (Explorador n _ li ld)  = alfaEntre (n, 0) 
                                         (alfaEntre (alfa li) (alfa ld))
alfa (Cazador n ps li lc ld) = alfaEntre (n, length ps) 
                                         (alfaEntre (alfa li)
                                                    (alfaEntre (alfa lc) (alfa ld)))

alfaEntre :: (Nombre, Int) -> (Nombre, Int) -> (Nombre, Int)  
alfaEntre (n,i) (n',i') = if i>=i' then (n,i) else (n',i')
                        --   el igual hace que en caso de tener igual cant crias se quede con el de arriba

-- 4.4.
losQueExploraron :: Territorio -> Manada -> [Nombre]
losQueExploraron t (M l) = losQueExploraronL t l

losQueExploraronL :: Territorio -> Lobo -> [Nombre]
losQueExploraronL _ (Cria _)                = []
losQueExploraronL t (Cazador _ _ li lc ld)  = losQueExploraronL t li ++ losQueExploraronL t lc ++ losQueExploraronL t ld 
losQueExploraronL t (Explorador n ts li ld) =
     if exploro t ts 
        then n : losQueExploraronL t li ++ losQueExploraronL t ld 
        else losQueExploraronL t li ++ losQueExploraronL t ld 

exploro :: Territorio -> [Territorio] -> Bool
exploro _ []      = False
exploro t (t':ts) = t==t' || exploro t ts 

-- 4.5.
exploradoresPorTerritorio :: Manada -> [(Territorio, [Nombre])]
exploradoresPorTerritorio (M l) = exploradoresPorT l 

exploradoresPorT :: Lobo -> [(Territorio, [Nombre])]
exploradoresPorT (Cria _)                = []
exploradoresPorT (Cazador _ _ li lc ld)  = appendNsMismoT 
                                                      (appendNsMismoT (exploradoresPorTerritorioL li) 
                                                                      (exploradoresPorTerritorioL lc))
                                                      (exploradoresPorTerritorioL ld)
exploradoresPorT (Explorador n ts li ld) = actualizarTerritorio n trs
                                                    (appendNsMismoT 
                                                        (exploradoresPorTerritorioL li) 
                                                        (exploradoresPorTerritorioL ld)
                                                    )

appendNsMismoT :: [(Territorio, [Nombre])] -> [(Territorio, [Nombre])] -> [(Territorio, [Nombre])]
appendNsMismoT []           tns' = tns'
appendNsMismoT ((t,ns):tns) tns' = appendNs (t,ns) (appendNsMismoT tns tns')

appendNs :: (Territorio, [Nombre]) -> [(Territorio, [Nombre])] -> [(Territorio, [Nombre])]
appendNs (t,ns) []             = (t,ns):[]
appendNs (t,ns) ((t',ns'):tns) = if t==t'
                                   then (t, ns++ns') : tns 
                                   else (t',ns') : appendNs (t,ns) tns

actualizarTerritorio :: Nombre -> [Territorio] -> [(Territorio, [Nombre])] -> [(Territorio, [Nombre])]
actualizarTerritorio _ []     tnss = tnss
actualizarTerritorio n (t:ts) tnss = actualizarT n t (actualizarTerritorio n ts tnss) 

actualizarT :: Nombre -> Territorio -> [(Territorio, [Nombre])] -> [(Territorio, [Nombre])]
actualizarT n t []             = [(t,[n])]
actualizarT n t ((t', ns):tnss) = 
    if  t==t' then ((t, n:ns)) : tnss
              else (t', ns) : actualizarT n t tnss

-- 4.6.
cazadoresSuperioresDe :: Nombre -> Manada -> [Nombre]

cazadoresSuperioresDe n (M l) = cazadoresSuperioresDeL n l

cazadoresSuperioresDeL :: Nombre -> Lobo -> [Nombre]
cazadoresSuperioresDeL n' (Cria _)                = []
cazadoresSuperioresDeL n' (Explorador _ _ l1 l2)  = cazadoresSuperioresDeL n' l1
                                                    ++ cazadoresSuperioresDeL n' l2
cazadoresSuperioresDeL n' (Cazador n _ l1 l2 l3) = if mismoNombre n n'   
                                                    then []
                                                    else if estaNombreL n' l1 
                                                        then n : (cazadoresSuperioresDeL n' l1) 
                                                        else if estaNombreL n' l2 
                                                            then n : (cazadoresSuperioresDeL n' l2) 
                                                            else n : (cazadoresSuperioresDeL n' l3) 

estaNombreL :: Nombre -> Lobo -> Bool 
estaNombreL n' (Cria n)                     = mismoNombre n n' 
estaNombreL n' (Explorador n _ lb1 lb2)     = mismoNombre n n' 
                                            || estaNombreL n' lb1
                                            || estaNombreL n' lb2 
estaNombreL n' (Cazador    n _ lb1 lb2 lb3) = mismoNombre n n'
                                            || estaNombreL n' lb1 
                                            || estaNombreL n' lb2 
                                            || estaNombreL n' lb3

mismoNombre :: Nombre -> Nombre -> Bool
mismoNombre n n' = n==n'
----------------- MANADAS ------------------------

manadaEj2 :: Manada
manadaEj2 = M lb2

lb2 = (Cazador "DienteFiloso" ["Búfalos", "Antílopes", "Ave"]
                (Cria "Hopito")
                (Explorador "Incansable" ["Oeste hasta el rio"]
                    (Cria "MechonGris")
                    (Cria "Rabito")
                )
                (Cazador "Garras" ["Antílopes", "Ciervos"]
                    (Explorador "Zarpado" ["Bosque este"]
                        (Cria "Osado")
                        (Cazador "Mandibulas" ["Cerdos", "Pavos"]
                            (Cria "Desgreñado")
                            (Cria "Malcriado")
                            (Cazador "TrituraHuesos" ["Conejos"]
                                (Cria "Peludo")
                                (Cria "Largo")
                                (Cria "Menudo")
                            )
                        )
                    )
                    (Cria "Garrita")
                    (Cria "Manchas")
                )
            )

manada0 :: Manada
manada0 = M (Cria "Pokkle")

manada1 :: Manada
manada1 = M ( Explorador "Basho" ["Costa Sur"]
                    (Cria "Ginda")
                    (Explorador "Wing" ["Costa Este", "Rivera"]
                        (Cria "Sushi")
                        (Cria "Biscuit")
                    )                     
            )

manada2 :: Manada
manada2 = M (Cazador "Hunter" ["Conejo", "Liebre", "Roedor", "Jabali", "Ciervo", "Alce", "Pez", "Pez", "Salmón", "Trucha"]
                ( Explorador "Basho" ["Rivera", "Costa Sur"]
                    (Cria "Ginda")
                    (Explorador "Wing" ["Costa Este"]
                        (Cria "Sushi")
                        (Cria "Biscuit")
                    )                     
                )
                (Explorador "Basho2" ["Rivera", "Costa Sur"]
                    (Cria "Ginda2")
                    (Explorador "Wing2" ["Costa Este"]
                        (Cria "Sushi2")
                        (Cria "Biscuit2")
                    )                     
                )
                (Cazador "Hunter2" ["Conejo", "Liebre", "Roedor", "Jabali", "Ciervo", "Alce"]
                    ( Explorador "Basho3" ["Rivera", "Costa Sur"]
                        (Cria "Ginda3")
                        (Explorador "Wing3" ["Costa Este", "Rivera", "Costa Norte"]
                            (Cria "Ponzu")
                            (Cria "Pokkle")
                        )                     
                    ) 
                    (Cria "Ponzu2")
                    (Cria "Pokkle2")       
                )
            )
             
manada3 :: Manada
manada3 = M (Explorador "E1" ["Rivera", "Costa Sur"]
                ( Explorador "E2" ["Rivera", "Costa Sur"]
                    (Cria "Ginda")
                    (Explorador "E3" ["Rivera", "Costa Este"]
                        (Cria "Sushi")
                        (Cria "Biscuit")
                    )                     
                )
                (Explorador "E4" ["Rivera", "Costa Sur"]
                    (Cria "Ginda2")
                    (Explorador "E5" ["Costa Este", "Rivera"]
                        (Cria "Sushi2")
                        ( Explorador "E6" ["Rivera", "Costa Sur"]
                        (Cria "Ginda3")
                        (Explorador "E7" ["Costa Este", "Rivera", "Costa Norte"]
                            (Cria "Ponzu")
                            (Cria "Pokkle")
                         ) 
                        )                     
                    )    
                )
            )
             
manada4 :: Manada
manada4 = M (Explorador "lobo" ["rio", "costa"] 
                    (Cria "c1")
                    (Explorador "lobito" ["costa", "rio"]
                        (Cria "c2")
                        (Cria "c3")      
                    )
               )

manada5 :: Manada
manada5 = M (Cazador "Hunter" ["Conejo", "Liebre", "Roedor", "Jabali", "Ciervo", "Alce", "Pez"]
                ( Cazador "Killer" ["Elefante", "Cocodrilo"]
                    (Cria "Ginda")
                    (Cazador "Matador" ["Conejo", "Liebre", "Roedor","Conejo", "Liebre", "Roedor"]
                        (Cria "Sushi")
                        (Cria "Biscuit")
                        (Cria "Chiquito")
                    )
                    (Cria "Baby")                   
                )
                (Cazador "Asesino" []
                    (Cria "Loquilla")
                    (Cazador "Murderer" ["Gacela"]
                        (Cria "Galletita")
                        (Cria "Alfajorcito")
                        (Cria "Chocolatito")
                    )  
                    (Cria "Loquillo")                   
                )
                (Cazador "Asesina" ["Conejo", "Liebre", "Roedor", "Jabali", "Ciervo", "Alce", "Pez"]
                    ( Cazador "Chatarrero" ["Papitas", "Palitos"]
                        (Cria "Morcillita")
                        (Explorador "Rapido" []
                            (Cria "Arrocito")
                            (Cria "Vitina")
                        )  
                        (Cria "Chorizito")                    
                    ) 
                    (Cria "Ponzu2")
                    (Cria "Pokkle2")       
                )
            )
             


   





----------------- NAVES   -----------------

nave0 :: Nave 
nave0 = N tsectores0 

nave1 :: Nave
nave1 = N tsectores01

nave2 :: Nave
nave2 = N tsectores2

nave3 :: Nave
nave3 = N tsectores3

nave4 :: Nave
nave4 = N tsectores4

nave5 :: Nave
nave5 = N tsectores5

nave6 :: Nave
nave6 = N tsectores6

tsectores0 :: Tree Sector
tsectores0 = EmptyT

tsectores1 :: Tree Sector
tsectores1 = NodeT sector1 EmptyT EmptyT

tsectores01 :: Tree Sector
tsectores01 = NodeT sector1 EmptyT (NodeT sector0 EmptyT EmptyT)

tsectores2 :: Tree Sector
tsectores2 = NodeT sector1 EmptyT (NodeT sector1 EmptyT (NodeT sector2 EmptyT EmptyT))

tsectores3 :: Tree Sector
tsectores3 = NodeT sector3 EmptyT (NodeT sector2 EmptyT EmptyT)

tsectores4 :: Tree Sector
tsectores4 = NodeT sector4 EmptyT (NodeT sector4 (NodeT sector4 EmptyT EmptyT)
                                                 (NodeT sector4 EmptyT EmptyT)
                                     )
       
tsectores5 :: Tree Sector
tsectores5 = NodeT sector4 EmptyT (NodeT sector3 (NodeT sector0 EmptyT EmptyT)
                                                 (NodeT sector1 EmptyT EmptyT)
                                 )

tsectores6 :: Tree Sector
tsectores6 = NodeT sector2  (NodeT sector2 (NodeT sector0 EmptyT EmptyT)
                                                 (NodeT sector1 EmptyT EmptyT)
                            )
                            (NodeT sector3 (NodeT sector0 EmptyT EmptyT)
                                                 (NodeT sector1 EmptyT EmptyT)
                            )       
                            
                            


sector0 :: Sector
sector0 = S id0 [] []

sector1 :: Sector
sector1 = S "Sector1" [ LanzaTorpedos, Motor 2 ] ["Pedro", "Toncho"]

sector2 :: Sector
sector2 = S "Sector2" [ LanzaTorpedos, Motor 6, Motor 10, Almacen [Comida, Comida, Comida] ] ["D", "OoO", "T"]

sector3 :: Sector
sector3 = S "Sector3" [ LanzaTorpedos, Motor 6, Motor 100, Almacen [Torpedo, Torpedo, Torpedo], Almacen [Combustible] ] ["G", "T"]

sector4 :: Sector
sector4 = S "Sector4" [] ["R"]


id0 :: SectorId
id0 = "Sector0"



mapa0 :: Mapa
mapa0 = Fin cofre0

mapa01 :: Mapa
mapa01 = Fin cofre1

mapa1 :: Mapa
mapa1 = Bifurcacion cofre0 (Fin cofre0) (Fin cofre0)

mapa2 :: Mapa
mapa2 = (Bifurcacion cofre0 (Bifurcacion cofre0 (Bifurcacion cofre4 (Fin cofre5) (Fin cofre0))
                                                (Fin cofre0)
                            )
                            (Fin cofre0))

mapa3 :: Mapa
mapa3 = (Bifurcacion cofre0 (Bifurcacion cofre4 (Bifurcacion cofre5 (Fin cofre4) 
                                                                    (Bifurcacion cofre4 (Fin cofre0)
                                                                                        (Bifurcacion cofre0 (Fin cofre0)
                                                                                                            (Bifurcacion cofre5 (Fin cofre0)
                                                                                                                                (Fin cofre5)
                                                                                                             )
                                                                                        )
                                                                   )
                                                )
                                                (Fin cofre0)
                            )
                            (Fin cofre4))

mapa4 :: Mapa
mapa4 = Bifurcacion cofre0 (Fin cofre1) (Fin cofre1)

mapae :: Mapa
mapae = Bifurcacion cofre0
        (Fin cofre0) 
        (Bifurcacion cofre0
            (Fin cofre0) 
            (Fin cofre0)
        )
        -- [[Izq], [Der], [Der, Izq], [Der, Der]]
        -- todosLosCaminosHojas -- [[Izq], [Der, Izq], [Der Der]]

dirs0 :: [Dir]
dirs0 = []

dirs1 :: [Dir]
dirs1 = [Der]

dirs2 :: [Dir]
dirs2 = [Izq]

dirs3 :: [Dir]
dirs3 = [Izq, Der]

dirs4 :: [Dir]
dirs4 = [Izq, Izq, Der, Der]




cofre0 :: Cofre
cofre0 = Cofre []

cofre1 :: Cofre
cofre1 = Cofre [Tesoro]

cofre2 :: Cofre
cofre2 = Cofre [Tesoro, Chatarra]

cofre3 :: Cofre
cofre3 = Cofre [Chatarra, Tesoro, Chatarra]

cofre4 :: Cofre
cofre4 = Cofre [Chatarra, Chatarra, Tesoro, Tesoro]

cofre5 :: Cofre
cofre5 = Cofre [Chatarra, Chatarra, Chatarra]
