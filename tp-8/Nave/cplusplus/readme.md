
Map
Key -> tipo string
value -> tipo Sector o Tripulante

Max Heap -> Tripulante

Set-> SetorId y Nombre

## TP 8 Nave
- cls; g++ -std=c++11 -O2 -o tp-8\Nave\cplusplus\tp-8.exe tp-8\Nave\cplusplus\tp-8.cpp; tp-8\Nave\cplusplus\tp-8.exe



In file included from tp-8\Nave\cplusplus\tp-8.cpp:7:0:
tp-8\Nave\cplusplus\nave/Nave.h:24:40: error: conflicting declaration 'NaveSt* n'
 void ingresarT(Nombre n, Rango r, Nave n);
                                        ^
tp-8\Nave\cplusplus\nave/Nave.h:24:23: note: previous declaration as 'Nombre n'
 void ingresarT(Nombre n, Rango r, Nave n);
                       ^
tp-8\Nave\cplusplus\nave/Nave.h:26:48: error: conflicting declaration 'NaveSt* n'
 Set sectoresAsignados (Nombre n, Rango r, Nave n);
                                                ^
tp-8\Nave\cplusplus\nave/Nave.h:26:31: note: previous declaration as 'Nombre n'
 Set sectoresAsignados (Nombre n, Rango r, Nave n);
                               ^
tp-8\Nave\cplusplus\nave/Nave.h:28:1: error: 'pair' does not name a type
 pair<Set, Componente*> datosDeSector(SectorId sId, Nave n);
 ^~~~
tp-8\Nave\cplusplus\nave/Nave.h:30:1: error: 'Tripulantes' does not name a type
 Tripulantes* tripulantesN (Nave n);
 ^~~~~~~~~~~
tp-8\Nave\cplusplus\nave/Nave.h:32:22: error: variable or field 'agregarASector' declared void
 void agregarASector (Componentes* cs, SectorId sId, Nave n);
                      ^~~~~~~~~~~
tp-8\Nave\cplusplus\nave/Nave.h:32:22: error: 'Componentes' was not declared in this scope
tp-8\Nave\cplusplus\nave/Nave.h:32:35: error: 'cs' was not declared in this scope
 void agregarASector (Componentes* cs, SectorId sId, Nave n);
                                   ^~
tp-8\Nave\cplusplus\nave/Nave.h:32:48: error: expected primary-expression before 'sId'
 void agregarASector (Componentes* cs, SectorId sId, Nave n);
                                                ^~~
tp-8\Nave\cplusplus\nave/Nave.h:32:58: error: expected primary-expression before 'n'
 void agregarASector (Componentes* cs, SectorId sId, Nave n);
                                                          ^
tp-8\Nave\cplusplus\nave/Nave.h:34:50: error: conflicting declaration 'NaveSt* n'
 void asignarASector(Nombre n, SectorId sId, Nave n);
                                                  ^
tp-8\Nave\cplusplus\nave/Nave.h:34:28: note: previous declaration as 'Nombre n'
 void asignarASector(Nombre n, SectorId sId, Nave n);
                            ^
tp-8\Nave\cplusplus\tp-8.exe : El módulo 'tp-8' no pudo cargarse. Para obtener más información, ejecute 'Import-Module tp-8'.
En línea: 1 Carácter: 87
+ ... s\tp-8.exe tp-8\Nave\cplusplus\tp-8.cpp; tp-8\Nave\cplusplus\tp-8.exe
+                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (tp-8\Nave\cplusplus\tp-8.exe:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CouldNotAutoLoadModule
 