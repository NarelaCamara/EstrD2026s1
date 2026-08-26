#include <iostream>
using namespace std;

typedef string TipoDePokemon;

struct PokeSt;
  
typedef struct PokeSt* Pokemon;

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
Pokemon consPokemon(TipoDePokemon tipo);
// Dado un tipo devuelve un pokémon con 100 % de energía.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
TipoDePokemon tipoDePokemon(Pokemon p);
// Devuelve el tipo de un pokémon.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
int energia(Pokemon p);
// Devuelve el porcentaje de energía.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
void perderEnergia(int energia, Pokemon p);
// Le resta energía al pokémon.

// Eficiencia - Tiempo: O(1) - Memoria: O(1)
bool superaA(Pokemon p1, Pokemon p2);
// Dados dos pokémon indica si el primero, en base al tipo, es superior al segundo. Agua supera
// a fuego, fuego a planta y planta a agua. Y cualquier otro caso es falso.


