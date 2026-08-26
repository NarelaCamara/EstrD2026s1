#include <iostream>
#include "Persona.h"
using namespace std;

struct PersonaSt {
  string nombre;
  int    edad;
};

// Ef. Tiempo : O( 1 + # por generar la variable puntero a la persona p
//                 1 + # por el acceso al campo nombre de la persona p
//                 1 + # por asignar el nombre en el campo nombre
//                 1 + # por el acceso al campo edad de la persona p
//                 1 + # por asignar la edad en el campo edad
//                 1 # por 'return'
//                 ) -> 1 + 1 + 1 + 1 + 1 + 1 = 6 => constante
//              O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'consPersona' con los espacios para sus 
//                   parámetros nombre y edad y un espacio para el puntero Persona p, 
//                   y se reserva un espacio de la memoria heap para la Persona p, que 
//                   tiene los campos nombre y edad.
Persona consPersona(string nombre, int edad) {
  PersonaSt* p = new PersonaSt;
  p->nombre = nombre; 
  p->edad   = edad;
  return p;
}

// Ef. Tiempo : O( 1 + # por el acceso al campo nombre de la persona p
//                 1 # por 'return' 
//                 ) -> 1 + 1 = 2 => constante
//              O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'nombre' con el espacio para su 
//                   parámetro "Persona p" 
string nombre(Persona p) {
    return p->nombre;
}

// Ef. Tiempo : O( 1 + # por el acceso al campo edad de la persona p
//                 1 # por 'return' 
//                 ) -> 1 + 1 = 2 => constante
//              O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'edad' con el espacio para su 
//                   parámetro "Persona p" 
int edad(Persona p) {
    return p->edad;
}

// Ef. Tiempo : O( 1 + # por el acceso al campo edad de la persona p
//                 1 # por aumentar en una unidad el valor de la edad de la persona p
//                 ) -> 1 + 1 = 2 => constante
//              O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'crecer' con el espacio para su 
//                   parámetro "Persona p" 
void crecer(Persona p) {  
    p->edad++;
}

// Ef. Tiempo : O( 1 + # por el acceso al campo nombre de la persona p
//                 1 # por asignar el nuevo nombre.
//                 ) -> 1 + 1 = 2 => constante
//              O(1) 
// Ef. Memoria: O(1) se genera el stack frame de 'cambioDeNombre' con los espacios para sus 
//                   parámetros "nombre" y "Persona p". El cambio de nombre solo genera un 
//                   de datos en la memoria dinámica asignada al campo nombre de la persona p.
void cambioDeNombre(string nombre, Persona p) {
    p->nombre=nombre;
}

// Ef. Tiempo : O( 1 + # por el uso de '>'
//                 1 + # por el acceso al campo edad de la persona p1
//                 1 + # por el acceso al campo edad de la persona p2
//                 1 # por el return
//                 ) -> 1 + 1 + 1 + 1 = 4 => constante
//              O(1) 
// Ef. Memoria: O(1) se genera el stack frame de 'esMayorQueLaOtra' con los espacios para sus 
//                   parámetros las personas p1 y p2.
bool esMayorQueLaOtra(Persona p1, Persona p2) {
    return p1->edad > p2->edad;
}

// Ef. Tiempo : O(1), por el uso de mayor o igual, por los accesos a edad de cada persona dada
//                    y por el return, todas operaciones de orden constante.
// Ef. Memoria: O(1) se genera el stack frame de 'laQueEsMayor' con los espacios para sus 
//                   parámetros, las personas p1 y p2.
Persona laQueEsMayor(Persona p1, Persona p2) {
    if (p1->edad >= p2->edad) {
        return p1;
    } else {
        return p2;
    }
}