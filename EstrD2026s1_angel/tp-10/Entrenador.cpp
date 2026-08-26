#include <iostream>
#include "Entrenador.h"
#include "Pokemon.h"
using namespace std;

struct EntrenadorSt {
    string nombre;
    Pokemon* pokemon;
    int cantPokemon;
};

// INV. REP.:
// * la cantidad de pokemons en el array del puntero pokemon debe ser igual al campo cantPokemon

// Ef. Tiempo : O( 1 + # por generar la variable del puntero Entrenador e
//                 1 + # por el acceso al campo nombre del Entrenador e
//                 1 + # por asignar el nombre en el campo nombre
//                 1 + # por el acceso al campo cantPokemon del Entrenador e
//                 1 + # por asignar la cantidad de Pokemons en el campo cantPokemon
//                 1 + # por el acceso al campo pokemon del Entrenador e
//                 1 + # por asignar lel puntero al array de pokemons en el campo pokemon
//                 1 # por 'return' Entrenador e
//                 ) -> 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 = 8 => constante
//              O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'consEntrenador' con 4 espacios, tres para los parámetros nombre, cantidad 
//                   y puntero a un array de pokemons, y otro espacio para la variable que es puntero al Entrenador e. 
//                   Tambiém se reserva un espacio de la memoria heap para el Entrenador e, que tiene los campos nombre(string),
//                   cantidad de pokemons(int) y pokemon(puntero a un array de pokemons).
Entrenador consEntrenador(string nombre, int cantidad, Pokemon* pokemon) {
    EntrenadorSt* e = new EntrenadorSt;
    e->nombre       = nombre;
    e->pokemon      = pokemon;
    e->cantPokemon  = cantidad;
    return e;
}

// Ef. Tiempo : O( 1 + # por acceder al campo nombre del puntero Entrenador e
//                 1 # por 'return' nombre
//                 ) -> 1 + 1 = 2 => constante
//              O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'nombreDeEntrenador' con 1 espacio, para el parámetro Entrenador e.
string nombreDeEntrenador(Entrenador e) {
    return e->nombre;
}

// Ef. Tiempo : O( 1 + # por acceder al campo cantPokemon del puntero Entrenador e
//                 1 # por 'return' cantPokemon
//                 ) -> 1 + 1 = 2 => constante
//              O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'cantidadDePokemon' con 1 espacio, para el parámetro Entrenador e.
int cantidadDePokemon(Entrenador e)  {
    return e->cantPokemon;
}

// Ef. Tiempo : O( 1 + # por inicializar la variable contador
//                 1 + # por inicializar la variable int
//                 (P * # por iteración sobre el array de pokemons del entrenador dado, siendo P la cant de Pokemons 
//                      1 + # por cada al array del puntero Entrenador e
//                      1 + # por '!='
//                      1 + # por acceder al campo cantPokemon del Entrenador e
//                      1 + # por '<='
//                      1 + # por '=='
//                      1 # por '++'
//                 ) + 1 # por 'return'
//                 ) -> 1 + 1 + P * 6 + 1 = P
//              O(P)
// Ef. Memoria: O(1) se genera el stack frame de 'cantidadDePokemon' con 3 espacios:
//                      - 1 espacio para el parámetro Entrenador e.
//                      - 1 espacio para la variable int contador.
//                      - 1 espacio para la variable int i.
//                      y en cada vuelta de la iteración se hace un llamado a 'tipoDePokemon', que se genera su stack frame y se destruye.
int cantidadDePokemonDe(TipoDePokemon tipo, Entrenador e) {
    int contador = 0;
    for(int i=0; i < e->cantPokemon; i++) {
        if (tipoDePokemon(e->pokemon[i]) == tipo ) contador++;
    }
    return contador;
}

// Ef. Tiempo : O( 1 + # por acceder al campo cantPokemon del puntero Entrenador e
//                 1 + # por acceder al pokemon en la posición i-1 del array de pokemons
//                 1 + # por el uso de '<=' 
//                 1 # por 'return' cantPokemon
//                 ) -> 1 + 1 + 1 + 1 = 4 => constante
//              O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'pokemonNro' con 2 espacio, para los parámetros int i y Entrenador e.
Pokemon pokemonNro(int i, Entrenador e) {
    if(i <= e->cantPokemon) { 
        return (e->pokemon)[i-1];
    }
}

// Ef. Tiempo : O( accesos a punteros, inicializaciones de variables, bools, return, ++ y 'superaA' son todas operaciones de 
//                 orden constante y por cada vuelta en el while se realizan algunas de estas operaciones, entonces, en el peor
//                 caso posible hay que recorrer ambos arrays de pokemons hasta el final)
//              O(P * P') siendo P la cant de pokemons del entrenador e1 y P' la cantidad de pokemons del entrenador e2.
// Ef. Memoria: O(1) se genera el stack frame de 'leGanaATodos' con 4 espacios:
//                      - 2 para los parámetros Entrenador e1 y Entrenador e2
//                      - 2 para las varaibles contador1 t contador2
//                      además en cada vuelta del while se genera el stack para 'superaA' O(1) en memoria
bool leGanaATodos(Entrenador e1, Entrenador e2) {
    int contador1 = 0; int contador2 = 0;
    while( contador1 < e1->cantPokemon && contador2 < e2->cantPokemon ){   
        if(superaA(e1->pokemon[contador1], e2->pokemon[contador2])) 
            { contador2++; } else { contador1++; }    
    }
    return e1->cantPokemon > 0 && contador2 == e2->cantPokemon;
}


/////////

bool superaATodos(Pokemon p, Entrenador e) {
    bool rta = true;
    int contador = 0;
    while ( rta && contador < e->cantPokemon) { 
        rta = rta && superaA(p, e->pokemon[contador]);
        contador++;
    }
    return rta;
}

bool leGanaATodos2(Entrenador e1, Entrenador e2) {
    bool rta = false;
    int contador = 0;
    while( !rta && contador < e1->cantPokemon){
        if (superaATodos(e1->pokemon[contador], e2)) { rta = true; }
        contador++;
    }
    return rta;
}