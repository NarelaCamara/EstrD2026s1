#include <iostream>
#include "EDgeon.h"
using namespace std;

typedef int Objeto;
#define NADA 0;
#define TRONCO 1;
#define MONSTRUO 2;

struct CeldaStr {
    Objeto c;
    CeldaStr** ls; //arreglo de celdas lindantes en cada una de las 4 direcciones. [0 "celda al Norte",1 "celda al Este",2 "celda al Sur",3 "celda al Oeste"]
};

typedef CeldaStr* Celda;

struct EDgeonStr {
    Celda h; //Celda de la heroina 
    Celda e; //Celda de la escalera 
};

//El EDgeon es el tablero, para completar el juego una heroina tiene que llegar a la escalera, es decir estar en la misma Celda que
//la escalera, para esto si hay un TRONCO debe poder moverlo, es decir, en direccion hacia donde lo mueve tiene que haber una celda con NADA
//si hay un MONSTRUO, otro TRONCO o la ESCALERA, no puede moverlo. Para matar al MONSTRUO solo hace falta que se posicione en la misma Celda.

/*
INV. REP.:
    *En EDgeon las celdas h y e no pueden ser NULL.
    *El objeto en una celda cualquiera del EDgeon no puede ser NULL.
    *La lista de celdas lindantes de cada celda en EDgeon no puede ser NULL.
    *La Celda de la Heroina en EDgeon debe tener un camino valido hacia las celdas lindantes.
    *La Celda de la Escalera debe poder ser alcanzada por la Heroina, ese decir, debe existir un camino valido desde la Heroina hasta la Escalera.
    *Todas las celdas en las listas de celdas lindantes deben pertenecer al mismo tablero EDgeon. 
*/

bool puedoMoverTronco(Celda celda, Dir d, Celda celdaEscalera){
    return celda->ls[d] != NULL && celda->ls[d]->c == 0 && 
           celda->ls[d]->c != 1 && celda->ls[d]->c != 2 &&
           celda->ls[d] != celdaEscalera;
}

void mover(Dir d, EDgeon ed){
    //Proposito: Mueve la heroina en la direccion dada, tener en cuenta que si en la celda destino hay un MONSTRUO, debe eliminarlo, 
    //si en la celda destino hay un TRONCO y puede empujarlo debe hacerlo, y si no puede empujarlo, no debe moverse. Asi mismo, si la
    //celda destino no existe, no hace nada. En resumen, la funcion debe ser total. 
    if(ed->h == NULL || ed->e == NULL){
        cerr<<"No deberia pasar";
        exit(1);
    }
    Celda celdaHeroina = ed->h;
    CeldaStr** lindantes = celdaHeroina->ls;
    if(lindantes != NULL && lindantes[d]->c != NULL){
        if(lindantes[d] == NULL){

        }
        if(lindantes[d]->c == 0){
            ed->h = lindantes[d];
        }
        if(lindantes[d]->c == 1 && puedoMoverTronco(lindantes[d], d, ed->e)){
            ed->h = lindantes[d];
        }
        if(lindantes[d]->c == 2){
            ed->h = lindantes[d];
        }
    }
    else{
        cerr<<"No deberia pasar";
        exit(1);
    }
}

Coord distanciaAlNE(EDgeon ed){
    //Describe la distancia de la heroina hasta la esquina Norte y Este. En la coordenada f se indica la distancia en filas y en c la distancia en columnas.
    if(ed->h == NULL || ed->e == NULL){
        cerr<<"No deberia pasar";
        exit(1);
    }
    Coord coordenadas;
    coordenadas.f = 0;
    coordenadas.c = 0;
    Celda celdaHeroina = ed->h;
    CeldaStr** lindantes = celdaHeroina->ls;
    if(lindantes != NULL){
        while(lindantes[0] != NULL){
            coordenadas.f ++;
            lindantes = lindantes[0]->ls;
        }
        while(lindantes[1] != NULL){
            coordenadas.c ++;
            lindantes = lindantes[1]->ls;
        }
    }
    else{
        cerr<<"No deberia pasar";
        exit(1);
    }
    return coordenadas;
}

bool enLaEscalera(EDgeon ed){
    //Indica si la heroina esta en la misma celda que la escalera.
    if(ed->h == NULL || ed->e == NULL){
        cerr<<"No deberia pasar";
        exit(1);
    }
    return ed->h == ed->e;
}

bool sinMonstruos(EDgeon ed){
    //Indica si el nivel esta libre de monstruos.
}

