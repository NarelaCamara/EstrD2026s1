import Alcancia

type Nombre = String 
type Fecha = Int
data Sistema = Archivo Nombre Fecha | Carpeta Nombre Sistema Sistema deriving Show
type Ruta = [Nombre]


{-- Ejercicio 1 --}

filtrarPorFecha:: [Ruta] -> Fecha -> Sistema -> [Ruta]
filtrarPorFecha [] ff s =  []
filtrarPorFecha (r:rs) ff s = if fechaRutaValidaEnSistema r ff s then r : filtrarPorFecha rs ff s else filtrarPorFecha rs ff s 

fechaRutaValidaEnSistema:: Ruta -> Fecha -> Sistema -> Bool
fechaRutaValidaEnSistema [n] f (Archivo na fa) = na == n && fa == f
fechaRutaValidaEnSistema (n:ns) f (Carpeta nc s1 s2) = n == nc && (fechaRutaValidaEnSistema ns f s1 || fechaRutaValidaEnSistema ns f s2 )


{-- Ejemplo de uso --}
sistemaEjemplo :: Sistema
sistemaEjemplo = (Carpeta "Documentos" (Carpeta "Fotos" (Archivo "foto1.jpg" 12) (Archivo "foto2.jpg" 9)) (Carpeta "Musica" (Archivo "tema1.mp3" 41) (Archivo "tema2.mp3" 44)))

filtrarPorFechaEjemplo = filtrarPorFecha [ ["Documentos", "Musica", "foto1.jpg"],["Documentos", "Fotos", "foto1.jpg"],["Documentos", "Fotos", "foto12.jpg"]] 12 sistemaEjemplo


{-- Ejercicio 2 --}
{-- Como en ponerA dice claramente que las monedas validas son 1, 2 y 5 me imagino que debe ser una preciondicion solo insertar monedas de esos valores --}


monedasValidas = [1,2,5]
alcanciaEjemplo = (contarA 5 (ponerA 5 (ponerA 1 (ponerA 5 nuevaA))))  -- 2

vaquita:: [Alcancia] -> Alcancia
vaquita [] = nuevaA
vaquita (a:as) = juntarAlcancias a (vaquita as)

juntarAlcancias :: Alcancia -> Alcancia -> Alcancia
juntarAlcancias a1 a2 = agregarA (contarMonedaCantidad a1, monedasValidas) a2

contarMonedaCantidad:: Alcancia -> [Int] -> [(Int, Int)]
contarMonedaCantidad a [] = []
contarMonedaCantidad a (x:xs) = (x, contarA (x) a )  : contarMonedaCantidad xs a

agregarA::[(Int, Int)] -> Alcancia -> Alcancia 
agregarA [] a = a
agregarA (x:xs) a = ponerXCantidadYMonedas x (agregarA xs a) 

ponerXCantidadYMonedas:: (Int, Int) -> Alcancia -> Alcancia
ponerXCantidadYMonedas (m, 0) a = a
ponerXCantidadYMonedas (m, c) a = ponerA m (ponerXCantidadYMonedas (m, (c-1)) a)


{-- Ejemplo de uso --}
vaquitaEjemplo = vaquita [ alcanciaEjemplo, alcanciaEjemplo, alcanciaEjemplo]