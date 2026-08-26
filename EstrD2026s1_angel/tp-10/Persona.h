#include <iostream>
using namespace std;

struct PersonaSt;
  
typedef struct PersonaSt* Persona;

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
Persona consPersona(string nombre, int edad);
// Devuelve a una persona nueva, con el nombre y la edad dados

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
string nombre(Persona p);
// Devuelve el nombre de una persona

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
int edad(Persona p);
// Devuelve la edad de una persona

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
void crecer(Persona p);
// Aumenta en uno la edad de la persona.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
void cambioDeNombre(string nombre, Persona p);
// Modifca el nombre una persona.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
bool esMayorQueLaOtra(Persona p1, Persona p2);
//  Dadas dos personas indica si la primera es mayor que la segunda.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
Persona laQueEsMayor(Persona p1, Persona p2);
// Dadas dos personas devuelve a la persona que sea mayor.