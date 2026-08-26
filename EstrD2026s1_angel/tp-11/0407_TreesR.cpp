#include <iostream>
#include "BinaryTree.h"
#include "ArrayList.h"
using namespace std;

Tree tree0 = emptyT();
Tree tree1 = nodeT (5, (nodeT (1, emptyT(), emptyT())), emptyT()); // sum 6    2  elementos/nodos
Tree tree2 = nodeT (10, (nodeT (1, emptyT(), emptyT())), tree1);   // sum 17   4  elementos/nodos
Tree tree3 = nodeT (25, (nodeT (1, tree1, tree2)), tree1);         // sum 55   10 elementos/nodos
Tree tree4 = nodeT (10, emptyT(), emptyT()); 
Tree tree5 = nodeT (100, tree3, tree3); 
Tree tree6 = nodeT (10, (nodeT (20, nodeT (40, emptyT(), emptyT()), nodeT (50, emptyT(), emptyT()))), (nodeT (30, nodeT (60, emptyT(), emptyT()), nodeT (70, emptyT(), emptyT()))));

// 1 ######################################################################################
int sumarT(Tree t) {
    if(isEmptyT(t)){
        return 0;
    } else { 
        return rootT(t) + sumarT(left(t)) + sumarT(right(t));
    }
}

// 2 ######################################################################################
int sizeT(Tree t) {
    if(isEmptyT(t)){
        return 0;
    } else { 
        return 1 + sizeT(left(t)) + sizeT(right(t));
    }
}

// 3 ######################################################################################
bool perteneceT(int e, Tree t) {
    return !isEmptyT(t) && (rootT(t) == e || perteneceT(e, left(t)) || perteneceT(e, right(t)));
}

// 4 ######################################################################################
int aparicionesT(int e, Tree t) {
    int apariciones = 0;
    if(isEmptyT(t)){
        return apariciones;
    } else { 
        if(rootT(t) == e){
            apariciones++;
        }
        return apariciones + aparicionesT(e, left(t)) + aparicionesT(e, right(t));
    }
    /*         
    if(isEmptyT(t)){ 
        return 0;
    } else { 
        if (rootT(t)==e) {
            return 1 + aparicionesT(e, left(t)) + aparicionesT(e, right(t));
        } else {
            return aparicionesT(e, left(t)) + aparicionesT(e, right(t));
        }
      }
    */
}

// 5 ######################################################################################
int heightT(Tree t) {
    int altura = 0;
    if(isEmptyT(t)){ 
        return altura;
    } else { 
        return 1 + max(heightT(left(t)), heightT(right(t)));
    }
}

// 6 ######################################################################################
void appendAL(ArraList xs, ArrayList ys) {
    int longitud = (lengthAL(xs)+lengthAL(ys))*2;
    resize(longitud, xs);
    for(int i = 0; i < lengthAL(ys); i++){
        Tree t = get(i, ys);
        add(t, xs)
    }
}


ArrayList toList(Tree t) {
    ArrayList xs = newArrayList();
    if(!isEmptyT(t)){
        Tree root = rootT(t);
        add(root, appendAL(toList(left(root),toList(right(root)))))
    }
    return xs;
}

// 7 ######################################################################################
ArrayList leaves(Tree t){
    ArrayList xs = newArrayList();
    ArmarListaLeaves(t, xs);
    return xs;
}

// 8 ######################################################################################
void ArmarListaLevelN(int n, Tree t, ArrayList xs){
    if(!isEmptyT(t)){  
        if(n==0){
            add(rootT(t), xs);
        } else {
            ArmarListaLevelN(n-1, left(t), xs);        
            ArmarListaLevelN(n-1, right(t), xs);
        }
    }
}

ArrayList levelN(int n, Tree t){
    ArrayList xs = newArrayList();
    ArmarListaLevelN(n, t, xs);
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
    // cout << sumarT(tree6) << endl;
    // cout << tree0 << " - size: " << sizeT(tree0) << " -> esperable: " << 0 << endl;
    // cout << tree1 << " - size: " << sizeT(tree1) << " -> esperable: " << 2 << endl;
    // cout << tree2 << " - size: " << sizeT(tree2) << " -> esperable: " << 4 << endl;
    // cout << tree6 << " - size: " << sizeT(tree6) << " -> esperable: " << 7 << endl;
    // TestearBool(perteneceT(0, tree3), false); T,estearBool(perteneceT(10, tree3), true);
    // cout <<  "Aparicinoes de : " << 5 << " en " << tree0 << " -> " << aparicionesT(5, tree0) << "esperable: " << 0 << endl;
    // cout <<  "Aparicinoes de : " << 70 << " en " << tree6 << " -> " << aparicionesT(70, tree6) << " esperable: " << 1 << endl;
    // cout <<  "Aparicinoes de : " << 1 << " en " << tree3 << " -> " << aparicionesT(1, tree3) << " esperable: " << 5 << endl; 
    // cout <<  "Altura de : " << tree0 << " -> " << heightT(tree0) << "esperable: "  << 0 << endl;
    // cout <<  "Altura de : " << tree6 << " -> " << heightT(tree6) << " esperable: " << 3 << endl;
    // cout <<  "Altura de : " << tree3 << " -> " << heightT(tree3) << " esperable: " << 5 << endl;
    // printAL(toList(tree0)); printAL(toList(tree1)); printAL(toList(tree3)); printAL(toList(tree6));
    // printAL(leaves(tree0)); printAL(leaves(tree1)); printAL(leaves(tree3)); printAL(leaves(tree6));
    printAL(levelN(1, tree0)); 
    printAL(levelN(1, tree1)); printAL(levelN(4, tree3)); printAL(levelN(2, tree6));
    printAL(levelN(0, tree1)); printAL(levelN(3, tree3)); printAL(levelN(1, tree6));




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