#include <iostream>
using namespace std;

int main()
{

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
}

// 1. // Precondición: c1 < c2
void printFromTo(char c1, char c2)
{
    for (int i = 0; c1 + i <= c2; i++)
    {
        cout << c1 + i << ", ";
    }
    cout << endl;
}

// 2. // Precondición: n >= 0
int fc(int n)
{
    int x = 1;
    while (n > 0)
    {
        x = x * n;
        n--;
    }
    return x;
}

// 3. // Precondición: n <= m
int ft(int n, int m)
{
    if (n == m)
    {
        return n;
    }
    return n + ft(n + 1, m);
}