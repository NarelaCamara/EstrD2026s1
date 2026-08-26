#include <iostream>
using namespace std;

typedef int Dir;
#define N 0;
#define E 1;
#define S 2;
#define W 3;

struct Coord {
    int f;
    int c;
};

struct EDgeonStr;

typedef EDgeonStr* EDgeon;

void mover(Dir d, EDgeon ed);
//Proposito: Mueve la heroina en la direccion dada, tener en cuenta que si en la celda destino hay un MONSTRUO, debe eliminarlo, 
//si en la celda destino hay un TRONCO y puede empujarlo debe hacerlo, y si no puede empujarlo, no debe moverse. Asi mismo, si la
//celda destino no existe, no hace nada. En resumen, la funcion debe ser total. 

Coord distanciaAlNE(EDgeon ed);
//Describe la distancia de la heroina hasta la esquina Norte y Este. En la coordenada f se indica la distancia en filas y en c la distancia en columnas.

bool enLaEscalera(EDgeon ed);
//Indica si la heroina esta en la misma celda que la escalera.

bool sinMonstruos(EDgeon ed);
//Indica si el nivel esta libre de monstruos.