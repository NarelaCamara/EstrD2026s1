#include <iostream>
#include <string>
#include <vector>
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
typedef std::string LanzaTorpedos;

struct Motor {
    int numero;
};

struct Almacen {
    vector<Barril> barriles;
};

union Componente {
    LanzaTorpedos LanzaTorpedo;
    Motor Motor;
    Almacen Almacen;
};

Nave construir(SectorId ss);

void ingresarT(Nombre n, Rango r, Nave n);

Set sectoresAsignados (Nombre n, Rango r, Nave n);

pair<Set, vector<Componente>> datosDeSector(SectorId sId, Nave n);

Vector<Tripulantes> tripulantesN (Nave n);

void agregarASector (Componentes[] cs, SectorId sId, Nave n);

void asignarASector(Nombre n, SectorId sId, Nave n);
