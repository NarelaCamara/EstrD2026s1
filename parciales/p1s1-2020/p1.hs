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
{-- Como en ponerA dice claramente que las monedas validas son 1, 2 y 5 
me imagino que debe ser una preciondicion solo insertar monedas de esos valores --}

monedasValidas :: [Int]
monedasValidas = [1,2,5]


vaquita :: [Alcancia] -> Alcancia
vaquita [] = nuevaA
vaquita (a:as) = juntarAlcancias a (vaquita as) monedasValidas

juntarAlcancias :: Alcancia -> Alcancia -> [Int] -> Alcancia
juntarAlcancias a1 a2 [] = a2
juntarAlcancias a1 a2 (x:xs) = ponerN (contarA x a1) x (juntarAlcancias a1 a2 xs)

ponerN :: Int -> Int -> Alcancia-> Alcancia
ponerN 0 n a = a
ponerN c n a = ponerA n (ponerN (c-1) n a)


{-- Ejemplo de uso --}
alcanciaEjemplo :: Alcancia
alcanciaEjemplo = (ponerA 5 (ponerA 5 (ponerA 5 (ponerA 2 (ponerA 2 (ponerA 1 nuevaA))))))

vaquitaEjemplo:: Alcancia
vaquitaEjemplo = vaquita [alcanciaEjemplo, alcanciaEjemplo, alcanciaEjemplo]