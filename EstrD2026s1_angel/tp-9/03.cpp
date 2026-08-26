#include <iostream>
#include "03-Par.h"
using namespace std;

int showPar(Par p) {
    cout << "(" << p.x << "," << p.y << ")" << endl;
}


Par par1 = consPar(200, 200);
Par par2 = divisionYResto(10,3);

int main() {
    cout << showPar(par2) << endl;
}