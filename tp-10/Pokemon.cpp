#include <iostream>
#include "Pokemon.h"
using namespace std;

// Dado un tipo devuelve un pokémon con 100 % de energía.
Pokemon consPokemon(TipoDePokemon tipo)
{
    PokeSt *p = new PokeSt;
    p->tipo = tipo;
    p->vida = 100;
    return p;
};

// Devuelve el tip o de un p okémon.
TipoDePokemon tipoDePokemon(Pokemon p)
{
    return p->tipo;
};

// Devuelve el porcenta je de energía.
int energia(Pokemon p)
{
    return p->vida;
};

// Le resta energía al p okémon.
void perderEnergia(int energia, Pokemon p)
{
    int newEnergia = p->vida - energia;
    p->vida = newEnergia > 0 ? newEnergia : 0;
};

/*Dados dos pokémon indica si el primero, en base al tipo, es sup erior al segundo. Agua sup era
a fuego, fuego a planta y planta a agua. Y cualquier otro caso es falso.
Una vez hecho eso, implementar la siguiente interfaz de Entrenador:*/
bool superaA(Pokemon p1, Pokemon p2)
{
    return (p1->tipo == "AGUA" && p2->tipo == "FUEGO") || (p1->tipo == "FUEGO" && p2->tipo == "PLANTA") || (p1->tipo == "PLANTA" && p2->tipo == "AGUA");
};
