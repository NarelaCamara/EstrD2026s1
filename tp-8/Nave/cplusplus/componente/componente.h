#ifndef COMPONENTE_H
#define COMPONENTE_H

// Configuración de límites
const int MAX_BARRILES = 50;
const int MAX_NOMBRE_LANZA = 64;

// --- Definiciones de Tipos ---

struct Barril {
    int id;
    int capacidad;
};

struct Motor {
    int numero;
    int potencia;
};

struct Almacen {
    Barril barriles[MAX_BARRILES];
    int cantidad; // Control manual del tamaño
};

struct LanzaTorpedos {
    char nombre[MAX_NOMBRE_LANZA];
    int municion;
};

// --- Enumeración de Tipos ---

enum TipoComponente {
    TIPO_MOTOR,
    TIPO_ALMACEN,
    TIPO_LANZA
};

// --- Definición de Componente ---

struct Componente {
    TipoComponente tipo;

    // Unión interna para ahorrar memoria
    union Datos {
        Motor motor;
        Almacen almacen;
        LanzaTorpedos lanza;

        // Constructores/Destructores necesarios para C++11
        Datos() {}
        ~Datos() {}
    } datos;

    // --- Constructores ---
    Componente(); // Por defecto (Motor vacío)
    Componente(int numMotor, int pot);
    Componente(const Barril* listaBarriles, int cant);
    Componente(const char* nombre, int mun);

    // --- Destructor ---
    ~Componente();

    // --- Helpers de Acceso (Getters) ---
    // Nota: El usuario debe verificar 'tipo' antes de llamar a estos o usar con cuidado
    Motor& getMotor();
    Almacen& getAlmacen();
    LanzaTorpedos& getLanza();
};

#endif // COMPONENTE_H   