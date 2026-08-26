#include <iostream>
#include "Heap.h"
using namespace std;

void ShowMinYH(BinHeap h){
    ShowHeap(h); 
    if(!isEmptyHeap(h)) cout << "Min: " << findMin(h) << endl;
}

/*O( 1 + # por declaración-asignación de la variable local 'rta'
     1 + # por declaración-asignación de la variable local 'copiaH' (incluyendo 'emptyHeap')
     n * # por iteración sobre la heap de ints dada, siendo n la cant de ints de la heap
         (1 + # por cada uso del bool 'not'
          1 + # por el uso de 'isEmptyHeap'
          1 + # por el uso del bool '&&'
          1 + # por lectura de la variable bool 'rta'
          1 + # por declaración-asignación de la variable local 'a' (incluyendo 'findMin')
          log n + # por el uso de 'InsertH'
          1 + # por el uso de 'DeleteMin'
          1 por asignación de variable bool 'rta'
          ) + -> n * constante + log n => n log n
     m * # por iteración sobre la heap auxiliar, siendo n la cant de ints de esta heap
         (1 + # por cada uso del bool 'not'  
          1 + # por el uso de 'isEmptyHeap'
          1 + # por declaración-asignación de la variable local 'a' (incluyendo 'findMin')
          log m + # por el uso de 'InsertH'
          1 + # por el uso de 'DeleteMin'
          ) -> m * constante + log m => m log m => n log n + m log m
    ) -> constante + n log n + m log m;
      en el peor caso posible en la heap auxiliar se encuentran todos los elementos de la heap pasada 
      por parámetro => n = m => n log n + n log n => 2n log n => n log n */
// Eficiencia: O(n log n)
bool pertenece(int x, BinHeap h) {
    bool rta = false;
    BinHeap copiaH = emptyHeap();
    while(!isEmptyHeap(h) && !rta){
        int a = findMin(h);
        InsertH(a, copiaH);
        DeleteMin(h); 
        rta = a==x;   
    }
    while(!isEmptyHeap(copiaH)) {
        int a = findMin(copiaH);
        DeleteMin(copiaH);
        InsertH(a, h);
    }
    return rta;
}




int main(){
    
    BinHeap h = emptyHeap();
    // ShowMinYH(h);
    InsertH(5, h);
    //ShowMinYH(h);
    InsertH(7, h); InsertH(4, h); InsertH(10, h); InsertH(15, h); InsertH(1, h); InsertH(8, h); InsertH(30, h);
    //ShowMinYH(h);
    DeleteMin(h);
    //ShowMinYH(h);
    InsertH(70, h); InsertH(2, h); InsertH(1, h); InsertH(11, h); InsertH(12, h); InsertH(28, h); InsertH(50, h);
    InsertH(11, h); InsertH(12, h); InsertH(28, h); InsertH(50, h);
    //ShowMinYH(h);
    int* a = new int[3];
    a[0] = 100; a[1] = 200;
    BinHeap h2 = crearHeap(a, 2, 3);
    //ShowMinYH(h2);
    InsertH(300, h2);
    //ShowMinYH(h2);
    if(pertenece(5,h2)){ cout << "TRUE" << endl;} else { cout << "FALSE" << endl; }
    if(pertenece(300,h2)){ cout << "TRUE" << endl;} else { cout << "FALSE" << endl; }
    if(pertenece(50,h)){ cout << "TRUE" << endl;} else { cout << "FALSE" << endl; }
    if(pertenece(5000,h)){ cout << "TRUE" << endl;} else { cout << "FALSE" << endl; }

}