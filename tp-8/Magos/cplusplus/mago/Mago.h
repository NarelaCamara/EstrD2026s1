#include <iostream>
#include <string>
#include <vector>
using namespace std;
#include "../set/Set.h"

typedef std::string Nombre;
typedef std::string Hechizo;

struct MagoSt {
   Nombre nombre;
   Set hechizos
};

typedef MagoSt* Mago;

Mago crearM (Nombre n);

Nombre nombre (Mago m);

void aprender (Hechizo h, Mago m);

Set hechizos (Mago m);

void showMago(Mago m);

int testMago();