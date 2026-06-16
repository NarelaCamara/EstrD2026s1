#include <iostream>
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


void ShowTree (Tree t){
    if (t == NULL) {
        cout << "<>";
        return;
    }
    if (isEmptyT(t)){
        cout << "<>";
        return;
    }
    cout << "(" << t->elem;
    if (t->left != NULL) {
        cout << " ";
        ShowTree(t->left);
    } else {
        cout << " <>";
    }
    if (t->right != NULL) {
        cout << " ";
        ShowTree(t->right);
    } else {
        cout << " <>";
    }
    cout << ")";
}