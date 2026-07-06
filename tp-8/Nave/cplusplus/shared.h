#ifndef SHARED_TYPES_H
#define SHARED_TYPES_H
#include <string>

using std::string;
typedef int Barril;
typedef int Rango;
typedef std::string Nombre;
typedef std::string SectorId;
typedef std::string LanzaTorpedos;



struct Motor {
    int numero;
};

struct Almacen {
    Barril* barriles;
};

using Componente = std::variant<Motor, Almacen, LanzaTorpedos>;
#define Comida 0
#define Oxigeno  1
#define Torpedo   2
#define Combustible 3



#endif   