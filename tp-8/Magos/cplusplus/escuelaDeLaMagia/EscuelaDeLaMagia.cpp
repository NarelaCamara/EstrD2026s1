

#include "../set/Set.h"     // Debe definir Set
#include "../map/Map.h"     // Debe definir Map
#include "../maxHeap/MaxHeap.h" // Debe definir MaxHeap
#include "EscuelaDeLaMagia.h"


// costo: Constante O(1), emptyM, EmptyS y EmptyH son de costo O(1)
EscuelaDeMagia fundarEscuela (){
    EscuelaDeLaMagiaSt em = new EscuelaDeLaMagia;
    em->magos= emptyM();
    em->hechizos= emptyS();
    em->ordMagos= emptyH();
    return em;
};

//costo: Constante O(1), sizeS es de costo O(1)
Bool estaVacia(EscuelaDeLaMagia em){
    return sizeS(em->magos) == 0;
};

// O(log M) por insertH  +  O(log K) por assocM =
// costo final de O(log k + M) siendo M la cantidad de magos y K la cantidad de hechizos
void registrar(Nombre n, EscuelaDeLaMagia em){
    Mago m = crearM(n);
    assocM(n, m, em->magos);
    insertH(m, em->ordMagos)
};

//costo: O(k) domM + O(log k) lookupM
// costo final = O(k log k) siendo k la cantidad de Nombres de magos
Mago* magos (EscuelaDeLaMagia em){
    int cant = 0;
    Mago* arregloDeMagos = new Mago[em->magos->cantidad];
    Nombres* arregloDeNombres = domM(em->magos);
    
    while(cant < em->magos->cantidad){
        arregloDeMagos[cant] = lookupM(arregloDeNombre[cant]);
        cant++;
    }
    return arregloDeMagos;
};

// costo:  O(log k) lookupM + O(1) hechizos
// costo final:  O(log k) siendo K la cantidad de Nombres del map de Magos
Set hechizosDe(Nombre n, EscuelaDeLaMagia em){
    Mago m = lookupM(n, em->magos);
    if(m != nullpty){
        return hechizos(m)
    }
    return emptyS();
};

//costo:  O(log k) de lookupM + O(1) de hechizos + O(1) de sizeS 
// costo final: O(log K) siendo K la cantidad de Nombres de magos en el map
int leFaltaAprender(Nombre n, EscuelaDeLaMagia em){
    Mago m = lookupM(n, em->magos);
    Set h =emptyS();
    if(sizeS(em->hechizos) > sizeS(h) ){
        return 0;
    } 
    return sizeS(em->hechizos) - sizeS(h);
};

//O(1) de maxH + O(log k) deleteM + O (log K) deleteMaxH 
//costo final: O(log k) siendo K la cantidad de Nombre de magos en el map.
Mago egresarUno (EscuelaDeLaMagia em){
    Mago m = maxH(em->ordMagos);
    deleteMaxH(em->ordMagos);
    deleteM(nombre(m), em->magos);
    return m;

};

//costo  O(log H) aprender + O(log K ) looupM + 
//O(log K) de assocM + O(log M) insertH
// costo final: O (log H + log K + log M) siendo H la cantidad de hechizos, K la cantidad de Nombres de magos y M la cantidad de magos en el maxHeap
void ensenia(Hechizo h, Nombre n, EscuelaDeLaMagia em){
    Mago m = aprender(lookupM(n, em->magos), h);
    assocM(nombre(m), m, em->magos);
    insertH(m, em->ordMagos);
};

