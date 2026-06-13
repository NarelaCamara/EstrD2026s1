#include <iostream>
using namespace std;
#include "LinkedList.cpp"

//cero es falso y uno es verdadero
int main() {
    cout << "LinkedList ----------------------------------------- " << endl;
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
    Snoc(5,l); //falto 5 donde esta???
    Snoc(6,l);
    cout << "length: " << length(l)<< endl; //deberia ser 5
    showList(l);

    cout << "ListIterator ----------------------------------------- " << endl;
    ListIterator li = getIterator(l);
    cout << "getIterator: ";
    showIterator(li);
    cout << "current: " << current(li) << endl;
    SetCurrent(666, li);
    cout << "setCurrent: " << current(li) << endl;
    showIterator(li);
    Next(li);
    cout << "setCurrent: " << current(li) << endl;
    showIterator(li);
    cout << "atEnd: " << (atEnd(li) ? "true" : "false")<< endl;
    DisposeIterator(li);
    DestroyL(l);

    cout << "DisposeIterator y DestroyL llamados correctamente." << endl;
    return 0;
};