#include <iostream>
#include "BinaryTree.h"
#include "TList.h"
#include "ArrayList.h"
#include "QueueT.h"
using namespace std;

Tree tree0 = emptyT();
Tree tree1 = nodeT (5, (nodeT (1, emptyT(), emptyT())), emptyT()); // sum 6    2  elementos/nodos
Tree tree2 = nodeT (10, (nodeT (1, emptyT(), emptyT())), tree1);   // sum 17   4  elementos/nodos
Tree tree3 = nodeT (25, (nodeT (1, tree1, tree2)), tree1);         // sum 55   10 elementos/nodos
Tree tree4 = nodeT (10, emptyT(), emptyT()); 
Tree tree5 = nodeT (100, tree3, tree3); 
Tree tree6 = nodeT (10, (nodeT (20, nodeT (40, emptyT(), emptyT()), nodeT (50, emptyT(), emptyT()))), (nodeT (30, nodeT (60, emptyT(), emptyT()), nodeT (70, emptyT(), emptyT()))));

// 1 ######################################################################################
void AgregarSiNoEsEmptyT(Tree t, TList ts){
    if(!isEmptyT(t)){
        SnocTL(ts, t);
    }
}

int sumarT(Tree t) {
    int suma = 0; TList arbolesPorProcesar = emptyTL(); 
    AgregarSiNoEsEmptyT(t, arbolesPorProcesar);
    while(!isEmptyTL(arbolesPorProcesar)){
           Tree actual = headTL(arbolesPorProcesar);
           suma += rootT(actual);
           TailTL(arbolesPorProcesar);
           AgregarSiNoEsEmptyT(left(actual), arbolesPorProcesar );
           AgregarSiNoEsEmptyT(right(actual), arbolesPorProcesar );    
    }
    LiberarTL(arbolesPorProcesar);
    return suma;
} 
// 2 ######################################################################################
int sizeT(Tree t) {
    int cantidad = 0; TList arbolesPorProcesar = emptyTL();
    AgregarSiNoEsEmptyT(t, arbolesPorProcesar);
    while(!isEmptyTL(arbolesPorProcesar)){
        Tree actual = headTL(arbolesPorProcesar);
        TailTL(arbolesPorProcesar);
        cantidad++;
        AgregarSiNoEsEmptyT(left(actual), arbolesPorProcesar);
        AgregarSiNoEsEmptyT(right(actual), arbolesPorProcesar);
    }
    LiberarTL(arbolesPorProcesar);
    return cantidad++;
}

// 3 ######################################################################################
bool perteneceT(int e, Tree t){
    bool rta = false; TList arbolesPorProcesar = emptyTL();
    AgregarSiNoEsEmptyT(t, arbolesPorProcesar);
    while(!isEmptyTL(arbolesPorProcesar) && !rta){
        Tree actual = headTL(arbolesPorProcesar);
        rta = rootT(headTL(arbolesPorProcesar))==e; 
        TailTL(arbolesPorProcesar);
        AgregarSiNoEsEmptyT(left(actual), arbolesPorProcesar);
        AgregarSiNoEsEmptyT(right(actual), arbolesPorProcesar);
    }
    LiberarTL(arbolesPorProcesar);
    return rta;
}

