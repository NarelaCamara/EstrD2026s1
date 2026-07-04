
#include <iostream>
#include "Tripulante.h"
#include "Set.h"

int tripulate_test() {
    Tripulante tripulante = crearT("Juan", 3);

    assert(nombre(tripulante) == "Juan");
    assert(rango(tripulante) == 3);

    cout << "Nombre: " << nombre(tripulante) << endl;
    cout << "rango: " << rango(tripulante) << endl; 

    asignarS("Sector A", tripulante);
    asignarS("Sector B", tripulante);

    assert(sectoresT(tripulante).size() == 2);
    cout << "Sectores asignados: ";
    showSet(sectoresT(tripulante));
    return 0;
}