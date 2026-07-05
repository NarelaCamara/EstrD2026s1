#include "Set.h"

int testSet() {

    Set s = emptyS();
    std::cout << "Conjunto vacío: ";
    showSet(s);
    std::cout << std::endl;
    std::cout << "Agregando elementos al conjunto..." << std::endl;
    addS(5, s);
    addS(10, s);
    addS(5, s); // Intento de agregar un elemento duplicado
    addS(15, s);
    std::cout << "Conjunto después de agregar elementos: ";
    showSet(s);
    std::cout << std::endl;
    std::cout << "Pertenece 10 al conjunto? " << (belongsS(10, s) ? "Sí" : "No") << std::endl;
    std::cout << "Pertenece 20 al conjunto? " << (belongsS(20, s) ? "Sí" : "No") << std::endl;

    std::cout << "Eliminando el elemento 10 del conjunto..." << std::endl;
    RemoveS(10, s);
    std::cout << "Conjunto después de eliminar el elemento 10: ";
    showSet(s);

    std::cout << std::endl;

    isEmptyS(s) ? std::cout << "El conjunto está vacío." : std::cout << "El conjunto no está vacío.";
    std::cout << std::endl;

    std::cout << "El conjunto tiene: "  << sizeS(s) << std::endl;
    std::cout << std::endl;

    std::vector<int> list = setToList(s);
    std::cout << "Elementos del conjunto como lista: ";
    for (const auto& elem : list) {
        std::cout << elem << " ";
    }
    std::cout << std::endl;

    unionset s2 = emptyS();
    addS(20, s2);
    addS(30, s2);
    Set unionSet = unionS(s, s2);
    std::cout << "Conjunto resultante de la unión: ";
    showSet(unionSet);

    destroyS(s2);
    showSet(unionSet);
    destroyS(unionSet);

    std::cout << "=== Fin del ejemplo ===" << std::endl;

    return 0;
}