#include <iostream>
#include "Set.h"
using namespace std;

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

void PrintSet(Set s){
  cout << "Set: " << s << endl;
  cout << "lista: " << ends; ShowList(setToList(s));
  cout << "cant : " << sizeS(s) << endl; 
}

void PrintPertenece(int x, Set s) {
      cout << "Pertenece " << x << " al Set " << s << " -> " << ends;
      if(belongsS(x,s)) { cout << "TRUE" << endl; } else { cout << "FALSE" << endl; }
}

int main(){
  Set s = emptyS(); // PrintSet(s);
  AddS(4, s); AddS(4, s); AddS(5, s);
  // PrintSet(s); RemoveS(4, s); PrintSet(s);
  // RemoveS(5, s); PrintSet(s);
  // RemoveS(5, s); PrintSet(s);
  PrintSet(s);
  PrintPertenece(4,s); PrintPertenece(5,s); PrintPertenece(6,s); 
  DestroyS(s);
  PrintSet(s);  
}