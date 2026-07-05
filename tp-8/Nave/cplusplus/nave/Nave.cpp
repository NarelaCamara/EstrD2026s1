#include <iostream>
#include "Nave.h"
#include "../map/Map.h"
#include "../set/Set.h"
#include "../maxHeap/MaxHeap.h"
using namespace std;


Nave construir (SectorId ss){
    NaveSt* n = new NaveSt;

    tripulantes = emptyM();
    sectores = emptyM();
    OrdRangoTripulantes = emptyH();

    n->tripulantes = tripulantes;
    n->sectores = sectores;
    n->OrdRangoTripulantes= OrdRangoTripulantes;
    return n;
};

void ingresarT(Nombre n, Rango r, Nave n){
    Tripulante t = crearT(n, r);
    assocM(n, t, n->tripulantes); 
    insertH(t, n->OrdRangoTripulantes);
};

Set sectoresAsignados (Nombre n, Nave n){
    Tripulante t = lookupM(n, n->tripulantes);

    if(t != nullptr){
       return sectoresT(t);
    }
    return emptyS();
};
 
pair<Set, vector<Componente>> datosDeSector(SectorId sId, Nave n){
    Sector s = lookupM(sId, n->sectores);
    if(s != nullptr){
        return make_pair(sectoresC(s), componentesC(s));
    }
    return make_pair(emptyS(), vector<Componente>());
};



Tripulante[] tripulantesN (Nave n, int cant){
    string[cant] keys = domM(n->tripulantes);
    int i = 0;
    while(i < cant){
        keys[i]= lookupM(n->tripulantes[i], n->tripulantes);
        i++;
    }
    return keys;
};

void agregarASector (Componentes[] cs, int cant, SectorId sId, Nave n){
    int i = 0;
    Sector s = lookupM(sId, n->sectores);
    while(i < cant){
        agregarC(cs[i], s);
        i++;
    }
    delete s;
    assocM(sId, s, n->sectores);
};

void asignarASector(Nombre n, SectorId sId, Nave n){
    Sector s = lookupM(sId, n->sectores);
    agregarT(n, s);
    assocM(sId, s, n->sectores);
    delete s;
};
