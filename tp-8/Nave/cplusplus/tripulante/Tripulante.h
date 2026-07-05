#pragma once

#include <string>
using std::string;
#include "../set/Set.h"
#include "../shared.h"

/*
INVARIANTE DE REPRESENTACION:
- El conjunto de sectores no puede ser nulo.
- El nombre no puede ser vacío.
- El rango debe ser un valor válido, un numero mayor o igual a 0 y siendo 10 el mas alto.
*/


struct TripulanteSt {
    Set sectores;
    Nombre nombre;
    Rango rango;
};

typedef TripulanteSt* Tripulante;

// Crea un tripulante con nombre y rango.
Tripulante crearT(Nombre n, Rango r);

// Asigna un sector al tripulante.
void asignarS(SectorId s, Tripulante t);

// Devuelve los sectores asignados.
Set sectoresT(Tripulante t);

// Accesores.
Nombre nombre(Tripulante t);
Rango rango(Tripulante t);

int testTripulante();