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
    Entrenador e = new EntrenadorSt;
    e->nombre = nombre;
    e->cantPokemon = cantidad;
    // reservar espacio para el array de punteros a Pokemon y copiar los punteros
    e->pokemon = new Pokemon[cantidad];
    for (int i = 0; i < cantidad; ++i)
    {
        e->pokemon[i] = pokemon[i];
    }
    return e;
};
/*
STACK
+-----------------------------------------------------+
| consEntrenador frame                                 |
|   - nombre : string                                  |
|   - cantidad : int                                   |
|   - pokemon : --> HEAP Pokemon                       |
|   - e : --> HEAP Entrenador                          |
|   - i : int                                          |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
|  - e: Entrenador  {                                      |
|   - nombre,                                           |
|   - cantPokemon,                                      |
|   - pokemon --> HEAP [cantidad]                       |
| }                                                   |
|                                                     |
| pokemon: [cantidad]                                 |
|   [0] -> Pokemon                                     |
|   [1] -> Pokemon                                     |
|   ...                                               |
|   [cantidad-1] -> Pokemon                            |
+-----------------------------------------------------+
*/

// costo constante, crea un frame
// Devuelve el nombre del entrenador.
string nombreDeEntrenador(Entrenador e)
{
    return e->nombre;
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
    return e->cantPokemon;
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
    for (int i = 0; i < e->cantPokemon; ++i)
    {
        cantidad = e->pokemon[i]->tipo == tipo ? 1 : 0;
    }
    return cantidad;
};
/*
STACK
+-----------------------------------------------------+
| nombreDeEntrenador frame                            |
|   - e :  --> HEAP EntrenadorSt                       |
|   - tipo: string
    - cantidad: int
    - i: int
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

// Devuelve el p okémon número i de los p okémon del entrenador.
// Precondición: existen al menos i −1 p okémon.
Pokemon pokemonNro(int i, Entrenador e)
{
    return e->pokemon[i++];
};
/*
STACK
+-----------------------------------------------------+
| nombreDeEntrenador frame                            |
|   - e :  --> HEAP EntrenadorSt                      |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
|   - e: Entrenador {                                 |
|        - nombre,                                    |
|        - cantPokemon,                               |
|        - pokemon --> HEAP pokemon }                 |
|   - pokemon: [cantidad]                             |
|        - [0] {tipo, vida}                           |
|       - [...] {tipo, vida}                          |
|       - [cantidad] {tipo, vida}                     |
+-----------------------------------------------------+ 
*/


/** costo: se van a abrir  */
bool superaATodos(Pokemon p, Entrenador e2)
{
    bool leGanaATodosBool = false;
    for (int i = 0; i < e2->cantPokemon; ++i)
    {
        leGanaATodosBool = leGanaATodosBool && (superaA(p, e2->pokemon[i]));
    }
    return leGanaATodosBool;
}

// Dados dos entrenadores, indica si, para cada pokémon del segundo entrenador, el primero
// posee al menos un pokémon que le gane a todos
bool leGanaATodos(Entrenador e1, Entrenador e2)
{
    for (int i = 0; i < e1->cantPokemon; ++i)
    {
        if (superaATodos(e1->pokemon[i], e2))
        {
            return true;
        };
    }
    return false;
};
/*
STACK
+-----------------------------------------------------+
| leGanaATodos frame                                  |
|   - e1 :  --> HEAP EntrenadorSt                     |
|   - e2 :  --> HEAP EntrenadorSt                     |
|    - i: int                                         |
|    - [e1-> pokemon[0]] superaATodos frame           |
|           - p :  --> HEAP Pokemon                   |
|           - e2 :  --> HEAP EntrenadorSt             |  
|            - leGanaATodosBool: bool                 |
|            - i: int                                 |
|    - [e1-> pokemon[...]] superaATodos frame         |  
|            - p :  --> HEAP Pokemon                  |
|           - e2 :  --> HEAP EntrenadorSt             | 
|            - leGanaATodosBool: bool                 |
|            - i: int|                                |
|    - [e1-> pokemon[cantidad]] superaATodos frame    |
|    - p :  --> HEAP Pokemon                          |
|           - e2 :  --> HEAP EntrenadorSt             |
|            - leGanaATodosBool: bool                 |
|            - i: int                                 |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
|   - e1: Entrenador {                                |
|        - nombre,                                    |
|        - cantPokemon,                               |
|        - pokemon1 --> HEAP pokemon }                |
    - e2: Entrenador {                                |
|        - nombre,                                    |
|        - cantPokemon,                               |
|        - pokemon2 --> HEAP pokemon }                |
|   - pokemon1: [cantidad]                            |
|        - [0] {tipo, vida}                           |
|       - [...] {tipo, vida}                          |
|       - [cantidad] {tipo, vida}                     |
|   - pokemon2: [cantidad]                            |
|        - [0] {tipo, vida}                           |
|       - [...] {tipo, vida}                          |
|       - [cantidad] {tipo, vida}                     |
+-----------------------------------------------------+ 
*/
