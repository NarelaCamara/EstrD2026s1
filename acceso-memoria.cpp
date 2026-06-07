#include <iostream>
using namespace std;
#include "Persona.h"

void f1()
{

    // Persona es estatica, se borra cuando termina f1
    PersonaStr p;

    // Puntero a Persona es dinamico, se borra con delete
    PersonaStr *p1 = new PersonaStr;
    p1->edad = 37;

    // Array Estatico de Personas estaticas, se borra cuando termina f1
    PersonaStr ps[3];
    // quiero modificar el tercer elemento del array estatico
    ps[2].edad = 60;

    // Array estatico de punteros a PersonaStr estaticas, se borra cuando termina f1
    PersonaStr *ps1[2];
    ps1[0] = new PersonaStr;
    // quiero modificar el primer elemento del array estatico de punteros
    ps1[0]->edad = 70;

    // Array dinamico de PersonaStr estaticas, se borra con delete[]
    PersonaStr *ps2 = new PersonaStr[3];

    // quiero modificar el segundo elemento
    ps2[1].edad = 75;

    // Array dinamico de punteros a PersonaStr, se borra con delete[]
    PersonaStr **ps3 = new PersonaStr *[5];
    for (int i = 0; i < 5; ++i)
        ps3[i] = nullptr;

    // quiero modificar el segundo elemento
    ps3[2] = new PersonaStr;
    ps3[2]->nombre = "Pepe";

    cout << "p: " << p.edad << endl;
    cout << "p1: " << p1->edad << endl;
    cout << "ps[2]: " << ps[2].edad << endl;
    cout << "ps1[0]: " << ps1[0]->edad << endl;
    cout << "ps2[1]: " << ps2[1].edad << endl;
    cout << "ps3[2]: " << ps3[2]->nombre << endl;

    // DELETE

    // delete p; No se puede borrar porque es estatico y se borra cuando termina f1
    delete p1;
    delete ps1[0];
    delete[] ps2;
    delete ps3[2];
    delete[] ps3;

    cout << "Memoria liberada" << endl;
    cout << "p: " << p.edad << endl;
    cout << "p1: " << p1->edad << endl;
    cout << "ps[2]: " << ps[2].edad << endl;
    cout << "ps1[0]: " << ps1[0]->edad << endl;
    cout << "ps2[1]: " << ps2[1].edad << endl;
    cout << "ps3[2]: " << ps3[2]->nombre << endl; //no se asusten si es raro lo que se ve en consola, es porque se borro la memoria y se esta accediendo a memoria que ya no es de nuestro programa, lo que se llama "memoria basura"
}

int main()
{
    f1();
};