// no se incializa memoria pero pierde expresividad dentro del while se usa un if y cortaría antes que la lista a procesar quede vacía
bool perteneceT2(int e, Tree t){
    TList arbolesPorProcesar = emptyTL();
    AgregarSiNoEsEmptyT(t, arbolesPorProcesar);
    while(!isEmptyTL(arbolesPorProcesar)){
        Tree actual = headTL(arbolesPorProcesar);
        if (rootT(actual)==e) { LiberarTL(arbolesPorProcesar); return true; } 
        TailTL(arbolesPorProcesar);
        AgregarSiNoEsEmptyT(left(actual), arbolesPorProcesar);
        AgregarSiNoEsEmptyT(right(actual), arbolesPorProcesar);
    }
    LiberarTL(arbolesPorProcesar);
    return false;
}
// 4 ######################################################################################
int aparicionesT(int e, Tree t) {
    int contador = 0; TList arbolesPorProcesar = emptyTL();
    AgregarSiNoEsEmptyT(t, arbolesPorProcesar);
    while(!isEmptyTL(arbolesPorProcesar)){
        Tree actual = headTL(arbolesPorProcesar);
        if(rootT(actual)==e) { contador++; }
        TailTL(arbolesPorProcesar);
        AgregarSiNoEsEmptyT(left(actual), arbolesPorProcesar);
        AgregarSiNoEsEmptyT(right(actual), arbolesPorProcesar);
    }
    LiberarTL(arbolesPorProcesar);
    return contador;
}

// 5 ######################################################################################
void EnqueueTSiNoEsEmpty(Tree t, QueueT qT){
    if(!isEmptyT(t)){
        EnqueueT(t, qT);
    }
}

int heightT(Tree t) {
    int altura = 0; QueueT qT = emptyQT(); 
    EnqueueTSiNoEsEmpty(t, qT);
    while(!isEmptyQT(qT)){
        int longQ = lengthQT(qT);
        for(int i = 0; i < longQ; i++){  
           Tree actual = firstQT(qT);
           DequeueT(qT);
           EnqueueTSiNoEsEmpty(left(actual), qT );
           EnqueueTSiNoEsEmpty(right(actual), qT );    
        }
        altura++;
    }
    DestroyQT(qT);
    return altura;
}
    
// 6 ######################################################################################
ArrayList toList(Tree t) {
    ArrayList xs = newArrayList(); TList arbolesPorProcesar = emptyTL();
    AgregarSiNoEsEmptyT(t, arbolesPorProcesar);
    while(!isEmptyTL(arbolesPorProcesar)){
        Tree actual = headTL(arbolesPorProcesar);
        add(rootT(actual), xs); 
        TailTL(arbolesPorProcesar);
        AgregarSiNoEsEmptyT(left(actual), arbolesPorProcesar);
        AgregarSiNoEsEmptyT(right(actual), arbolesPorProcesar);
    }
    LiberarTL(arbolesPorProcesar);
    return xs;
}

// 7 ######################################################################################

ArrayList leaves(Tree t){
    ArrayList xs = newArrayList(); QueueT q = emptyQT();
    EnqueueTSiNoEsEmpty(t, q);
    while(!isEmptyQT(q)){
        int longQ = lengthQT(q);
        for(int i = 0; i < longQ; i++){
            Tree actual = firstQT(q);
            DequeueT(q);
            if(isEmptyT(left(actual)) && isEmptyT(right(actual))){
                add(rootT(actual), xs);
            } 
            EnqueueTSiNoEsEmpty(left(actual), q);
            EnqueueTSiNoEsEmpty(right(actual), q);
        }
    }
    DestroyQT(q);
    return xs;
}

// 8 ######################################################################################
ArrayList levelN(int n, Tree t){
    ArrayList xs = newArrayList(); QueueT q = emptyQT(); int nivel = 0;
    EnqueueTSiNoEsEmpty(t, q);
    while(!isEmptyQT(q) && nivel < n){
        int longQ = lengthQT(q);
        for(int i = 0; i < longQ; i++){
            Tree actual = firstQT(q);
            DequeueT(q);
            EnqueueTSiNoEsEmpty(left(actual), q);
            EnqueueTSiNoEsEmpty(right(actual), q);
        }
        nivel++;
    }
    if(nivel == n){ 
        while(!isEmptyQT(q)){
            Tree actual = firstQT(q);
            DequeueT(q);
            add(rootT(actual), xs);
        }
    }
    DestroyQT(q);
    return xs;
}







int signo(int n) {
  if       (n>0) { return  1; }
   else if (n<0) { return -1; }
   else          { return  0; }
}


