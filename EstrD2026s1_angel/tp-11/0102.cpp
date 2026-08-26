#include <iostream>
#include "LinkedListV2.h"
using namespace std;

// 1 ##################################################################################################################
/* O(1 + # por generar variable local 'suma'
     1 + # por generar variable local 'ixs'
     1 + # por el uso de 'getIterator'
     n * # por iteración sobre la lista, siendo n la long de la lista dada
     (1 + # por el uso de not
      1 + # por el uso de 'atEnd'
      1  por el uso de 'current'
      1 + # por el uso de '+'
      1  por el uso de 'Next'
      ) 
    1 + # por el uso de 'DisposeIterator'
    ) -> 1 + 1 + 1 + n * (1 + 1 + 1 + 1) + 1  = 4 + 4n => n */
// O(n)
int sumatoria(LinkedList xs) {
    int suma = 0;
    ListIterator ixs = getIterator(xs);
    while (!atEnd(ixs)){
        suma += current(ixs);
        Next(ixs);
    }
    DisposeIterator(ixs);
    return suma;
}

// 2 ##################################################################################################################
/* O(1 + # por generar variable local 'ixs'
     1 + # por el uso de 'getIterator'
     1 + # por el uso de 'DisposeIterator'
     n * # por iteración sobre la lista, siendo n la long de la lista dada
     (1 + # por el uso de not
      1 + # por el uso de 'atEnd'
      1  por el uso de 'SetCurrent'
      1  por el uso de 'current'
      1 + # por el uso de '+1
      1  por el uso de 'Next'
      ) 
    ) -> 1 + 1 + 1 + n * (1 + 1 + 1 + 1 + 1 +1 )  = 3 + 6n => n */
// O(n)
void Sucesores(LinkedList xs) {
    ListIterator ixs = getIterator(xs);
    while (!atEnd(ixs)){
        SetCurrent(current(ixs)+1, ixs);
        Next(ixs);
    }
    DisposeIterator(ixs);
}

// 3 ##################################################################################################################
/* O(1 + # por generar variable local 'ixs'
     1 + # por el uso de 'getIterator'
     1 + # por el uso de 'DisposeIterator'
     1 + # por el uso de not
     1 + # por el uso de 'atEnd'
     n * # por iteración sobre la lista, siendo n la long de la lista dada
     (1*2 + # por el uso de not
      1 + # por el uso de 'atEnd'
      1  por el uso de 'current'
      1  por el uso de 'Next'
      )    
    ) -> 1 + 1 + 1 + 1 + 1 + n * (1*2 + 1 + 1 + 1) = 5 + 5n => n */
// O(n)
bool pertenece(int x, LinkedList xs) { 
    ListIterator ixs = getIterator(xs); bool rta = false;
    while(!atEnd(ixs) && !rta){
        rta = current(ixs) == x;
        Next(ixs);
    }
    DisposeIterator(ixs);
    return rta;
}

// no tiene la variable local bool rta pero es menos feliz en cuanto a la expresividad.
bool pertenece2(int x, LinkedList xs) { 
    ListIterator ixs = getIterator(xs);
    while (!atEnd(ixs)){
        if(current(ixs) == x) { return true; }
        Next(ixs);
    }
    DisposeIterator(ixs);
    return false;
}


// 4 ##################################################################################################################
/* O(1 + # por generar variable local 'contador'
     1 + # por generar variable local 'ixs'
     1 + # por el uso de 'getIterator'
     1 + # por el uso de 'DisposeIterator'
     n * # por iteración sobre la lista, siendo n la long de la lista dada
     (1 + # por el uso de not
      1 + # por el uso de 'atEnd'
      1 + # por el uso de '=='
      1 + # por el uso de '++'
      1 + # por el uso de 'current'
      1  por el uso de 'Next'
      )    
    ) -> 1 + 1 + 1 + 1 + n * (1 + 1 + 1 + 1 + 1 + 1) = 4 + 6n => n */
// O(n)
int apariciones(int x, LinkedList xs) { 
    int contador = 0; 
    ListIterator ixs = getIterator(xs);
    while (!atEnd(ixs)){
        if (current(ixs) == x) { contador++ ; }   
        Next(ixs);
    }
    DisposeIterator(ixs);
    return contador;
}

