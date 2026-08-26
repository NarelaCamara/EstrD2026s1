#include <iostream>
#include "Heap.h"
using namespace std;

struct BinHeapHeaderSt{
  int  maxSize;   
  int  curSize;         
  int* elems;
};

//typedef BinHeapHeaderSt* BinHeap; // INV.REP.: el puntero NO es NULL
/* INV.REP.: 
    * curSize < maxSize
    * El arreglo int* elems representa un heap binario como un árbol completo: 
        * elems[0] guarda un valor mínimo de referencia, como control
        * La raíz de la heap se encuentra en la posición elems[1], luego por niveles uno detrás de otro
        * Para todo nodo n con índice i como posición el array elems, siendo 1 =< i =< curSize: 
            * el hijo izquierdo, si existiese, se encuentra en la posición elems[2*i]
                (si 2*i <= curSize, en elems[2*i] se encuentra el hijo izquierdo de n)
            * el hijo derecho, si existiese, se encuentra en la posición elems[2*i + 1]
                (si 2*i + 1 <= curSize, en elems[2*i + 1] se encuentra el hijo derecho de n)
            * el nodo padre de n se encuentra en elems[i/2]
*/

BinHeap emptyHeap(){
    BinHeapHeaderSt* h = new BinHeapHeaderSt;
    h->maxSize = 16;
    h->curSize = 0;
    h->elems = new int[h->maxSize];
    h->elems[0] = 0; 
    return h;
}

// ####################################################################################
void AumentarEspacio(BinHeapHeaderSt* h) {
    int* nuevoArray = new int[h->maxSize*2];
    for(int i = 0; i < h->maxSize; i++){
        nuevoArray[i] = h->elems[i];
    }
    delete h->elems;
    h->elems = nuevoArray;
    h->maxSize*=2;
}

void InsertH(int x, BinHeap h) {
    if(h->curSize==h->maxSize-1) { AumentarEspacio(h); }
    int actualN = h->curSize; //++h->curSize;
    actualN++;
    while(x < h->elems[actualN/2]){
        h->elems[actualN] = h->elems[actualN/2];
        actualN /= 2;
    }
    h->elems[actualN] = x;
    h->curSize++;
}

// ####################################################################################
bool isEmptyHeap(BinHeap h) {  
    return h->curSize==0;
}

// ####################################################################################
int findMin(BinHeap h) {
    if(h->curSize > 0){  
        return h->elems[1];
    }
}

// ####################################################################################
void DeleteMin(BinHeap h) { // PRECOND: h->curSize > 0
  int child; int curNode;
  int last = h->elems[h->curSize--];
  for(curNode=1; curNode*2 <= h->curSize; curNode=child) {
    child = curNode*2;
    if ((child != h->curSize) // Elige el hijo más chico
     && (h->elems[child+1] < h->elems[child])) { child++; }
    // Baja un nivel, si el hijo más chico es más chico que last 
    if (last > h->elems[child]) { h->elems[curNode] = h->elems[child]; }
    else { break; } // O termina (evitando comparar dos veces lo mismo)
  }
  h->elems[curNode] = last;  
}

// ####################################################################################
BinHeap crearHeap(int* elems, int cant, int max) {
  // PRECOND: cant < max
  int curNode; int child;
  BinHeapHeaderSt* h = new BinHeapHeaderSt;
  h->maxSize = max; 
  h->curSize = cant;
  h->elems = new int[h->maxSize];
  h->elems[0] = 0;
  for(int i=1; i <= h->curSize; i++)
    { h->elems[i] = elems[i-1]; }
  for(int j=h->curSize/2; j >= 1; j--) {
    // Hundir el elemento j
    int last = h->elems[j];
    for(curNode=j; curNode*2 <= h->curSize; curNode=child) {
      child = curNode*2;
      if ((child != h->curSize) // Elige el hijo más chico
       && (h->elems[child+1] < h->elems[child])) { child++; }
      // Baja un nivel, si el hijo más chico es más chico que last 
      if (last > h->elems[child]) { h->elems[curNode] = h->elems[child]; }
      else { break; } // O termina (evitando comparar dos veces lo mismo)
    }
    h->elems[curNode] = last;  
  }
  return h;
}

void ShowHeap(BinHeap h) {
  cout << "Heap[" << h->curSize << "," << h->maxSize << "]";
  cout << "(MIN";
  for (int i=1;i<=h->curSize;i++) {
    cout << ", " << h->elems[i];
  }
  cout << ")" << endl;
}