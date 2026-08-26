#include <iostream>
using namespace std;

// Propósito: imprimir los carácteres entre los carácteres dados inclusive. 
// Precondición: c1 < c2
void printFromTo(char c1, char c2) {
   for(int i = 0; c1 + i <= c2; i++) {
       cout << c1 + i << ", ";
   }
   cout << endl;
}
// la función 'printFromTo' utiliza un solo frame de memoria,
// que tiene 3 espacios de memmoria, uno para 'c1', otro para 'c2' y otro para 'i', 
// sobreescribiendo 'i' durante el llamado del 'for'.
// al sumar un char y un int, el compilador pasa el char a ascii y le suma ese int.

void printFromTo2(char c1, char c2) {
    while (c1 < c2) {
        cout << c1 << ", "; c1++;
    }
    cout << c2 << endl;
}
// la función 'printFromTo2' utiliza un solo frame de memoria,
// que tiene 2 espacios de memmoria, uno para 'c1' y otro para 'c2'
// sobreescribiendo 'c1' durante el llamado del 'while'.

// =================================================================

// Propósito: devuelve el factorial del número dado por parámetro.
// Precondición: n >= 0
int fc(int n) {
    int x = 1;
    while(n > 0) {
        x = x * n;
        n--;
    }
    return x;
}
// la función 'fc' utiliza un solo frame de memoria,
// que tiene dos espacios de memmoria, uno para 'n' y otro para 'x', sobreescribiendo los datos
// almacenados en esos espacios durante el llamado al 'while'.

// =================================================================

// Propósito: retornar la sumatoria de los números entre los dos números dados.
// Precondición: n <= m
int ft(int n, int m) {
    if (n == m) {
        return n;
    }
    return n + ft(n+1, m);
}
// la función 'ft' utiliza un solo frame de memoria,
// que tiene dos espacios de memmoria, uno para 'n' y otro para 'm',
// sobreescribiendo el valor en el espacio de 'n' durante el llamado iterativo.




int main() {
    char char1 = 'a';
    char char2 = 'c';
    printFromTo(char1, char2); // 97, 98, 99,
    printFromTo2(char1, char2); // a, b, c
    
    char char3 = 'b';
    char char4 = 'j';
    printFromTo(char3, char4); // 98, 99, 100, 101, 102, 103, 104, 105, 106,
    printFromTo2(char3, char4); // b, c, d, e, f, g, h, i, j


    cout << fc(4) << endl; // imprime 24 
    cout << fc(5) << endl; // imprime 120 
    cout << fc(1) << endl; // imprime 1
    cout << fc(0) << endl; // imprime 1

    cout << ft(4,10) << endl;   // imprime 49
    cout << ft(4,5) << endl;   // imprime 9
    cout << ft(3,3) << endl;   // imprime 3
}