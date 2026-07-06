#include "../tripulante/Tripulante.h"
#include "../sector/Sector.h"
#include "Value.h"

// --- Implementación Privada ---

void Value::destruir() {
    if (tipo == TipoValue::TRIPULANTE) {
        datos.tripulante.~Tripulante();
    } else if (tipo == TipoValue::SECTOR) {
        datos.sector.~Sector();
    }
    tipo = TipoValue::NINGUNO;
}

void Value::copiar(const Value& otro) {
    this->tipo = otro.tipo;
    if (tipo == TipoValue::TRIPULANTE) {
        new (&datos.tripulante) Tripulante(otros.datos.tripulante);
    } else if (tipo == TipoValue::SECTOR) {
        new (&datos.sector) Sector(otros.datos.sector);
    }
    // Si es NINGUNO, no hacemos nada
}

// --- Constructores ---

Value::Value() : tipo(TipoValue::NINGUNO) {
    // No hay nada que construir en la unión
}

Value::Value(const Tripulante& t) : tipo(TipoValue::TRIPULANTE) {
    // Construcción manual en la memoria de la unión
    new (&datos.tripulante) Tripulante(t);
}

Value::Value(const Sector& s) : tipo(TipoValue::SECTOR) {
    // Construcción manual en la memoria de la unión
    new (&datos.sector) Sector(s);
}

// --- Destructor y Copia ---

Value::~Value() {
    destruir();
}

Value::Value(const Value& otro) : tipo(TipoValue::NINGUNO) {
    copiar(otro);
}

Value& Value::operator=(const Value& otro) {
    if (this != &otro) {
        destruir();   // 1. Limpiar el contenido actual
        copiar(otro); // 2. Copiar el nuevo contenido
    }
    return *this;
}

// --- Métodos Públicos ---

bool Value::esTripulante() const {
    return tipo == TipoValue::TRIPULANTE;
}

bool Value::esSector() const {
    return tipo == TipoValue::SECTOR;
}

Tripulante& Value::getTripulante() {
    return datos.tripulante;
}

const Tripulante& Value::getTripulante() const {
    return datos.tripulante;
}

Sector& Value::getSector() {
    return datos.sector;
}

const Sector& Value::getSector() const {
    return datos.sector;
}   