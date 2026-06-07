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
        ps3[i] = new PersonaStr; // ya no queda ningún puntero nulo

    // quiero modificar el segundo elemento
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
    for (int i = 0; i < 5; ++i)
        delete ps3[i];
    delete[] ps3;

    cout << "Memoria liberada" << endl;
    cout << "p: " << p.edad << endl;
    cout << "p1: " << p1->edad << endl;
    cout << "ps[2]: " << ps[2].edad << endl;
    cout << "ps1[0]: " << ps1[0]->edad << endl;
    cout << "ps2[1]: " << ps2[1].edad << endl;
    cout << "ps3[2]: " << ps3[2]->nombre << endl; // no se asusten si es raro lo que se ve en consola, es porque se borro la memoria y se esta accediendo a memoria que ya no es de nuestro programa, lo que se llama "memoria basura"
}

int main()
{
    f1();
};

/**
STACK (f1 activa)
+-----------------------------------------------------+
| f1 frame                                            |
|                                                     |
| p : PersonaStr                                      |
|   - nombre                                          |
|   - edad                                            |
|                                                     |
| p1 : PersonaStr*  ---> HEAP objeto A {nombre,edad} |
|                                                     |
| ps : PersonaStr[3]                                  |
|   [0] {nombre,edad}                                 |
|   [1] {nombre,edad}                                 |
|   [2] {nombre,edad}                                 |
|                                                     |
| ps1 : PersonaStr*[2]                                |
|   [0] --> HEAP objeto B {nombre,edad}               |
|   [1] = basura (sin inicializar)                   |
|                                                     |
| ps2 : PersonaStr*  ---> HEAP array C de 3          |
|   C[0] {nombre,edad}                                |
|   C[1] {nombre,edad}                                |
|   C[2] {nombre,edad}                                |
|                                                     |
| ps3 : PersonaStr** ---> HEAP array D de 5 punteros  |
|   D[0] --> HEAP objeto E0 {nombre,edad}            |
|   D[1] --> HEAP objeto E1 {nombre,edad}            |
|   D[2] --> HEAP objeto E2 {nombre="Pepe",edad}     |
|   D[3] --> HEAP objeto E3 {nombre,edad}            |
|   D[4] --> HEAP objeto E4 {nombre,edad}            |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
| A: PersonaStr { nombre, edad }                      |
| B: PersonaStr { nombre, edad }                      |
| C: PersonaStr[3]                                    |
|    - C[0] {nombre,edad}                             |
|    - C[1] {nombre,edad}                             |
|    - C[2] {nombre,edad}                             |
| D: PersonaStr*[5]                                   |
|    - D[0] -> E0                                     |
|    - D[1] -> E1                                     |
|    - D[2] -> E2                                     |
|    - D[3] -> E3                                     |
|    - D[4] -> E4                                     |
| E0..E4: PersonaStr { nombre, edad }                 |
+-----------------------------------------------------+ */