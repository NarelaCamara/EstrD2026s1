#include <iostream>
#include "05-Fraccion.h"
using namespace std;

int showF(Fraccion f) {
    cout << f.numerador << "|" << f.denominador << endl;
}

Fraccion f1 = consFraccion(6,4);
Fraccion f2 = consFraccion(9,5);
Fraccion f3 = consFraccion(100,90);

Fraccion f4 = sumF(f1,f2);

Fraccion f5 = consFraccion(1000,999);
Fraccion f6 = consFraccion(60,24);
Fraccion f7 = consFraccion(17,13);
Fraccion f8 = consFraccion(3,2);
Fraccion f9 = consFraccion(1,1);
Fraccion f10 = consFraccion(2,1);
Fraccion f11 = consFraccion(1,2);
Fraccion f12 = consFraccion(4,4);
Fraccion f13 = consFraccion(5,5);
Fraccion f14 = consFraccion(0,0);

void showFSim(Fraccion f){
    cout << f.numerador << "|" << f.denominador << "-->" << simplificada(f).numerador << "|" << simplificada(f).denominador << endl;
}



int main() {

    showFSim(f1);
    showFSim(f2);
    showFSim(f3);
    showFSim(f5);
    showFSim(f6);
    showFSim(f7);
    showFSim(f8);
    showFSim(f9);
    showFSim(f10);
    showFSim(f11);
    showFSim(f12);
    showFSim(f13);
    // cout << division(f3) << endl;
}