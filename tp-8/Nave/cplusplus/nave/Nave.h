#include <iostream>
#include <string>
using std::string;
#include "../set/Set.h"
#include "../map/Map.h"
#include "../maxHeap/MaxHeap.h"
#include "../shared.h"

struct NaveSt {
    Map sectores;
    Map tripulantes;
    MaxHeap OrdRangoTripulantes;
}

typedef NaveSt* Nave;

Nave construir(SectorId ss);

void ingresarT(Nombre n, Rango r, Nave n);

Set sectoresAsignados (Nombre n, Rango r, Nave n);

pair<Set, Componente*> datosDeSector(SectorId sId, Nave n);

Tripulantes* tripulantesN (Nave n);

void agregarASector (Componentes* cs, SectorId sId, Nave n);

void asignarASector(Nombre n, SectorId sId, Nave n);

int testNave();