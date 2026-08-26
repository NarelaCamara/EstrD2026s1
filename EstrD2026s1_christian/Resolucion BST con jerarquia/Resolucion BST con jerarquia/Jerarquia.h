#include <iostream>
using namespace std;

struct JBSTNodeStr;
struct JBSTStr;

typedef JBSTStr* JerarquiaBST;

JerarquiaBST fundar(int p);
//crea la jerarquia, colocando a la persona p como presidente.
void insertar(int nuevo, int superior, JerarquiaBST t);
//PRECONDICION: Existe la persona superior en la jerarquia y no existe la persona nueva 
//inserta a la persona nuevo en la jerarquia t como subordinado directo de la persona superior
bool esSubordinadoDe(int empleado, int superior, JerarquiaBST bst);
//PRECONDICION: Existe empleado y superior en la jerarquia bst
//indica si el empleado es subordinado de superior en la jerarquia bst 
JBSTNodeStr* find(int nombre, JBSTNodeStr* t);
//busca el nombre dado en la jerarquia dada