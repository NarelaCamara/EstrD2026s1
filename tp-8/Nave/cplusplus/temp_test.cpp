#include "maxHeap/MaxHeap.h"
#include <iostream>
int main(){
    MaxHeap h = emptyH();
    Tripulante a = crearT("A", 3);
    Tripulante b = crearT("B", 8);
    Tripulante c = crearT("C", 5);
    insertH(a, h);
    insertH(b, h);
    insertH(c, h);
    Tripulante mayor = maxH(h);
    std::cout << nombre(mayor) << " " << rango(mayor) << std::endl;
    return 0;
}
