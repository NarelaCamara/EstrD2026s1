#ifndef VALUE_H
#define VALUE_H

#include "../tripulante/Tripulante.h"
#include "../sector/Sector.h"
#include <new>          // Necesario para placement new

// Enumeración para identificar el tipo activo
enum class TipoValue {
    NINGUNO,
    TRIPULANTE,
    SECTOR
};

class Value {
private:
    TipoValue tipo;

    // Unión de almacenamiento crudo
    union Almacen {
        Tripulante tripulante;
        Sector sector;

        // Constructor y destructor vacíos (requerido en C++11)
        Almacen() {}
        ~Almacen() {}
    } datos;

    // Funciones helper privadas para limpieza
    void destruir();
    void copiar(const Value& otro);

public:
    // Constructores
    Value();
    Value(const Tripulante& t);
    Value(const Sector& s);

    // Regla de los tres: Destructor y Operador de Copia
    ~Value();
    Value(const Value& otro);
    Value& operator=(const Value& otro);

    // Consultas de tipo
    bool esTripulante() const;
    bool esSector() const;
    TipoValue getTipo() const { return tipo; }

    // Acceso a datos (El usuario debe verificar el tipo antes de llamar)
    Tripulante& getTripulante();
    const Tripulante& getTripulante() const;
    
    Sector& getSector();
    const Sector& getSector() const;
};

#endif // VALUE_H   