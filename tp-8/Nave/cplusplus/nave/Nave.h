#ifndef NAVE_H
#define NAVE_H

// 1. Forward declarations (ayuda a romper inclusiones circulares si las hay)
// Si Map, Set, etc. son structs, decláralos así. Si son clases, usa 'class'.
// Ajusta esto según cómo estén definidos en shared.h o sus propios .h
struct MapSt; 
struct SetSt;
struct MaxHeapSt;
struct Componente; 

// 2. Inclusión de dependencias
// Si esto causa error de inclusión circular, mueve estos #include al Nave.cpp
// y deja solo las forward declarations de arriba en este .h
#include <iostream>
#include <string>
#include <utility> // Para std::pair

using std::string;
using std::pair;

#include "../shared.h"      // Debe definir SectorId, Nombre, Rango, etc.
#include "../set/Set.h"     // Debe definir Set
#include "../map/Map.h"     // Debe definir Map
#include "../maxHeap/MaxHeap.h" // Debe definir MaxHeap
#include "../componente/componente.h" // Debe definir Componente

// 3. Definición de la estructura
struct NaveSt {
    Map sectores;
    Map tripulantes;
    MaxHeap OrdRangoTripulantes;
};

// 4. Typedef (Ahora NaveSt ya está completamente definido)
typedef NaveSt* Nave;

// 5. Prototipos de funciones corregidos
// Nota: Se cambió el nombre del parámetro 'Nave n' a 'nav' para evitar confusión
// y se corrigieron los tipos de retorno hipotéticos (Tripulantes* -> Tripulante* o Set)

Nave construir(SectorId ss);

// Corregido: 'Nombre n' es el nombre del tripulante, 'nav' es la nave
void ingresarT(Nombre nom, Rango r, Nave nav);

// Devuelve un Set de sectores (asumiendo que Set es el tipo correcto)
Set sectoresAsignados(Nombre nom, Rango r, Nave nav);

// Asumiendo que Componente* es lo que quieres, no Componentes*
pair<Set, Componente*> datosDeSector(SectorId sId, Nave nav);

// CORRECCIÓN CRÍTICA: ¿Qué es Tripulantes*? ¿Es un Set? ¿Un array?
// Si devuelves un puntero a un tripulante específico o una lista:
// Opción A: Si devuelves un Set de tripulantes
Tripulante* tripulantesN(Nave nav); 
// Opción B: Si devuelves un puntero a un array (poco recomendable en C++ moderno)
// Tripulante* tripulantesN(Nave nav); 

// Corregido: Componentes* -> Componente* (puntero a un componente o array)
void agregarASector(Componente* cs, SectorId sId, Nave nav);

void asignarASector(Nombre nom, SectorId sId, Nave nav);

int testNave();

#endif // NAVE_H   