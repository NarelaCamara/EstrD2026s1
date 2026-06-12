#include <iostream>
#include "Pokemon.h"
#include "Entrenador.h"
using namespace std;


/*Dado un nombre, una cantidad de pokémon, y un array de pokémon de ese tamaño, devuelve
un entrenador.*/
/* costo lineal en cantidad, porque copia el array de punteros a Pokémon.
   Stack: un frame constante con los parámetros y la variable de bucle.
   Heap: una estructura EntrenadorSt y un array de `Pokemon` (punteros).
*/
Entrenador consEntrenador(string nombre, int cantidad, Pokemon *pokemon)
{
    EntrenadorSt *e = new EntrenadorSt;
    e->nombre = nombre;
    e->cantPokemon = cantidad;
    // reservar espacio para el array de punteros a Pokemon y copiar los punteros
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
| consEntrenador frame                                 |
|   - nombre : string                                  |
|   - cantidad : int                                   |
|   - pokemon : Pokemon*                                |
|   - e : EntrenadorSt*                                |
|   - i : int                                          |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
| EntrenadorSt {                                      |
|   nombre,                                           |
|   cantPokemon,                                      |
|   pokemon --> HEAP [cantidad]                       |
| }                                                   |
|                                                     |
| pokemon: [cantidad]                                 |
|   [0] -> Pokemon                                     |
|   [1] -> Pokemon                                     |
|   ...                                               |
|   [cantidad-1] -> Pokemon                            |
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