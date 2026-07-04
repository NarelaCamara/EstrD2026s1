
#include <iostream>
#include "Tripulante.h"
#include "Set.h"

Tripulante creatT (Nombre n, Rango r){
    TripulanteSt* t = new  TripulanteSt;
    t->sectores = emptyS();
    t->nombre= n;
    t->rango= r;
    return t;
}

void asignarS (SectorId s, Tripulante t){
    addS(s, t->sectores);
};

Set SectoresT (Tripulante t){
    return t->sectores;
};

Nombre nombre (Tripulante t){
    return t->nombre;
};

Rango rango (Tripulante t){
    return t->rango;
};