#include <iostream>
using namespace std;
#include "Par.cpp"

// Ejercicio 2

// 1. // Precondición: c1 < c2
// proposito: Muestra en pantalla el valor de ese string
// costo: constante
// No se puede hacer mas eficiente
void printFromTo(char c1, char c2)
{
    for (int i = 0; c1 + i <= c2; i++)
    {
        cout << c1 + i << ", ";
    }
    cout << endl;
};

// 2. // Precondición: n >= 0
// proposito: Es factorial de n.
// costo: constante
// No se puede hacer mas eficiente
int fc(int n)
{
    int x = 1;
    while (n > 0)
    {
        x = x * n;
        n--;
    }
    return x;
};

// 3. // Precondición: n <= m
// proposito: Es la sumatioria de n.
// costo: Lineal n
int ft(int n, int m)
{
    if (n == m)
    {
        return n;
    }
    return n + ft(n + 1, m);
};

// una forma mas eficiente
//  costo: constante
int ftV2(int n, int m)
{
    int x = n;
    while (n != m)
    {
        n++;
        x = x + n;
    }
    return x;
};

// Ejercicio 4

// iterativa
void printNI(int n, string s)
{

    while (n != 0)
    {
        cout << s;
        n--;
    }
};
// recursiva
void printNR(int n, string s)
{

    if (n != 0)
    {
        cout << s;
        printNR(n - 1, s);
    }
}

void printN(int n, string s)
{
    cout << " Iterativa ";
    printNI(n, s);
    cout << " Recursiva ";
    printNR(n, s);
}

void cuentaRegresivaI(int n);
void cuentaRegresivaR(int n);

void cuentaRegresiva(int n)
{
    cout << " Iterativa ";
    cuentaRegresivaI(n);
    cout << " Recursiva ";
    cuentaRegresivaR(n);
}

void cuentaRegresivaI(int n)
{
    while (n > 0)
    {
        cout << n << " ";
        n--;
    }
}

void cuentaRegresivaR(int n)
{
    if (n > 0)
    {
        cout << n << " ";
        cuentaRegresivaR(n - 1);
    }
}

//
void desdeCeroHastaN(int n)
{
    cout << " Iterativa ";
    desdeCeroHastaNI(n);
    cout << " Recursiva ";
    desdeCeroHastaNR(n, 0);
}

void desdeCeroHastaNI(int n)
{
    int i = 0;
    while (n > i)
    {
        cout << i << " ";
        i++;
    }
}

void desdeCeroHastaNR(int n, int i)
{
    if (n > i)
    {
        cout << i << " ";
        desdeCeroHastaNR(n, i + 1);
    }
}

int main()
{
    // Ejercicio 1
    cout << "Ejercicio 1" << endl;

    // 1. Ejercicio
    int x_e1 = 0;       /* Memoria -> almacena 16 bites del numero CERO  */
    int y_e1 = 6;       /* Memoria -> almacena 16 bites del numero DOS  */
    x_e1 = x_e1 + y_e1; /* Memoria -> almacena 16 bites del numero DOS  */
    cout << y_e1 << endl;
    cout << x_e1 << endl;

    // 2. Ejercicio
    int x_e2 = 0; /* Memoria -> almacena 16 bites del numero CERO  */
    int y_e2 = 0; /* Memoria -> almacena 16 bites del numero CERO  */
    while (y_e2 < 5)
    {
        x_e2 += y_e2;
        y_e2++;
    }
    cout << x_e2 << endl;
    cout << y_e2 << endl;

    // 3. Ejercicio
    int y = 10;    /* Memoria -> almacena 16 bites del numero CERO  */
    bool b = true; /* Memoria -> almacena 16 bites del booleano TRUE  */
    while (b)
    {
        y++;
        b = !b;
    }
    cout << b << endl;
    cout << y << endl;

    // Ejercicio 2
    cout << "Ejercicio 2" << endl;

    // Ejemplo de uso
    printFromTo('a', 'c');

    cout << fc(5)
         << endl;
    cout << ft(5, 7)
         << endl;

    // Ejercicio 3

    cout << "Ejercicio 3" << endl;
    Par par = consPar(3, 4);
    cout << "consPar(3, 4): " << par.x << "," << par.y << endl;
    cout << "fst(consPar(3, 4)): " << fst(par) << endl;
    cout << "snd(consPar(3, 4)): " << snd(par) << endl;
    cout << "maxDelPar(consPar(3, 4)): " << maxDelPar(par) << endl;
    cout << "swap(consPar(3, 4)): " << swap(par).x << "," << swap(par).y << endl;
    cout << "divisionYResto(10, 3): " << divisionYResto(10, 3).x << "," << divisionYResto(10, 3).y << endl;

    // Ejercicio 4
    cout << "Ejercicio 4" << endl;

    // Propósito: imprime n veces un string s.
    printN(4, "A");
    cout << endl;

    //  Propósito : imprime los números desde n hasta 0, separados p or saltos de línea.3.
    cuentaRegresiva(10);
    cout << endl;

    //  Propósito : imprime los números de 0 hasta n, separados p or saltos de línea.4.
    desdeCeroHastaN(6);
    cout << endl;

    // int mult(int n, int m) {};
    // Propósito : realiza la multiplicación entre dos números(sin utilizar la op eración * de C++) .5.

    // void primerosN(int n, string s) {};
    // Propósito : imprime los primeros n char del string s, separados p or un salto de línea.Precondición : el string tiene al menos n char .6.

    // bool pertenece(char c, string s) {};
    //  Prop ósito : indica si un char c aparece en el string s.7.

    // int apariciones(char c, string s) {};
    //  Prop ósito : devuelve la cantidad de apariciones de un char c en el string s.
}
