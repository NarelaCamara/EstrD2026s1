type Nombre = String 
type Fecha = Int
data Sistema = Archivo Nombre Fecha | Carpeta Nombre Sistema Sistema deriving Show
type Ruta = [Nombre]


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