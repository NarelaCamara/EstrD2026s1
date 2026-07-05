
#include <iostream>
#include "Tripulante.h"
#include "../set/Set.h"

///costo: constante O(1)
Tripulante crearT( Nombre n, Rango r){
    TripulanteSt* t = new TripulanteSt;
    t->sectores = emptyS();
    t->nombre = n;
    t->rango = r;
    return t;
}

//costo: O(n) donde n es la cantidad de sectores asignados al tripulante
void asignarS(SectorId s, Tripulante t){
    Set sectores = t->sectores;
    addS(s, sectores);
    t->sectores = sectores;
}

//costo: constante O(1)
Set sectoresT(Tripulante t){
    return t->sectores;
}

//costo: constante O(1)
Nombre nombre(Tripulante t){
    return t->nombre;
}

//Coasto: constante O(1)
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