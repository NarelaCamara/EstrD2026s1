
#include <iostream>
#include "Tripulante.h"
#include "../set/Set.h"

Tripulante crearT( Nombre n, Rango r){
    TripulanteSt* t = new TripulanteSt;
    t->sectores = emptyS();
    t->nombre = n;
    t->rango = r;
    return t;
}

void asignarS(SectorId s, Tripulante t){
    addS(s, t->sectores);
}

Set sectoresT(Tripulante t){
    return t->sectores;
}

Nombre nombre(Tripulante t){
    return t->nombre;
}

Rango rango(Tripulante t){
    return t->rango;
}

int testTripulante() {

    std::cout << "=== Ejemplo de uso de Tripulante ===" << std::endl;
    Tripulante tripulante = crearT("Juan", 3);


    std::cout << "Nombre: " << nombre(tripulante) << std::endl;
    std::cout << "Rango: " << rango(tripulante) << std::endl;

    asignarS(1, tripulante);
    asignarS(2, tripulante);
    std::cout << "Sectores asignados size: " << sizeS(sectoresT(tripulante)) << std::endl;

    std::cout << "Sectores asignados: ";
    showSet(sectoresT(tripulante));
    std::cout << "=== Fin del ejemplo ===" << std::endl;
    return 0;
}