#include <iostream>
using namespace std;

struct NaveSt {
    Map sectores;
    Map tripulantes;
    MaxHeap maxTripulantes;
}

typedef NaveSt *Nave;


Nave construir(SectorId[] ss);

Nave ingresarT (Nombre n, Rango r, Nave n);
