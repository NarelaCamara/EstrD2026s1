#include <iostream>
using namespace std;

// 1. Ejercicio
int main() {
    int x = 0; /* Memoria -> almacena 16 bites del numero CERO  */
    int y = 8; /* Memoria -> almacena 16 bites del numero DOS  */
    x = x+y; /* Memoria -> almacena 16 bites del numero DOS  */
    cout << x << endl;
}



/**
1.
2. int main() {
int x = 0;
int y = 0;
while(y < 5) {
x += y;
y++;
}
}
3. int main() {
int y = 0;
bool b = true;
while(b) {
y++;
b = !b;
}
 */