#include <iostream>
using namespace std;

struct NodeT;
typedef NodeT* Tree;


// Eficiencia: O(1)
Tree emptyT(); 

// Eficiencia: O(1)
Tree nodeT(int elem, Tree left, Tree right);

// Eficiencia: O(1)
bool isEmptyT(Tree t);

// Eficiencia: O(1)
int rootT(Tree t);

// Eficiencia: O(1)
Tree left(Tree t);

// Eficiencia: O(1)
Tree right(Tree t);