// 5 ##################################################################################################################
/* O(1 + # por generar variable local 'ixs'
     1 + # por generar variable local 'minVisto'
     1 + # por el uso de 'getIterator'
     1 + # por el uso de 'DisposeIterator'
     n * # por iteración sobre la lista, siendo n la long de la lista dada
     (1 + # por el uso de not
      1 + # por el uso de 'atEnd'
      1 + # por el uso de 'current'
      1  por el uso de 'Next'
      )    
    ) -> 1 + 1 + 1 + 1 + n * (1 + 1 + 1 + 1) = 4 + 4n => n */
// O(n)
int minimo(LinkedList xs) { 
// PRECOND.: la lista tiene que tener al menos un elemento. 
    ListIterator ixs = getIterator(xs);
    int minVisto = current(ixs);
    while (!atEnd(ixs)){
        minVisto = min(minVisto, current(ixs));
        Next(ixs);
    }
    DisposeIterator(ixs);
    return minVisto;
}

// 6 ##################################################################################################################
/* O(1 + # por generar variable local 'ixs'
     1 + # por generar variable local 'list'
     1 + # por el uso de 'getIterator'
     1 + # por el uso de 'nil'
     1 + # por el uso de 'DisposeIterator'
     n * # por iteración sobre la lista, siendo n la long de la lista dada
     (1 + # por el uso de not
      1 + # por el uso de 'atEnd'
      1 + # por el uso de 'current'
      1 + # por el uso de 'Next'
      1 por el uso de 'Snoc'
      )    
    ) -> 1 + 1 + 1 + 1 + 1 + n * (1 + 1 + 1 + 1 + 1) = 5 + 5n => n */
// O(n), si Snoc es de O(n) copy sería de O(n²)
LinkedList copy(LinkedList xs) { 
    ListIterator ixs = getIterator(xs);
    LinkedList list = nil();
    while (!atEnd(ixs)){
        Snoc(current(ixs), list);
        Next(ixs);
    }
    DisposeIterator(ixs);
    return list;
}

// 7 ##################################################################################################################
/* O(n * # por iteración sobre la lista ys, siendo n la long de la lista dada
     (1 + # por el uso de not
      1 + # por el uso de 'isEmpty'
      1 + # por el uso de 'head'
      1 + # por el uso de 'Tail'
      1 por el uso de 'Snoc'
      )
     + 1 por el uso de 'DestroyL'     
    ) -> n * (1 + 1 + 1 + 1 + 1) + 1 = 5n + 1 => n */
// O(n), si Snoc es de O(n) copy AppendL de O(n*m), siendo m la long de xs
void AppendL(LinkedList xs, LinkedList ys) { 
    while (!isEmpty(ys)){
        Snoc(head(ys), xs);
        Tail(ys);
    }
    DestroyL(ys); // libera la memoria del header, el resto de la lista se destruye con Tail
}




void ShowList(LinkedList xs) {
  ListIterator ixs = getIterator(xs);
  cout << "[" << ends;
  while (!atEnd(ixs)) {
    cout << current(ixs) << ends;
    Next(ixs);
    if(!atEnd(ixs)){ cout << ", " << ends; }
  }
  cout << "]" << endl;  
  DisposeIterator(ixs);
}

main(){
    LinkedList lista1 = nil();
    Cons(6, lista1); Cons(5, lista1); Snoc(7, lista1);
    ShowList(lista1);
    // cout << sumatoria(lista1) << endl;
    // Sucesores(lista1); cout << "se hace Sucesores" << endl; ShowList(lista1);
    if (pertenece(8, lista1)) { cout << "TRUE" << endl; } else { cout << "FALSE" << endl; }
    if (pertenece(7, lista1)) { cout << "TRUE" << endl; } else { cout << "FALSE" << endl; }
    if (pertenece(6, lista1)) { cout << "TRUE" << endl; } else { cout << "FALSE" << endl; }
    if (pertenece(5, lista1)) { cout << "TRUE" << endl; } else { cout << "FALSE" << endl; }
    // Cons(7, lista1); cout << apariciones(7, lista1) << endl;
    // Cons(4, lista1);  Snoc(0, lista1); cout << minimo(lista1) << endl;
    LinkedList copia = copy(lista1);
    ShowList(lista1);
    Snoc(9, copia);
    ShowList(copia);
    AppendL(lista1, copia);
    ShowList(lista1);
    //ShowList(copia);
}