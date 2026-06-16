#include <iostream>
#include "ArrayList.h"
#include "Tree.h"
using namespace std;


//definir la siguiente interfaz:
Tree emptyT(){
    Tree t = new NodeT;
    t->elem = NULL;
    t->left=NULL;
    t->right=NULL;
    return t;
};

Tree nodeT(int elem, Tree left, Tree right){
    Tree t = new NodeT;
    t->elem=elem;
    t->left=left;
    t->right=right;
    return t;
};

//
bool isEmptyT(Tree t){
    return t->elem == NULL;
};

//precondicion: No debe ser unn arbol vacio
int rootT(Tree t){
    return t->elem;
};

//precondicion: No debe ser un arbol vacio en la izq
Tree left(Tree t){
    return t->left;
};

//precondicion: No debe ser un arbol vacio en la der
Tree right(Tree t){
    return t->right;
};
