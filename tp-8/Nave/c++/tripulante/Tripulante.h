#include <iostream>
using namespace std;
#include "../set/Set.h"

typedef std::string Nombre;
typedef std::string SectorId;

struct TripulanteSt {
    Set sectores;
    Nombre nombre;
    Rango rango
}

Tripulante creatT (Nombre n, Rango r);

void asignarS (SectorId s, Tripulante t);

Set sectoresT (Tripulante t);

Nombre nombre (Tripulante t);

Rango rango (Tripulante t);