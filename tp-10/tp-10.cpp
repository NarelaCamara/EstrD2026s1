#include <iostream>
using namespace std;
#include "Persona.cpp"
#include "Pokemon.cpp"
#include "Entrenador.cpp"
#include "ArrayList.cpp"

void showList(ArrayList xs)
{
    cout << "Inicio";
    int cant = lengthAL(xs);
    for (int i = 0; i < cant; i++)
    {
        cout << (i == 0 ? " " : " - ") << get(i, xs);
    }
    cout << " fin" << endl;
}

// Devuelve la suma deto dos los elementos.
int sumatoria(ArrayList xs)
{
    int cant = lengthAL(xs);
    int suma = 0;
    for (int i = 0; i < cant; i++)
    {
        suma = suma + get(i, xs);
    }
    return suma;
};

// Incrementa en uno to dos los elementos.
void sucesores(ArrayList xs)
{
    int cant = lengthAL(xs);
    for (int i = 0; i < cant; i++)
    {
        int sum = get(i, xs) + 1;
        set(i, sum, xs);
    };
};

// Indica si el elemento p ertenece a la lista.
bool pertenece(int x, ArrayList xs)
{
    int cant = lengthAL(xs);
    bool p = false;
    for (int i = 0; i < cant; i++)
    {
        p = p || get(i, xs) == x;
    };
    return p;
};

// Indica la cantidad de elementos iguales a x.
int apariciones(int x, ArrayList xs)
{
    int cant = lengthAL(xs);
    int ap = 0;
    for (int i = 0; i < cant; i++)
    {
        int n = get(i, xs) == x ? 1 : 0;
        ap = ap + n;
    };
    return ap;
};

void addList  (ArrayList fxs, ArrayList nxs){
    int cant = lengthAL(fxs);
    for (int i = 0; i < cant; i++)
    {
        int value = get(i, fxs);
        add(value, nxs);
    }
}
// Crea una nueva lista a partir de la primera y la segunda (en ese orden).
ArrayList append(ArrayList xs, ArrayList ys)
{
    int cantX = lengthAL(xs);
    int cantY = lengthAL(ys);
    ArrayList arrayNew = newArrayListWith(cantX + cantY);
    addList(xs, arrayNew);
    addList(ys, arrayNew);
    return arrayNew;
};



// Devuelve el elemento más chico de la lista
int minimo(ArrayList xs) {
    int cant = lengthAL(xs);
    int min = get(0, xs);
    for (int i = 1; i < cant; i++)
    {
        int value = get(i-1, xs);
        min = min <= value ? min : value;
    }
    return min;
};

int main()
{
/*    cout << "Ejercicio 1 ------------------------------------------------" << endl;
    Persona p = consPersona("Persona 1", 666);
    Persona p2 = consPersona("Persona 3", 777);
    cout << " nombreDeLaPersona: p " << nombre(p);
    cout << " edadDeLaPersona: p " << edad(p) << endl;
    cout << " nombreDeLaPersona: p2 " << nombre(p2);
    cout << " edadDeLaPersona: p2 " << edad(p2) << endl;
    crecer(p);
    cout << "crecer: " << edad(p) << endl;
    cambioDeNombre("Persona 2", p);
    cout << "cambioDeNombre: " << nombre(p) << endl;
    cout << "esMayorQueLaOtra: " << esMayorQueLaOtra(p, p2) << endl;
    cout << "laQueEsMayor: " << nombre(laQueEsMayor(p, p2)) << endl;

    cout << "Ejercicio 2 ------------------------------------------------" << endl;
    cout << "Pokemon ------------------------------------------------" << endl;
    Pokemon pokemon1 = consPokemon("Agua");
    Pokemon pokemon2 = consPokemon("Fuego");
    cout << "tipoDePokemon: Pokemon1 " << tipoDePokemon(pokemon1) << endl;
    cout << "tipoDePokemon: Pokemon2 " << tipoDePokemon(pokemon2) << endl;
    cout << "energia: Pokemon1 " << energia(pokemon1) << endl;
    cout << "energia: Pokemon2 " << energia(pokemon2) << endl;
    perderEnergia(50, pokemon1);
    cout << "perderEnergia: Pokemon1 " << energia(pokemon1) << endl
         << "perderEnergia: Pokemon2 " << energia(pokemon2) << endl;
    cout << "superaA: Pokemon1 supera a Pokemon2 " << superaA(pokemon1, pokemon2) << endl;

    cout << "Entrenador ------------------------------------------------" << endl;
    Entrenador entrenador = consEntrenador("Entrenador 1", 2, new Pokemon[2]{pokemon1, pokemon1});
    cout << "nombreDeEntrenador: " << nombreDeEntrenador(entrenador) << endl;
    cout << "cantidadDePokemon: " << cantidadDePokemon(entrenador) << endl;
    cout << "cantidadDePokemonDe: cantidad de Pokemon de tipo Agua " << cantidadDePokemonDe("Agua", entrenador) << endl;
    cout << "pokemonNro: Pokemon numero 1 " << tipoDePokemon(pokemonNro(1, entrenador)) << endl;

    Entrenador entrenador2 = consEntrenador("Entrenador 2", 2, new Pokemon[2]{consPokemon("Planta"), consPokemon("Planta")});
    cout << "leGanaATodos: Entrenador 1 le gana a Entrenador 2 " << leGanaATodos(entrenador, entrenador2) << endl;*/

    cout << "Ejercicio 3 ------------------------------------------------" << endl;
    cout << "Array Lists ------------------------------------------------" << endl;
    ArrayList lista1 = newArrayList();
    add(1, lista1);
    add(2, lista1);
    add(3, lista1);
    add(4, lista1);
    add(5, lista1);
    add(6, lista1);
    cout << lista1->cantidad << endl;
    cout << "length: " << lengthAL(lista1) << endl;
    cout << "get: " << get(0, lista1) << endl;
    resize(4, lista1);

    cout << "resize 4: ";
    showList((lista1));

    add(5, lista1);
    cout << "add(5, lista1): ";
    showList((lista1));

    remove(lista1);
    cout << "remove: ";
    showList(lista1);

    cout << "Ejercicio 4 ------------------------------------------------" << endl;
    cout << "sumatoria: " << sumatoria(lista1) << endl;
    sucesores(lista1);
    cout << "sucesores: ";
    showList(lista1);

    add(2, lista1);
    add(2, lista1);
    cout << "pertenece: " << pertenece(2, lista1) << endl;
    showList(lista1);
    cout << "apariciones: " << apariciones(2, lista1) << endl;

    ArrayList lista2 = newArrayListWith(12);
    add(12, lista2);
    add(22, lista2);
    add(32, lista2);
    add(42, lista2);

    cout << "minimo: " << minimo(lista2) << endl;

    showList(lista1);
    showList(lista2);
    cout << "append: " << endl;
    showList(append(lista1, lista2));
}
/**porque a las primeras dos ejecuciones falla???? wtfff */