#include <iostream>
#include "Persona.h"
using namespace std;


/* Costo: Un frame, constante, utiliza 3 campos en memoria stack y 2 en heap */
// Devuelve a una p ersona nueva, con el nombre y la edad dados
Persona consPersona(string nombre, int edad)
{
    PersonaSt* p = new PersonaSt;
    p->nombre = nombre;
    p->edad = edad;
    return p;
};
/*
STACK (consPersona activa)
+-----------------------------------------------------+
| consPersona frame                                   |         |
|                                                     |
| p : PersonaSt                                       |
|   - nombre                                          |
|   - edad                                            |
|   - p : PersonaSt --> HEAP {nombre,edad}            |                                               |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
| p: PersonaSt { nombre, edad }                       |
+-----------------------------------------------------+ 
*/

// Devuelve el nombre de una p ersona
/* Costo: Un frame, constante */
string nombre(Persona p) {
    return p->nombre;
};

/*
STACK
+-----------------------------------------------------+
| nombre frame                                   |         |
|                                                     |
| p : nombre                                       |
|   - p : PersonaSt --> HEAP {nombre,edad}            |                                               |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
| p: PersonaSt { nombre, edad }                       |
+-----------------------------------------------------+ 
*/


// Devuelve la edad de una p ersona
/* Costo: Un frame, constante */
int edad(Persona p){
    return p->edad;
};
/*
STACK
+-----------------------------------------------------+
| edad frame                                   |         |
|                                                     |
|   - p : PersonaSt --> HEAP {nombre,edad}            |                                               |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
| p: PersonaSt { nombre, edad }                       |
+-----------------------------------------------------+ 
*/


/* Costo: Un frame, constante */
// Aumenta en uno la edad de la p ersona.
void crecer(Persona p){
    p->edad++;
};
/*
STACK
+-----------------------------------------------------+
| crecer frame                                   |         |
|                                                     |
|   - p : PersonaSt --> HEAP {nombre,edad}            |                                               |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
| p: PersonaSt { nombre, edad }                       |
+-----------------------------------------------------+ 
*/



/* Costo: Un frame, constante */
// Modifica el nombre una p ersona.
void cambioDeNombre(string nombre, Persona p){
    p->nombre = nombre;
};
/*
STACK
+-----------------------------------------------------+
| cambioDeNombre frame                                   |         |
|                                                     |
|   - p : PersonaSt --> HEAP {nombre,edad}
    - n : nombre -> string
|                                               |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
| p: PersonaSt { nombre, edad }                       |
+-----------------------------------------------------+ 
*/

/* Costo: Un frame, constante */
// Dadas dos p ersonas indica si la primera es mayor que la segunda.
bool esMayorQueLaOtra(Persona p1, Persona p2){
    return p1->edad > p2->edad;
};
/*
STACK
+-----------------------------------------------------+
| cambioDeNombre frame                                |         
|                                                     |
|   - p1 : PersonaSt --> HEAP {nombre,edad}           |
|   - p2 : PersonaSt --> HEAP {nombre,edad}           |
|                                                     |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
| p1: PersonaSt { nombre, edad }                      |
|  p2: PersonaSt { nombre, edad }                     |
+-----------------------------------------------------+ 
*/


// Dadas dos p ersonas devuelve a la p ersona que sea mayor
Persona laQueEsMayor(Persona p1, Persona p2){
    return p1->edad > p2->edad ? p1 : p2;
};
/*
STACK
+-----------------------------------------------------+
| laQueEsMayor frame                                  |         
|                                                     |
|   - p1 : PersonaSt --> HEAP {nombre,edad}           |
|   - p2 : PersonaSt --> HEAP {nombre,edad}           |
|                                                     |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
|  p1: PersonaSt { nombre, edad }                     |
|  p2: PersonaSt { nombre, edad }                     |
+-----------------------------------------------------+ 
*/
