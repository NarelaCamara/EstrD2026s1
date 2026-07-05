#include <iostream>
#include "Sector.h"
using namespace std;


//costo: constante O(1)
Sector crearS(SectorId sId){
    Sector s = new SectorSt;
    s->sectorId = sId;
    s->componentes = vector<Componente>();
    s->tripulantes = emptyS();
    return s;
};

//costo: constante O(1)
SectorId sectorId(Sector s){
    return s->sectorId;
};

//costo: constante O(1)
Componente[] componentesS (Sector s){
    return s->componentes;
};

//costo: constante O(1)
Set tripulantesS (Sector s){
    return s->tripulantes;
};

//costo: O(n) donde n es la cantidad de componentes del sector
void agregarC (Componente c, Sector s){
    Set componentes = s->componentes;
    componentes = addS(c, componentes);
    s->componentes = componentes;
};

//costo: O(n) donde n es la cantidad de tripulantes del sector
void agregarT (Tripulant t, Sector s){
    Set tripulantes = s->tripulantes;
    tripulantes = addS(t, tripulantes);
    s->tripulantes = tripulantes;
};
