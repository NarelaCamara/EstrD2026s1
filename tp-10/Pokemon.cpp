#include <iostream>
#include "Pokemon.h"
using namespace std;

/**
typedef string TipoDePokemon;

struct PokeSt
{
    TipoDePokemon tipo;
    int vida;
};

typedef PokeSt *Pokemon;

struct EntrenadorSt
{
    string nombre;
    Pokemon *pokemon;
    int cantPokemon;
};
typedef EntrenadorSt *Entrenador;
**/

// Dicho esto, implementar la siguiente interfaz de P okemon:
Pokemon consPokemon(TipoDePokemon tipo)
{
    PokeSt* p = new PokeSt;
    p->tipo = tipo;
    p->vida = 0;
    return p;
};
// Dado un tip o devuelve un pokémon con 100 % de energía.
TipoDePokemon tipoDePokemon(Pokemon p);
// Devuelve el tip o de un p okémon.
int energia(Pokemon p);
// Devuelve el p orcenta je de energía.
void perderEnergia(int energia, Pokemon p);
// Le resta energía al p okémon.
bool superaA(Pokemon p1, Pokemon p2);
/*Dados dos p okémon indica si el primero, en base al tip o, es sup erior al segundo. Agua sup era
a fuego, fuego a planta y planta a agua. Y cualquier otro caso es falso.
Una vez hecho eso, implementar la siguiente interfaz de Entrenador:*/
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