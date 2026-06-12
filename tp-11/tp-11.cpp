#include <iostream>
using namespace std;
#include "LinkedList.cpp"

//cero es falso y uno es verdadero
int main() {
    LinkedList l = nil();
    Cons(1,l);
    Cons(2,l);
    Cons(3,l);
    Cons(4,l);
    cout << "Head: " << head(l) << endl;
    Tail(l);
    cout << "Second: " << head(l) << endl;
    cout << "isEmpty: " << (isEmpty(l) ? "true" : "false") << endl;
    Tail(l);
    cout << "Tail: " << head(l) << endl;
    return 0;
};