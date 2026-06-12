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
    showList(l);
    cout << "Head: " << head(l) << endl;
    Tail(l);
    showList(l);
    cout << "Second: " << head(l) << endl;
    cout << "isEmpty: " << (isEmpty(l) ? "true" : "false") << endl;
    Snoc(5,l);
    Snoc(6,l);
    cout << "length: " << length(l)<< endl;
    showList(l);
    ListIterator li = getIterator(l);
    cout << "getIterator: ";
    showIterator(li);
    cout << "current: " << current(li);
    
    return 0;
};