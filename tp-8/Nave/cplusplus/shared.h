#ifndef SHARED_TYPES_H
#define SHARED_TYPES_H
#include <string>

typedef int Rango;
typedef std::string Nombre;
typedef std::string SectorId;
typedef std::string LanzaTorpedos;

union Componente {
    LanzaTorpedos LanzaTorpedo;
    Motor Motor;
    Almacen Almacen;
};

struct Motor {
    int numero;
};

struct Almacen {
    vector<Barril> barriles;
};

typedef int Barril;
#define Comida 0
#define Oxigeno  1
#define Torpedo   2
#define Combustible 3



#endif   