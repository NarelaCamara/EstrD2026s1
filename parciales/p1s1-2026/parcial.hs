{-- --}

brutus     = P "Brutus Malfoy II" (EnMatrimonioCon "Cierce Vyndon")
pollux     = P "Pollux Black" (EnMatrimonioCon "Irma Crabbe")
abraxas    = P "Abraxas Malfoy" (EnMatrimonioCon "(no identificada)")
walburga   = P "Walburga Black" (EnMatrimonioCon "Orion Black")
alphard    = P "Alphard Black" SinPareja
cygnus     = P "Cygnus Black III" (EnMatrimonioCon "Druella Rossier")
regulus    = P "Regulus Black" SinPareja
sirius     = P "Sirius Black" SinPareja
bellatrix  = P "Bellatrix Black" (EnMatrimonioConPeroHijosCon "Rodolphus Lestrange" "Tom Malvoro Riddle")
andromeda  = P "Andromeda Black" (EnMatrimonioCon "Edward Tonks")
narcissa   = P "Narcissa Black" (EnMatrimonioCon "Lucius Malfoy")
lucius     = P "Lucius Malfoy" (EnMatrimonioCon "Narcissa Black")
nymphadora = P "Nymphadora Tonks" (EnMatrimonioCon "Remus Lupin")
delphini   = P "Delphini" SinPareja
edward     = P "Edward Remus Lupin" SinPareja
draco      = P "Draco Malfoy" (EnMatrimonioCon "Astoria Greengrass")
scorpius   = P "Scorpius Malfoy" (EnMatrimonioCon "Lilly Potter")


fliaBlack = Hijos3 pollux
              (Hijos2 walburga (Hijos0 regulus) (Hijos0 sirius))
              (Hijos0 alphard)
              (Hijos3 cygnus
                 (Hijos1 bellatrix (Hijos0 delphini))
                 (Hijos1 andromeda (Hijos1 nymphadora (Hijos0 edward)))
                 (Hijos1 narcissa (Hijos1 draco (Hijos0 scorpius))))
               
fliaMalfoy = Hijos1 brutus
               (Hijos1 abraxas
                  (Hijos1 lucius (Hijos1 draco (Hijos0 scorpius))))

{-- --}
cabezaDeFamiliaDe ::  GenTree -> Persona
cabezaDeFamiliaDe (Hijos0 p) = p
cabezaDeFamiliaDe (Hijos1 p g1) = p
cabezaDeFamiliaDe (Hijos2 p g1 g2) = p
cabezaDeFamiliaDe (Hijos3 p g1 g2 g3) = p


{-- Ejemplo de uso --}
--cabezaDeFamiliaDe fliaBlack = P "Pollux Black" (EnMatrimonioCon "Irma Crabbe")
--cabezaDeFamiliaDe fliaMalfoy = P "Brutus Malfoy II" (EnMatrimonioCon "Cierce Vyndon")

cabezaDeFamiliaDeEjemplo1 = cabezaDeFamiliaDe fliaBlack
cabezaDeFamiliaDeEjemplo2 = cabezaDeFamiliaDe fliaMalfoy


{-- 
ejemplo1 = hijosDe_En_ "Cygnus Black III" fliaBlack
   = Just [ P "Bellatrix Black" (EnMatrimonioConPeroHijosCon "Rodolphus Lestrange" "Tom Malvoro Riddle")
          , P "Andromeda Black" (EnMatrimonioCon "Edward Tonks")
          , P "Narcissa Black" (EnMatrimonioCon "Lucius Malfoy")
          ]
          
ejemplo2 = hijosDe_En_ "Sirius Black" fliaBlack = Just []

ejemplo3 = hijosDe_En_ "Abraxas Malfoy" fliaMalfoy
   = Just [ P "Lucius Malfoy" (EnMatrimonioCon "Narcissa Black") ]

ejemplo4 = hijosDe_En_ "Narcissa Black" fliaBlack
   = Just [ P "Draco Malfoy" (EnMatrimonioCon "Astoria Greengrass") ]

ejemplo5 = hijosDe_En_ "Narcissa Black" fliaMalfoy = Nothing

ejemplo6 = hijosDe_En_ "Draco Malfoy" fliaBlack
   = Just [ P "Scorpius Malfoy" (EnMatrimonioCon "Lilly Potter") ]

ejemplo7 = hijosDe_En_ "Draco Malfoy" fliaMalfoy
   = Just [ P "Scorpius Malfoy" (EnMatrimonioCon "Lilly Potter") ]

ejemplo8 = hijosDe_En_ "James Potter" fliaBlack = Nothing

--}

{--- ---}
type Nombre = String
data EstadoCivil = SinPareja | EnMatrimonioCon Nombre | EnMatrimonioConPeroHijosCon Nombre Nombre deriving Show
data Persona = P Nombre EstadoCivil deriving Show
data GenTree =   Hijos0 Persona | Hijos1 Persona GenTree | Hijos2 Persona GenTree GenTree | Hijos3 Persona GenTree GenTree GenTree deriving Show
--data Maybe a = Nothing | Just a deriving Show



nombre:: Persona -> Nombre
nombre (P n _) = n

esPersona::Nombre -> Persona-> Bool
esPersona n p = (nombre p) == n

