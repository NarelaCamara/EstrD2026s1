#include <iostream>
using namespace std;

struct RondaStr;

struct RondaNode;

typedef RondaStr* Ronda;

Ronda mkRonda();
int current(Ronda ronda);
void move(int pos, Ronda ronda);
void insert(int value, Ronda ronda);
void remove(Ronda ronda);
int lenght(Ronda ronda);

