#include <iostream>
#include "Pokemon.h"
using namespace std;

/*costo es constante, un frame*/
// Dado un tipo devuelve un pokémon con 100 % de energía.
Pokemon consPokemon(TipoDePokemon tipo)
{
    PokeSt *p = new PokeSt;
    p->tipo = tipo;
    p->vida = 100;
    return p;
};
/*
STACK
+-----------------------------------------------------+
| consPokemon frame                                  |         
|                                                     |
|   - p : PokeSt --> HEAP {tipo, vida}   
    - tipo: string
|                                                     |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
|  p: PokeSt { tipo, vida }                     |
+-----------------------------------------------------+ 
*/

/*costo es constante, un frame*/
// Devuelve el tip o de un p okémon.
TipoDePokemon tipoDePokemon(Pokemon p)
{
    return p->tipo;
};

/*
STACK
+-----------------------------------------------------+
| consPokemon frame                                  |         
|                                                     |
|   - p : PokeSt --> HEAP {tipo, vida}   
|                                                     |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
|  p: PokeSt { tipo, vida }                     |
+-----------------------------------------------------+ 
*/


// Devuelve el porcenta je de energía.
int energia(Pokemon p)
{
    return p->vida;
};
/*
STACK
+-----------------------------------------------------+
| consPokemon frame                                   |         
|                                                     |
|   - p : PokeSt --> HEAP {tipo, vida}                |  
|                                                     |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
|  p: PokeSt { tipo, vida }                     |
+-----------------------------------------------------+ 
*/


// Le resta energía al p okémon.
void perderEnergia(int energia, Pokemon p)
{
    int newEnergia = p->vida - energia;
    p->vida = newEnergia > 0 ? newEnergia : 0;
};
/*
STACK
+-----------------------------------------------------+
| perderEnergia frame                                 |
|   - p : PokeSt --> HEAP {tipo, vida}                |
|   - energia -- int  
    - newEnergia -- int                               |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
|  p: PokeSt { tipo, vida }                           |
+-----------------------------------------------------+ 
*/



/*Dados dos pokémon indica si el primero, en base al tipo, es sup erior al segundo. Agua sup era
a fuego, fuego a planta y planta a agua. Y cualquier otro caso es falso.
Una vez hecho eso, implementar la siguiente interfaz de Entrenador:*/
bool superaA(Pokemon p1, Pokemon p2)
{
    return (p1->tipo == "AGUA" && p2->tipo == "FUEGO") || (p1->tipo == "FUEGO" && p2->tipo == "PLANTA") || (p1->tipo == "PLANTA" && p2->tipo == "AGUA");
};
/*
STACK
+-----------------------------------------------------+
| perderEnergia frame                                 |
|   - p1 : PokeSt --> HEAP {tipo, vida}                |
|   - p2 : PokeSt --> HEAP {tipo, vida}                |
+-----------------------------------------------------+

HEAP
+-----------------------------------------------------+
|  p1: PokeSt { tipo, vida }                           |
|  p2: PokeSt { tipo, vida }                           |
+-----------------------------------------------------+ 
*/
