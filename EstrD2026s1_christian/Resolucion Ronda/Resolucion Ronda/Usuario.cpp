#include <iostream>
#include "Ronda.cpp"
using namespace std;

int* toArray(Ronda ronda){
    int n = length(ronda);
    int* lista = new int[n];
    for(int i = 0; i < n; i++){
        lista[i] = current(ronda);
        remove(ronda);
    }
    return lista;
}

Ronda fromArray(int len, int* arr){
    Ronda ronda = mkRonda();
    for(int i = len; i >= 0; i--){
        insert(arr[i-1], ronda);
    }
    return ronda;
}

int main(){
    Ronda r1 = mkRonda();
    insert(1,r1);
    insert(2,r1);
    insert(3,r1);
    int* lista = toArray(r1);
    for (int i = 0; i < 3; i++){
        cout << lista[i] << endl;
    }
    Ronda r2 = mkRonda();
    insert(4,r2);
    insert(5,r2);
    insert(6,r2);
    Ronda ronda = fromArray(3, toArray(r2));
    for (int i = 0; i < 3; i++){
        move(1,ronda);
        cout << current(ronda) << endl;
    }   
}