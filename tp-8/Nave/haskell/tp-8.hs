import Nave
import Tipos
import Set
import Tripulante


-- USUARIO
-- i
{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(S log S) 
        - siendo allSectors O(S log S)
-}
sectores:: Nave -> Set SectorId
sectores n = allSectors (tripulantesN n) n

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(s log s + t) siendo s la cantiad de sectores y siento T la cantiidad de Tripulantes de la lista
        - emptyS tiene un costo O(1)
        - unionS tiene un costo O(s log s) siendo s la cantidad de elementos del set
        - sectoresT tiene un costo O(1)
-}

allSectors:: [Tripulante] -> Nave -> Set SectorId
allSectors [] n = emptyS
allSectors (t:ts) n = unionS (sectoresT t) (allSectors ts n)  


-- j

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(T) siendo la longitud de la lista
-}

sinSectoresAsignados:: Nave -> [Tripulante]
sinSectoresAsignados n = sinSectorT (tripulantesN n)


{-
    Proposito: 
    PRECONDICION:   
    COSTO:  O(T) 
    - siendo T el la longitud de la lista de tripulantes
    - O(1) siendo constante
-}

sinSectorT :: [Tripulante] -> [Tripulante]
sinSectorT [] = []
sinSectorT (t:ts) = if sizeS (sectoresT t) > 0 then sinSectorT ts else t: sinSectorT ts

-- k

{-
    Proposito: 
    PRECONDICION:   
    COSTO:  
-}
barriles:: Nave -> [Barril]
barriles n = allBarriles (setToList (sectores n)) n


allBarriles :: [SectorId] -> Nave -> [Barril]
allBarriles [] n = []
allBarriles (s:ss) n = 
    let (_, cs) = (datosDeSector s n) 
    in allBarrilesDe cs ++ allBarriles ss n 


allBarrilesDe :: [Componente] -> [Barril]
allBarrilesDe [] = []
allBarrilesDe (c:cs) =
    case allBarril c of
        Just b -> b ++ allBarrilesDe cs
        Nothing -> allBarrilesDe cs


allBarril :: Componente -> Maybe [Barril]
allBarril (Almacen xs) = Just xs
allBarril _ = Nothing


--- INSTANCIAS

showValue :: Show a => String -> a -> IO ()
showValue texto valor = do
  putStrLn texto
  print valor


----

s1 ::  SectorId
s1 = "S1"

s2 ::  SectorId
s2 = "S2"

s3 ::  SectorId
s3 = "S3" 

----

r1 ::  Rango
r1 = "R1"

r2 ::  Rango
r2 = "R2"

r3 ::  Rango
r3 = "R3" 

--

nombre1 :: Nombre
nombre1 = "Nombre 1"


nombre2 :: Nombre
nombre2 = "Nombre 2"

nombre3 :: Nombre
nombre3 = "Nombre 3"

--

sectorIdsEjemplo :: [SectorId] 
sectorIdsEjemplo = [s1, s2, s3] 


--

construirEjemplo :: Nave
construirEjemplo = construir sectorIdsEjemplo

-- 

ingresarTEjemplo :: Nave
ingresarTEjemplo = ingresarT nombre1 r1 construirEjemplo

--

naveSectoresAsignadosEjemplo = 
    (ingresarT nombre3 s3 
    (ingresarT nombre2 s1 
    (ingresarT nombre1 s1 
    (ingresarT nombre1 s1 construirEjemplo))))

sectoresAsignadosEjemplo :: Set SectorId
sectoresAsignadosEjemplo = sectoresAsignados nombre1 naveSectoresAsignados 

--

naveDatosDeSectorEjemplo = 
    (ingresarT nombre3 s3 
    (ingresarT nombre2 s1 
    (ingresarT nombre1 s1 
    (ingresarT nombre1 s1 construirEjemplo))))

datosDeSectorEjemplo :: (Set Nombre, [Componente])
datosDeSectorEjemplo = datosDeSector s1 naveDatosDeSectorEjemplo

---

naveTripulanteNEjemplo = 
    (ingresarT nombre3 s3 
    (ingresarT nombre2 s1 
    (ingresarT nombre1 s1 
    (ingresarT nombre1 s1 construirEjemplo))))

tripulanteNEjemplo :: [Tripulante]
tripulanteNEjemplo = tripulantesN naveTripulanteNEjemplo

---

naveAgregarASectorEjemplo = 
    (ingresarT nombre3 s3 
    (ingresarT nombre2 s1 
    (ingresarT nombre1 s1 
    (ingresarT nombre1 s1 construirEjemplo))))

componentesEjemplo :: [Componente]
componentesEjemplo = [ LazanTorpedos, Motor 1, Almacen [Comida, Oxigeno] , Motor 2, Almacen [Torpedo, Combustible] ]

agregarASectorEjemplo :: Nave
agregarASectorEjemplo = agregarASector componentesEjemplo s1 naveAgregarASectorEjemplo

---
naveAsignarASectorEjemplo = 
    (ingresarT nombre3 s3 
    (ingresarT nombre2 s1 
    (ingresarT nombre1 s1 
    (ingresarT nombre1 s1 construirEjemplo))))

asignarASectorEjemplo :: Nave
asignarASectorEjemplo = asignarASector nombre1 s1 naveAsignarASectorEjemplo

---

naveSectoresEjemplo = 
    (ingresarT nombre3 s3 
    (ingresarT nombre2 s1 
    (ingresarT nombre1 s1 
    (ingresarT nombre1 s1 construirEjemplo))))

sectoresEjemplo :: Set SectorId
sectoresEjemplo = sectores naveSectoresEjemplo

---

naveSinSectoresAsignadosEjemplo = 
    (ingresarT nombre3 s3 
    (ingresarT nombre2 s1 
    (ingresarT nombre1 s1 
    (ingresarT nombre1 s1 construirEjemplo))))


sinSectoresAsignadosEjemplo :: [Tripulante]
sinSectoresAsignadosEjemplo = sinSectoresAsignados naveSinSectoresAsignadosEjemplo

---

naveBarrilesEjemplo = 
    (ingresarT nombre3 s3 
    (ingresarT nombre2 s1 
    (ingresarT nombre1 s1 
    (ingresarT nombre1 s1 construirEjemplo))))

barrilesEjemplo :: [Barril]
barrilesEjemplo = barriles naveBarrilesEjemplo

--