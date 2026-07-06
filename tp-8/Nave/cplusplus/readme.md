
Map
Key -> tipo string
value -> tipo Sector o Tripulante

Max Heap -> Tripulante

Set-> SetorId y Nombre

## TP 8 Nave
- cls; g++ -std=c++11 -O2 -o tp-8\Nave\cplusplus\tp-8.exe tp-8\Nave\cplusplus\tp-8.cpp; tp-8\Nave\cplusplus\tp-8.exe



In file included from tp-8\Nave\cplusplus\tp-8.cpp:7:0:
tp-8\Nave\cplusplus\nave/Nave.h:11:8: error: using typedef-name 'Tripulante' after 'struct'
 struct Tripulante; // Asumiendo que existe este tipo
        ^~~~~~~~~~
In file included from tp-8\Nave\cplusplus\map/Map.h:5:0,
                 from tp-8\Nave\cplusplus\tp-8.cpp:2:
tp-8\Nave\cplusplus\map/../Tripulante/Tripulante.h:22:23: note: 'Tripulante' has a previous declaration here
 typedef TripulanteSt* Tripulante;
                       ^~~~~~~~~~
In file included from tp-8\Nave\cplusplus\tp-8.cpp:7:0:
tp-8\Nave\cplusplus\nave/Nave.h:57:1: error: 'Tripulantes' does not name a type
 Tripulantes* tripulantesN(Nave nav);
 ^~~~~~~~~~~
tp-8\Nave\cplusplus\tp-8.exe : El módulo 'tp-8' no pudo cargarse. Para obtener más información, ejecute 'Import-Module tp-8'.
En línea: 1 Carácter: 87
+ ... s\tp-8.exe tp-8\Nave\cplusplus\tp-8.cpp; tp-8\Nave\cplusplus\tp-8.exe
+                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (tp-8\Nave\cplusplus\tp-8.exe:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CouldNotAutoLoadModule
 