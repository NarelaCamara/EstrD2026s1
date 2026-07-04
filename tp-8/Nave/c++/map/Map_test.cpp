#include "Map.h"
#include <iostream>
#include <vector>

int testMap() {
    std::cout << "=== Ejemplo de uso de Map ===" << std::endl;

    Map m = emptyM();
    std::cout << "1) Mapa vacio: ";
    showMap(m);
    std::cout << std::endl;

    std::cout << "2) assocM('uno', '1')" << std::endl;
    assocM("uno", "1", m);
    showMap(m);
    std::cout << std::endl;

    std::cout << "3) assocM('dos', '2')" << std::endl;
    assocM("dos", "2", m);
    showMap(m);
    std::cout << std::endl;

     std::cout << "4) assocM('tres', '3')" << std::endl;
    assocM("tres", "3", m);
    showMap(m);
    std::cout << std::endl;

    std::cout << "5) lookupM('uno') -> " << lookupM("uno", m) << std::endl;
    std::cout << "6) lookupM('cuatro') -> " << lookupM("cuatro", m) << std::endl;

    std::cout << "7) assocM('uno', '10') para reemplazar el valor" << std::endl;
    assocM("uno", "10", m);
    showMap(m);
    std::cout << std::endl;

    std::cout << "8) domM(m) -> ";
    String[] keys = domM(m);
    for (size_t i = 0; i < keys.size(); ++i) {
        std::cout << keys[i];
        if (i + 1 < keys.size()) {
            std::cout << ", ";
        }
    }
    std::cout << std::endl;

    std::cout << "9) deleteM('dos')" << std::endl;
    deleteM("dos", m);
    showMap(m);
    std::cout << std::endl;

    std::cout << "10) lookupM('dos') despues de borrar -> " << lookupM("dos", m) << std::endl;
    std::cout << "=== Fin del ejemplo ===" << std::endl;

    return 0;
}
