#include <iostream>
#include "Pokemon.h"
using namespace std;

struct PokeSt {
    TipoDePokemon tipo;
    int           vida;
};

// Ef. Tiempo : O( 1 + # por generar la variable puntero a Pokemon p
//                 1 + # por el acceso al campo tipo del Pokemon p
//                 1 + # por asignar el tipo en el campo tipo
//                 1 + # por el acceso al campo vida del Pokemon p
//                 1 + # por asignar 100  en el campo vida
//                 1 # por 'return'
//                 ) -> 1 + 1 + 1 + 1 + 1 + 1 = 6 => constante
//              O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'consPokemon' con 2 espacios, uno para el parámetro tipo de pokemon 
//                   y otro espacio para la variable que es puntero al Pokemon p. 
//                   Tambiém se reserva un espacio de la memoria heap para el Pokemon p, tiene los campos tipo y vida.
Pokemon consPokemon(TipoDePokemon tipo) {
    PokeSt* poke = new PokeSt;
    poke->tipo=tipo, poke->vida=100;
    return poke; 
}

// Ef. Tiempo : O( 1 + # por el acceso al campo tipo del Pokemon p
//                 1 # por 'return' 
//                 ) -> 1 + 1 = 2 => constante
//              O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'tipoDePokemon' con el espacio para su parámetro "Pokemon p" 
TipoDePokemon tipoDePokemon(Pokemon p) {
    return p->tipo;
}

// Ef. Tiempo : O( 1 + # por el acceso al campo vida del Pokemon p
//                 1 # por 'return' 
//                 ) -> 1 + 1 = 2 => constante
//              O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'energia' con el espacio para su parámetro "Pokemon p" 
int energia(Pokemon p) {
    return p->vida;
}

// Ef. Tiempo : O( 1 + # por el acceso al campo energivida del Pokemon p
//                 1 # por settear la nueva cantidad de vida según la energia dada.
//                 ) -> 1 + 1 = 2 => constante
//              O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'perderEnergia' con los espacio para sus parámetros "energia" y "Pokemon p"
void perderEnergia(int energia, Pokemon p) {
    p->vida-=energia;
}

// Ef. Tiempo : O( 1 + # por el acceso al campo tipo del Pokemon p1
//                 1 + # por el acceso al campo tipo del Pokemon p2
//                 1 + # por '==' (peor caso, 6 veces)
//                 1 # por 'return' 
//                 ) -> 1 + 1 + 6 + 1 = 8 => constante
//              O(1)
// Ef. Memoria: O(1) se genera el stack frame de 'superaA' con los espacio para sus parámetros "Pokemon p1" y "Pokemon p2"
bool superaA(Pokemon p1, Pokemon p2) {
    return 
    (p1->tipo == "Agua"   && p2->tipo == "Fuego")  ||   
    (p1->tipo == "Fuego"  && p2->tipo == "Planta") || 
    (p1->tipo == "Planta" && p2->tipo == "Agua");    
}