#include <iostream>
#include "Persona.h"
using namespace std;

/**struct Persona
{
    string nombre;
    int edad;
}; */

Persona consPersona(string nombre, int edad)
{
    PersonaSt* p = new PersonaSt;
    p->nombre = nombre;
    p->edad = edad;
    return p;
};
// Devuelve a una p ersona nueva, con el nombre y la edad dados

string nombre(Persona p) {
    return p->nombre;
};
// Devuelve el nombre de una p ersona

int edad(Persona p){
    return p->edad;
};
// Devuelve la edad de una p ersona

void crecer(Persona p){
    p->edad++;
};
// Aumenta en uno la edad de la p ersona.

void cambioDeNombre(string nombre, Persona p){
    p->nombre = nombre;
};
// Modifica el nombre una p ersona.

bool esMayorQueLaOtra(Persona p1, Persona p2){
    return p1->edad > p2->edad;
};
// Dadas dos p ersonas indica si la primera es mayor que la segunda.

Persona laQueEsMayor(Persona p1, Persona p2){
    return p1->edad > p2->edad ? p1 : p2;
};
// Dadas dos p ersonas devuelve a la p ersona que sea mayor