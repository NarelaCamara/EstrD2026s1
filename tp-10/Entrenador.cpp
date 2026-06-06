#include <iostream>
#include "Pokemon.h"
#include "Entrenador.h"
using namespace std;

/*Dado un nombre, una cantidad de pokémon, y un array de pokémon de ese tamaño, devuelve
un entrenador.*/
Entrenador consEntrenador(string nombre, int cantidad, Pokemon *pokemon)
{
    EntrenadorSt *e = new EntrenadorSt;
    e->nombre = nombre;
    e->cantPokemon = cantidad;
    for (int i = 0; i < cantidad; ++i) {
        e->pokemon[i] = pokemon[i];
    }
    return *e;
};

string nombreDeEntrenador(Entrenador e);
// Devuelve el nombre del entrenador.
int cantidadDePokemon(Entrenador e);
// Devuelve la cantidad de p okémon que p osee el entrenador.
int cantidadDePokemonDe(TipoDePokemon tipo, Entrenador e);
// Devuelve la cantidad de p okémon de determinado tip o que p osee el entrenador.
Pokemon pokemonNro(int i, Entrenador e);
// Devuelve el p okémon número i de los p okémon del entrenador.
// Precondición: existen al menos i −1 p okémon.
bool leGanaATodos(Entrenador e1, Entrenador e2);
// Dados dos entrenadores, indica si, para cada p okémon del segundo entrenador, el primero
// p osee al menos un p okémon que le gane