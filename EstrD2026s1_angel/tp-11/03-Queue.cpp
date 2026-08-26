#include <iostream>
#include "Queue.h"
using namespace std;

void ShowQ(Queue q){
    Queue aux = emptyQ(); 
    cout << "Queue: " << q << " -> |" << ends;
    while (!isEmptyQ(q)) {
        cout << firstQ(q) << ends;      
        Enqueue(firstQ(q), aux);      
        Dequeue(q);
        if(!isEmptyQ(q)) { cout << ", " << ends; }        
    }
    cout << "|" << endl; 
    while (!isEmptyQ(aux)) {
        Enqueue(firstQ(aux), q);
        Dequeue(aux);
    }
    cout << "   longitud: " << lengthQ(q) << endl;
    cout << "   primero : " << ends;
    if(isEmptyQ(q)){ cout << "queue empty" << endl; } else { cout << firstQ(q) << endl; }
    cout << endl;
}

int main(){
    Queue q = emptyQ(); // ShowQ(q);
    Enqueue(4, q); // ShowQ(q);
    Enqueue(10, q); Enqueue(2, q); // ShowQ(q);
    Dequeue(q); // ShowQ(q);

    Queue r = emptyQ(); Enqueue(0, r); Enqueue(200, r);
    cout << "se mergea q con r |10,2| + |0,200|: " << endl;
    MergeQ(q,r); ShowQ(q); 

    Queue s = emptyQ(); 
    cout << "se mergea q con s (vacía): " << endl;
    MergeQ(q,s); ShowQ(q); 

    Dequeue(q); Dequeue(q); Dequeue(q); Dequeue(q);
    Queue t = emptyQ();
    cout << "se mergea q con s (vacías): " << endl;
    MergeQ(q,t); ShowQ(q); 
    
    Queue u = emptyQ(); Enqueue(15, u);
    cout << "se mergea q con u |15|: " << endl;
    MergeQ(q,u); ShowQ(q);

    ShowQ(u);
    DestroyQ(q);
    ShowQ(q);
}