#include <iostream>
#include "Nave.h"
using namespace std;


Nave construir (SectorId ss){
    NaveSt* n = new NaveSt;

    tripulantes = emptyM();
    sectores = emptyM();
    maxTripulantes = emptyH();

    n->tripulantes = tripulantes;
    n->sectores = sectores;
    n->maxTripulantes= maxTripulantes;
    return n;
};
