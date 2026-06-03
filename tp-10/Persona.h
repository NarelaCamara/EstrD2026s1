#include <iostream>
using namespace std;

struct PersonaSt
{
    string nombre;
    int edad;
};

typedef PersonaSt *Persona;

Persona consPersona(string nombre, int edad);
// Devuelve a una p ersona nueva, con el nombre y la edad dados

string nombre(Persona p);
// Devuelve el nombre de una p ersona

int edad(Persona p);
// Devuelve la edad de una p ersona

void crecer(Persona p);
// Aumenta en uno la edad de la p ersona.

void cambioDeNombre(string nombre, Persona p);
// Modifica el nombre una p ersona.

bool esMayorQueLaOtra(Persona p1, Persona p2);
// Dadas dos p ersonas indica si la primera es mayor que la segunda.

Persona laQueEsMayor(Persona p1, Persona p2);
// Dadas dos p ersonas devuelve a la p ersona que sea mayor