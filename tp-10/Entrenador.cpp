#include <iostream>
#include "Pokemon.h"
#include "Entrenador.h"
using namespace std;


/*Dado un nombre, una cantidad de pokémon, y un array de pokémon de ese tamaño, devuelve
un entrenador.*/
/* costo constante, un frame con 5 campos y heap un arran tamaño cantidad y 2 espacios por el entrenador  */
Entrenador consEntrenador(string nombre, int cantidad, Pokemon *pokemon)
{
    EntrenadorSt *e = new EntrenadorSt;
    e->nombre = nombre;
    e->cantPokemon = cantidad;
    // reservar espacio para el array de pokémon y copiar los punteros
    e->pokemon = new Pokemon[cantidad];
    for (int i = 0; i < cantidad; ++i)
    {
        e->pokemon[i] = pokemon[i];
    }
    return *e;
};
/*
STACK
+-----------------------------------------------------+
| perderEnergia frame                                 |
|    - e :  --> HEAP EntrenadorSt               |
|   - nombre -- string  
    - cantidad -- int
    - ps -- HEAP Pokemon    
    - i int (for)                            |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
|   e: EntrenadorSt { 
        - nombre, 
        - cantPokemon, 
        - pokemon --> HEAP pokemon 
    }
|   - pokemon: [cantidad]
        - [0] {tipo, vida}                                 |
|       - [...] {tipo, vida}                                 |
|       - [cantidad] {tipo, vida}                                                                  |
+-----------------------------------------------------+ 
*/


// Devuelve el nombre del entrenador.
string nombreDeEntrenador(Entrenador e)
{
    return e.nombre;
};
/*
STACK
+-----------------------------------------------------+
| nombreDeEntrenador frame                            |
|   - e :  --> HEAP EntrenadorSt                       |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
|   - e: Entrenador { 
        - nombre, 
        - cantPokemon, 
        - pokemon --> HEAP pokemon }
|   - pokemon: [cantidad]
        - [0] {tipo, vida}                                 |
|       - [...] {tipo, vida}                                 |
|       - [cantidad] {tipo, vida}                                                                  |
+-----------------------------------------------------+ 
*/


// Devuelve la cantidad de p okémon que p osee el entrenador.
int cantidadDePokemon(Entrenador e)
{
    return e.cantPokemon;
};
/*
STACK
+-----------------------------------------------------+
| nombreDeEntrenador frame                            |
|   - e :  --> HEAP EntrenadorSt                       |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
|   - e: Entrenador { 
        - nombre, 
        - cantPokemon, 
        - pokemon --> HEAP pokemon }
|   - pokemon: [cantidad]
        - [0] {tipo, vida}                                 |
|       - [...] {tipo, vida}                                 |
|       - [cantidad] {tipo, vida}                                                                  |
+-----------------------------------------------------+ 
*/



// Devuelve la cantidad de p okémon de determinado tip o que p osee el entrenador.
int cantidadDePokemonDe(TipoDePokemon tipo, Entrenador e)
{
    int cantidad = 0;
    for (int i = 0; i < e.cantPokemon; ++i)
    {
        cantidad = e.pokemon[i]->tipo == tipo ? 1 : 0;
    }
    return cantidad;
};

// Devuelve el p okémon número i de los p okémon del entrenador.
// Precondición: existen al menos i −1 p okémon.
Pokemon pokemonNro(int i, Entrenador e)
{
    return e.pokemon[i++];
};

// Dados dos entrenadores, indica si, para cada pokémon del segundo entrenador, el primero
// posee al menos un pokémon que le gane a todos
bool leGanaATodos(Entrenador e1, Entrenador e2)
{
    for (int i = 0; i < e1.cantPokemon; ++i)
    {
        if (superaATodos(e1.pokemon[i], e2))
        {
            return true;
        };
    }
    return false;
};

bool superaATodos(Pokemon p, Entrenador e2)
{
    bool leGanaATodosBool = false;
    for (int i = 0; i < e2.cantPokemon; ++i)
    {
        leGanaATodosBool = leGanaATodosBool && (superaA(p, e2.pokemon[i]));
    }
    return leGanaATodosBool;
}