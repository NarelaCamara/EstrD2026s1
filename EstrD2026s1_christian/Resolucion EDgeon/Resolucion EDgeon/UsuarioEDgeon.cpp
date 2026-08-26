#include <iostream>
#include "EDgeon.cpp"
#include "EDgeon.h"
#include "LinkedList.h"
using namespace std;

bool completarNivel(LinkedList ds, EDgeon h){
    //Dada una linkedlist con direcciones a donde moverse, llevar a la heroina por dichas direcciones y al final verificar si mato
    //a todos los MONSTRUOS y si se encuentra en la escalera. 
    ListIterator iterador = getIterator(ds);
    while(!atEnd(iterador)){
        mover(current(iterador),h);
        Next(iterador);
    }
    DisposeIterator(iterador);
    return enLaEscalera(h) && sinMonstruos(h);
}

