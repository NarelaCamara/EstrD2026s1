#include <iostream>
using namespace std;

// 1 . Propósito: imprime n veces un string s.
void printN(int n, string s) {
    for(int i = 0; i < n; i++) {
        cout << s << endl;
    }
}

// 2 . Propósito: imprime los números desde n hasta 0, separados por saltos de línea.
void cuentaRegresiva(int n) {
    for(int i = n; i >= 0; i--) {
        cout << i << endl;
    }
}

// 3. Propósito: imprime los números de 0 hasta n, separados por saltos de línea.
void desdeCeroHastaN(int n){ 
    for(int i = 0; i <= n; i++) {
        cout << i << endl;
    }
}

// 4 . Propósito: realiza la multiplicación entre dos números (sin utilizar la operación * de C++)
int mult(int n, int m) { 
    int resultado = n;
    if (m==0) {
        return 0;
    }
    if (n>0)
    {
        for (int i = 0; i < n; i++) {
            resultado += m;
        }
    }
    if (n<0) 
    {
        for (int i = 0; i > n; i--) {
            resultado -= m;
        }
    } 
    return resultado; 
}

// 5 . Propósito: imprime los primeros n char del string s, separados por un salto de línea.
// Precondición: el string tiene al menos n char.
void primerosN(int n, string s) {
    if(n > s.length()) {
        cout << "Error: el string no tiene suficientes caracteres." << endl;
        return;
    }
    for(int i = 0; i < n; i++) {
        cout << s[i] << endl;
    }
}

// 6. Propósito: indica si un char c aparece en el string s.
bool pertenece(char c, string s) {
    while (!s.empty() && c!=s[0]) {
        s = s.substr(1);
    }
    return !s.empty();
}

// 7. Propósito: devuelve la cantidad de apariciones de un char c en el string s.
int apariciones(char c, string s) {
    int contador = 0;
    for(int i = 0; i < s.length(); i++) {
        if(s[i] == c) {
            contador++;
        }
    }
    return contador;
}
