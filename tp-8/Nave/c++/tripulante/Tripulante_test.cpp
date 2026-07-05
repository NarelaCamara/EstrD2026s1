
#include <iostream>
#include <cassert>
#include "Tripulante.h"
#include "../set/Set.h"

int tripulante_test() {
    Tripulante tripulante = crearT("Juan", 3);

    assert(nombre(tripulante) == "Juan");
    assert(rango(tripulante) == 3);

    std::cout << "Nombre: " << nombre(tripulante) << std::endl;
    std::cout << "Rango: " << rango(tripulante) << std::endl;

    asignarS(1, tripulante);
    asignarS(2, tripulante);

    assert(sizeS(sectoresT(tripulante)) == 2);
    std::cout << "Sectores asignados: ";
    showSet(sectoresT(tripulante));
    std::cout << "=== Fin del ejemplo ===" << std::endl;
    return 0;
}