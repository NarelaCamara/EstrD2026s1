#include <iostream>
using namespace std;

typedef string TipoDePokemon;

struct PokeSt
{
    TipoDePokemon tipo;
    int vida;
};

typedef PokeSt *Pokemon;

// Dicho esto, implementar la siguiente interfaz de P okemon:
Pokemon consPokemon(TipoDePokemon tipo);
// Dado un tip o devuelve un p okémon con 100 % de energía.
TipoDePokemon tipoDePokemon(Pokemon p);
// Devuelve el tip o de un p okémon.consEntrenador
int energia(Pokemon p);
// Devuelve el p orcenta je de energía.
void perderEnergia(int energia, Pokemon p);
// Le resta energía al p okémon.
bool superaA(Pokemon p1, Pokemon p2);
/*Dados dos p okémon indica si el primero, en base al tip o, es sup erior al segundo. Agua sup era
a fuego, fuego a planta y planta a agua. Y cualquier otro caso es falso.
Una vez hecho eso, implementar la siguiente interfaz de Entrenador:*/
