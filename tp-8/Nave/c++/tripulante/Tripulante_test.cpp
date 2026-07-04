
#include <iostream>
#include "Tripulante.h"
#include "Set.h"

int tripulate_test() {
    Tripulante tripulante("Juan", 30, "Piloto");
    assert(tripulante.getNombre() == "Juan");
    assert(tripulante.getEdad() == 30);
    assert(tripulante.getRol() == "Piloto");

    cout << "Nombre: " << tripulante.getNombre() << endl;
    cout << "Edad: " << tripulante.getEdad() << endl;
    cout << "Rol: " << tripulante.getRol() << endl; 

    asignarS("Sector A", tripulante);
    asignarS("Sector B", tripulante);
    cout << "Sectores asignados: ";
    showSet(sectores);
    
    return 0;
}