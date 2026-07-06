#include "Componente.h"
#include "../shared.h"
#include <cstring> // Para strncpy

// Constructor por defecto: Inicializa como Motor vacío
Componente::Componente() : tipo(TIPO_MOTOR) {
    datos.motor.numero = 0;
    datos.motor.potencia = 0;
}

// Constructor para Motor
Componente::Componente(int numMotor, int pot) : tipo(TIPO_MOTOR) {
    datos.motor.numero = numMotor;
    datos.motor.potencia = pot;
}

// Constructor para Almacen
Componente::Componente(const Barril* listaBarriles, int cant) : tipo(TIPO_ALMACEN) {
    datos.almacen.cantidad = (cant > MAX_BARRILES) ? MAX_BARRILES : cant;
    if (datos.almacen.cantidad < 0) datos.almacen.cantidad = 0;

    for (int i = 0; i < datos.almacen.cantidad; ++i) {
        datos.almacen.barriles[i] = listaBarriles[i];
    }
    // Rellenar el resto si es necesario o dejar basura controlada
}

// Constructor para LanzaTorpedos
Componente::Componente(const char* nombre, int mun) : tipo(TIPO_LANZA) {
    datos.lanza.municion = mun;
    // Copia segura de string
    strncpy(datos.lanza.nombre, nombre, MAX_NOMBRE_LANZA - 1);
    datos.lanza.nombre[MAX_NOMBRE_LANZA - 1] = '\0'; // Asegurar terminación nula
}

// Destructor
Componente::~Componente() {
    // No es necesario limpiar memoria manualmente porque usamos arrays estáticos.
    // Si usáramos 'new' dentro de la unión, aquí haríamos el 'delete' correspondiente según 'tipo'.
}

// Implementación de Helpers
Motor& Componente::getMotor() {
    return datos.motor;
}

Almacen& Componente::getAlmacen() {
    return datos.almacen;
}

LanzaTorpedos& Componente::getLanza() {
    return datos.lanza;
}   