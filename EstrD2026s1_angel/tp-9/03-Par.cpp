#include <iostream>
#include "03-Par.h"
using namespace std;

Par consPar(int x, int y) {
    par p;
    p.x = x;
    par.y = y;
    return p;
}

int fst(Par p) {
    return p.x;
}

int snd(Par p) {
    return p.y;
}

int maxpreDelPar(Par p) {
    if (p.x > p.y) {
        return p.x;
    }
    return p.y;
}
   

Par swap(Par p) {
    Par q;
    q.x = p.y;
    q.y = p.x;  
    return q;
}

Par divisionYResto(int n, int m) {
    Par p;
    p.x = n / m;
    p.y = n % m;
    return p;
}