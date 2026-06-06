#include <iostream>
using namespace std;

void f1()
{

    struct PersonaStr
    {
        string nombre;
        int edad;
    };

    // Persona
    PersonaStr p;

    // Puntero a Persona
    PersonaStr *p1 = new PersonaStr;
    p1->edad = 37;

    // Array Estatico de Personas
    PersonaStr ps[3];
    // quiero modificar el tercer elemento del array estatico
    ps[2].edad = 60;

    // Array estatico de punteros a PersonaStr
    PersonaStr *ps1[2];
    // quiero modificar el primer elemento del array estatico de punteros
    ps1[0]->edad = 70;

    // Array dinamico de PersonaStr
    PersonaStr *ps2;
    ps2 = new PersonaStr[3];

        // quiero modificar el segundo elemento
        ps2[1].edad = 75;
    
    //Array dinamico de personas Dinamicas
    PersonaStr **ps3 = new PersonaStr *[5];

        // quiero modificar el segundo elemento
         ps3[2] = new PersonaStr;
         ps3[2]->nombre = "Pepe";

    //DELETE

    //delete p; No se puede borrar porque es estatico y se borra cuando termina f1
    delete p1;
    PersonaStr *ps1[5];
    ps1[2] = new PersonaStr;
    delete ps1[2];
    delete ps2;

    delete ps3[3];
    delete ps3;
}

int main() {

};