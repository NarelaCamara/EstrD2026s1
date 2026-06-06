#ifndef POKEMON_H
#define POKEMON_H

#include <iostream>
#include <string>

typedef std::string TipoDePokemon;

struct PokeSt
{
    TipoDePokemon tipo;
    int vida;
};

typedef PokeSt *Pokemon;

// Dicho esto, implementar la siguiente interfaz de Pokemon:
Pokemon consPokemon(TipoDePokemon tipo);
// Dado un tipo devuelve un pokemon con 100 % de energía.
TipoDePokemon tipoDePokemon(Pokemon p);
// Devuelve el tipo de un pokemon.
int energia(Pokemon p);
// Devuelve el porcentaje de energía.
void perderEnergia(int energia, Pokemon p);
// Le resta energía al pokemon.
bool superaA(Pokemon p1, Pokemon p2);
/* Dados dos pokemon indica si el primero, en base al tipo, es superior al segundo. Agua supera
   a fuego, fuego a planta y planta a agua. Y cualquier otro caso es falso.
   Una vez hecho eso, implementar la siguiente interfaz de Entrenador: */

#endif // POKEMON_H
