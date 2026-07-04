#include <iostream>
#include "Map.h"
using namespace std;

Map emptyM (); 

Map assocM (Any k, Any v, Map m);

Maybe lookupM(Any k, Map m);

Map deleteM (Any k, Map m); 

int* domM(Map m);