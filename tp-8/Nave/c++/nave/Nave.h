#include <iostream>
using namespace std;
#include "../set/Set.h"
#include "../map/Map.h"
#include "../maxHeap/MaxHeap.h"

struct NaveSt {
    Map sectores;
    Map tripulantes;
    MaxHeap OrdRangoTripulantes;
}

typedef NaveSt* Nave;

typedef int Barril;
#define Comida 0
#define Oxigeno  1
#define Torpedo   2
#define Combustible 3


typedef std::string Nombre;
typedef std::string SectorId;

struct Componente {
    int LanzaTorpedo;
    int Motor;
    Barril[] Almacen;
}

Nave construir(SectorId ss);

void ingresarT(Nombre n, Rango r, Nave n);

Set sectoresAsignados (Nombre n, Rango r, Nave n);

(Set, Componente[]) datosDeSector(SectorId sId, Nave n);

Tripulantes[] tripulantesN (Nave n);

void agregarASector (Componentes[] cs, SectorId sId, Nave n);

void asignarASector(Nombre n, SectorId sId, Nave n);
