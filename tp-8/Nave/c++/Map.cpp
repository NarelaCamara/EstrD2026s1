#include <iostream>
#include "Map.h"
using namespace std;

Map emptyM (); 

void assocM (String k, String v, Map m);

Maybe lookupM(String k, Map m);

void deleteM (String k, Map m); 

int* domM(Map m);