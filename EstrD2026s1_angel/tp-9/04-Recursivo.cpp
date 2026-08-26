#include <iostream>
using namespace std;

// 1 . Propósito: imprime n veces un string s.
void printN(int n, string s) {
    cout << s << endl;
    printN(n-1, s);
}

// 2 . Propósito: imprime los números desde n hasta 0, separados por saltos de línea.
void cuentaRegresiva(int n) {
    cout << n << endl;
    if(n > 0) {
        cuentaRegresiva(n-1);
    }
}

// 3. Propósito: imprime los números de 0 hasta n, separados por saltos de línea.
void desdeCeroHastaN(int n){ 
    if(n==0){
        cout << 0 << endl;
    } else {
        cout << n << endl;
        desdeCeroHastaN(n-1);
    }
}

// 4 . Propósito: realiza la multiplicación entre dos números (sin utilizar la operación * de C++)
int mult(int n, int m) { 
    if (n==0 || m==0) { return 0; }
    if (n<0)
    { 
        return -(m + mult(abs(n)-1, m));
    } else
    {
        return m + mult(n-1, m);
    }
}  

// 5 . Propósito: imprime los primeros n char del string s, separados por un salto de línea.
// Precondición: el string tiene al menos n char.
void primerosN(int n, string s) {
    if(n>s.length()) {
        cout << "Error: el string no tiene suficientes caracteres." << endl;
    } else if (n > 0) {
        cout << s[0] << endl;
        primerosN(n-1, s.substr(1));
    }
}

// 6. Propósito: indica si un char c aparece en el string s.
bool pertenece(char c, string s) {
     return c == s[0] || pertenece(c, s.substr(1));
}

// 7. Propósito: devuelve la cantidad de apariciones de un char c en el string s.
int apariciones(char c, string s) {
    if (s.empty())
    {
        return 0;
    } 
    if (s[0] == c)
    {
        return 1 + apariciones(c, s.substr(1));
    }
    else 
    {
        return apariciones(c, s.substr(1));
    }
}

int main () {
    // printN(5, "hola");
    // cuentaRegresiva(5);
    // desdeCeroHastaN(10);
    // cout << mult(0,10) << endl;
    // cout << mult(10,0) << endl;
    // cout << mult(-10,4) << endl;
    // cout << mult(4,-10) << endl;
    // cout << mult(20,10) << endl;
    // cout << mult(-10,-20) << endl;
    // primerosN(100, "Hola, mundo!");
    // if (pertenece('p', "hooiiiiiiiiip")) 
    //       { cout << "TRUE" << endl; }
    //     else { cout << "FALSE" << endl;}
    // cout << apariciones('b', "aaaaa") << endl;
}