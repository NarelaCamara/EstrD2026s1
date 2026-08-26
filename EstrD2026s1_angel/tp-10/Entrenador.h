#include <iostream>
#include "Pokemon.h"
using namespace std;

struct EntrenadorSt;
  
typedef struct EntrenadorSt* Entrenador;

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
Entrenador consEntrenador(string nombre, int cantidad, Pokemon* pokemon);
// Dado un nombre, una cantidad de pokémon, y un array de pokémon de ese tamaño, devuelve un entrenador.
// PRECOND.: la cantidad dada debe corresponderse con la cantidad de pokemons del array dado.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
string nombreDeEntrenador(Entrenador e);
// Devuelve el nombre del entrenador.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
int cantidadDePokemon(Entrenador e);
// Devuelve la cantidad de pokémon que posee el entrenador.

// Eficiencia - Tiempo: O(P), siendo P la cantidad de Pokemons del entrenador dado.
//              Memoria: O(1)
int cantidadDePokemonDe(TipoDePokemon tipo, Entrenador e);
// Devuelve la cantidad de pokémon de determinado tipo que posee el entrenador.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
Pokemon pokemonNro(int i, Entrenador e);
// Devuelve el pokémon número i de los pokémon del entrenador.
// Precondición: existen al menos i − 1 pokémon.

// Eficiencia - Tiempo: O(P * P') siendo P la cant de pokemons del entrenador e1 y P' la cantidad de pokemons del entrenador e2.
//              Memoria: O(1)
bool leGanaATodos(Entrenador e1, Entrenador e2);
// Dados dos entrenadores, indica si, para cada pokémon del segundo entrenador, el primero
// posee al menos un pokémon que le gane.