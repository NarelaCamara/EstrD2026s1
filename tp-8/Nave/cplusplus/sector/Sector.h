#include <iostream>
using namespace std;
#include "../set/Set.h"
#include "../shared.h"

struct SectorSt {
    Set tripulantes;
    SectorId sectorId;
    Componente[] componentes;
}

typedef SectorSt* Sector;

Sector crearS(SectorId sId);

SectorId sectorId(Sector s);

Componente[] componentesS (Sector s);

Set tripulantesS (Sector s);

void agregarC (Componente c, Sector s);

void agregarT (Tripulant t, Sector s);
