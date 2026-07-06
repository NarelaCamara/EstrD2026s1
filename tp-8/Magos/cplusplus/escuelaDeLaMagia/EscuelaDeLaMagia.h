

#include "../set/Set.h"     // Debe definir Set
#include "../map/Map.h"     // Debe definir Map
#include "../maxHeap/MaxHeap.h" // Debe definir MaxHeap



struct EscuelaDeLaMagiaSt {
    Set hechizos;
    Map magos;
    MaxHeap ordMagos;
};

typedef EscuelaDeLaMagiaSt* EscuelaDeLaMagia;


/**
 * INVARIANTES DE REPRESENTACION:
 * Los hechizos de la escuela son distintos entre si.
 * Cada clave del tipo Nombre son unicos en el tipo Map de clave Nombre, Value Mago
 * El prioritiQueue ordena segun la cantidad de hechizos que conoce cada mago, y en caso de empate, por orden de llegada.
 */

EscuelaDeMagia fundarEscuela ();

Bool estaVacia(EscuelaDeLaMagia em);

void registrar(Nombre n, EscuelaDeLaMagia em);

Set magos (EscuelaDeLaMagia em);

Set hechizosDe(Nombre n, EscuelaDeLaMagia em);

int leFaltaAprender(Nombre n, EscuelaDeLaMagia em);

Mago egresarUno (EscuelaDeLaMagia em);

void ensenia(Hechizo h, Nombre n, EscuelaDeLaMagia em);

