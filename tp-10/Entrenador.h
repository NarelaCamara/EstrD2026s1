#include <iostream>
#include "Pokemon.h"
using namespace std;

struct EntrenadorSt
{
    string nombre;
    Pokemon *pokemon;
    int cantPokemon;
};

typedef EntrenadorSt* Entrenador;

Entrenador consEntrenador(string nombre, int cantidad, Pokemon *pokemon);
/*Dado un nombre, una cantidad de p okémon, y un array de p okémon de ese tamaño, devuelve
un entrenador.*/
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