int signoBonito(int n) {
  return ( n>0 ?  1 
         : n<0 ? -1 
         :        0);
}


void TestearBool(bool esperable, bool muestra){
    cout << "Se espera: "  << ends; if(esperable==1) { cout << "true // ";} else { cout << "false  // ";} 
    cout << "Obtenido: " << ends; if( muestra==1) { cout << "true" << ends;} else { cout << "false" << ends;} 
    cout << " ==> " << ends;
    if(muestra==esperable){ cout << "PASSED" << endl; } else { cout << "ERROR" << endl;}
}

void printAL(ArrayList xs) {
    cout << "[" << ends;
    for(int i = 1; i < lengthAL(xs); i++){ 
        cout << get(i,xs) << ", " << ends;
    }
    if(lengthAL(xs)>0) cout << get(lengthAL(xs),xs) << ends;
    cout << "]" << endl;    
}

int main(){
        cout << sumarT(tree0) << endl;
       cout << sumarT(tree6) << endl;
     cout << tree0 << " - size: " << sizeT(tree0) << " -> esperable: " << 0 << endl;
     cout << tree1 << " - size: " << sizeT(tree1) << " -> esperable: " << 2 << endl;
     cout << tree2 << " - size: " << sizeT(tree2) << " -> esperable: " << 4 << endl;
     cout << tree6 << " - size: " << sizeT(tree6) << " -> esperable: " << 7 << endl;
     TestearBool(perteneceT(0, tree3), false); TestearBool(perteneceT(10, tree3), true); TestearBool(perteneceT(0, tree3), false); 
     TestearBool(perteneceT(100, tree0), false); TestearBool(perteneceT(50, tree6), true);
     TestearBool(perteneceT2(0, tree3), false); TestearBool(perteneceT2(10, tree3), true); TestearBool(perteneceT2(0, tree3), false); 
     TestearBool(perteneceT2(100, tree0), false); TestearBool(perteneceT2(50, tree6), true);
     cout <<  "Aparicinoes de : " << 5 << " en " << tree0 << " -> " << aparicionesT(5, tree0) << " esperable: " << 0 << endl;
     cout <<  "Aparicinoes de : " << 70 << " en " << tree6 << " -> " << aparicionesT(70, tree6) << " esperable: " << 1 << endl;
     cout <<  "Aparicinoes de : " << 1 << " en " << tree3 << " -> " << aparicionesT(1, tree3) << " esperable: " << 5 << endl;
    // cout <<  "Altura de : " << tree0 << " -> " << heightT(tree0) << " esperable: "  << 0 << endl;
    // cout <<  "Altura de : " << tree4 << " -> " << heightT(tree4) << " esperable: " << 1 << endl;
    // cout <<  "Altura de : " << tree1 << " -> " << heightT(tree1) << " esperable: " << 2 << endl;
    // cout <<  "Altura de : " << tree6 << " -> " << heightT(tree6) << " esperable: " << 3 << endl;
    // cout <<  "Altura de : " << tree3 << " -> " << heightT(tree3) << " esperable: " << 5 << endl;
    printAL(toList(tree0)); printAL(toList(tree1)); printAL(toList(tree3)); printAL(toList(tree6));
    // printAL(leaves(tree0)); printAL(leaves(tree1)); printAL(leaves(tree3)); printAL(leaves(tree6));
    // printAL(levelN(1, tree0)); 
    // printAL(levelN(1, tree1)); printAL(levelN(4, tree3)); printAL(levelN(2, tree6));
    // printAL(levelN(0, tree1)); printAL(levelN(3, tree3)); printAL(levelN(3, tree6));
    // printAL(levelN(10, tree6));
}

/*
### A3 
                     25
                   /    \
                  1      5 
                /  \    /  \   
               5   10  1
              /    / \
             1    1   5
                     /
                    1

### A6 
                      10
                   /      \
                  20      30 
                 /  \    /  \   
               40   50  60  70
*/
