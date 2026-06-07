#include <iostream>
#include "Pokemon.h"
#include "Entrenador.h"
using namespace std;

// Forward declaration
bool superaATodos(Pokemon p, Entrenador e2);

/*Dado un nombre, una cantidad de pokémon, y un array de pokémon de ese tamaño, devuelve
un entrenador.*/
Entrenador consEntrenador(string nombre, int cantidad, Pokemon *pokemon)
{
    EntrenadorSt *e = new EntrenadorSt;
    e->nombre = nombre;
    e->cantPokemon = cantidad;
    for (int i = 0; i < cantidad; ++i)
    {
        e->pokemon[i] = pokemon[i];
    }
    return *e;
};

// Devuelve el nombre del entrenador.
string nombreDeEntrenador(Entrenador e)
{
    return e.nombre;
};

// Devuelve la cantidad de p okémon que p osee el entrenador.
int cantidadDePokemon(Entrenador e)
{
    return e.cantPokemon;
};

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