existeEnGen::Nombre -> GenTree -> Bool
existeEnGen n (Hijos0 p) = esPersona n p
existeEnGen n (Hijos1 p g1) = esPersona n p || existeEnGen n g1
existeEnGen n (Hijos2 p g1 g2) = esPersona n p || existeEnGen n g1 || existeEnGen n g2
existeEnGen n (Hijos3 p g1 g2 g3) = esPersona n p || existeEnGen n g1 || existeEnGen n g2 || existeEnGen n g3


cabezaDeFamiliaDe ::  GenTree -> Persona
cabezaDeFamiliaDe (Hijos0 p) = p
cabezaDeFamiliaDe (Hijos1 p g1) = p
cabezaDeFamiliaDe (Hijos2 p g1 g2) = p
cabezaDeFamiliaDe (Hijos3 p g1 g2 g3) = p


hijosDe_En_ :: Nombre -> GenTree -> Maybe [Persona] 
hijosDe_En_ n g = if existeEnGen n g then Just (hijosDe_En_' n g) else Nothing


hijosDe_En_' :: Nombre -> GenTree -> [Persona] 
hijosDe_En_' n (Hijos0 p) =  []
hijosDe_En_' n (Hijos1 p g1) = if esPersona n p then (cabezaDeFamiliaDe g1) : [] else hijosDe_En_' n g1   
hijosDe_En_' n (Hijos2 p g1 g2) =  if esPersona n p then  (cabezaDeFamiliaDe g1) :(cabezaDeFamiliaDe g2) : [] else hijosDe_En_' n (if existeEnGen n g1 then g1 else g2 )
hijosDe_En_' n (Hijos3 p g1 g2 g3) =  if esPersona n p then (cabezaDeFamiliaDe g1) : (cabezaDeFamiliaDe g2) : (cabezaDeFamiliaDe g3) : [] else hijosDe_En_' n (if existeEnGen n g1 then g1 else (if existeEnGen n g2 then g2 else g3))




{--Escribir la función ancestrosDe_En_ :: Nombre -> GenTree -> [Persona] que describe los ancestros de la persona con nombre dado, o falla con error si ninguna persona del árbol tiene ese nombre.
Puede suponerse (sin verificar) que los nombres de las personas son únicos en el árbol dado. 

--EJEMPLOS:

ancestrosDe_En_ "Draco Malfoy" fliaBlack 
  = [ 
      P "Pollux Black" (EnMatrimonioCon "Irma Crabbe")
    , P "Cygnus Black III" (EnMatrimonioCon "Druella Rossier")
    , P "Narcissa Black" (EnMatrimonioCon "Lucius Malfoy")
    ]

ancestrosDe_En_ "Draco Malfoy" fliaMalfoy
  = [ 
      P "Brutus Malfoy II" (EnMatrimonioCon "Cierce Vyndon")
    , P "Abraxas Malfoy" (EnMatrimonioCon "(no identificada)")
    , P "Lucius Malfoy" (EnMatrimonioCon "Narcissa Black")
    ]

ancestrosDe_En_ "Pollux Black" fliaBlack = []

ancestrosDe_En_ "Harry Potter" fliaBlack = error "No pertenece a la familia"

ancestrosDe_En_ "Lucius Malfoy" fliaBlack = error "No pertenece a la familia"

ancestrosDe_En_ "Lucius Malfoy" fliaMalfoy
  = [
      P "Brutus Malfoy II" (EnMatrimonioCon "Cierce Vyndon")
    , P "Abraxas Malfoy" (EnMatrimonioCon "(no identificada)")
    ]
--}


nombre:: Persona -> Nombre
nombre (P n _) = n

esPersona::Nombre -> Persona-> Bool
esPersona n p = (nombre p) == n

existeEnGen::Nombre -> GenTree -> Bool
existeEnGen n (Hijos0 p) = esPersona n p
existeEnGen n (Hijos1 p g1) = esPersona n p || existeEnGen n g1
existeEnGen n (Hijos2 p g1 g2) = esPersona n p || existeEnGen n g1 || existeEnGen n g2
existeEnGen n (Hijos3 p g1 g2 g3) = esPersona n p || existeEnGen n g1 || existeEnGen n g2 || existeEnGen n g3




ancestrosDe_En_ :: Nombre -> GenTree -> [Persona] 
ancestrosDe_En_ n g = if existeEnGen n g then ancestrosDe_En_' n g  else error "No pertenece a la familia"


ancestrosDe_En_' :: Nombre -> GenTree -> [Persona] 
ancestrosDe_En_' n (Hijos0 p) = []
ancestrosDe_En_' n (Hijos1 p g1) = if existeEnGen n g1 then p : ancestrosDe_En_' n g1 else []
ancestrosDe_En_' n (Hijos2 p g1 g2) = if (existeEnGen n g1) || (existeEnGen n g2) then p :  ancestrosDe_En_' n g1 ++ ancestrosDe_En_' n g2 else []
ancestrosDe_En_' n (Hijos3 p g1 g2 g3) = if (existeEnGen n g1) || (existeEnGen n g2) || (existeEnGen n g3) then p : ancestrosDe_En_' n g1 ++ ancestrosDe_En_' n g2 ++ ancestrosDe_En_' n g3 else []


ancestrosDe_En_Ejemplo = ancestrosDe_En_ "Lucius Malfoy" fliaMalfoy
