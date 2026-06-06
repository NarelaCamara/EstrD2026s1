#include <iostream>
using namespace std;
#include "Persona.cpp"
#include "Pokemon.cpp"
#include "Entrenador.cpp"
#include "ArrayList.cpp"

int main()
{
    cout << "Ejercicio 1" << endl;
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

    cout << "Ejercicio 2";
    cout << "Pokemon";
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

    cout << "Entrenador";
    Entrenador entrenador = consEntrenador("Entrenador 1", 2, new Pokemon[2]{pokemon1, pokemon1});
    cout << "nombreDeEntrenador: " << nombreDeEntrenador(entrenador) << endl;
    cout << "cantidadDePokemon: " << cantidadDePokemon(entrenador) << endl;
    cout << "cantidadDePokemonDe: cantidad de Pokemon de tipo Agua " << cantidadDePokemonDe("Agua", entrenador) << endl;
    cout << "pokemonNro: Pokemon numero 1 " << tipoDePokemon(pokemonNro(1, entrenador)) << endl;

    Entrenador entrenador2 = consEntrenador("Entrenador 2", 2, new Pokemon[2]{consPokemon("Planta"), consPokemon("Planta")});
    cout << "leGanaATodos: Entrenador 1 le gana a Entrenador 2 " << leGanaATodos(entrenador, entrenador2) << endl;

    cout << "Ejercicio 3" << endl;
    cout << "Array Lists" << endl;

    ArrayList lista1 = newArrayList();
    add(lista1, 1);
    add(lista1, 2);

    cout << lista1->cantidad << endl;
    cout << "length: " << length(lista1) << endl;
    cout << "get: " << get(lista1, 0) << endl;

    resize(lista1, 10);
    cout << "length: " << length(lista1) << endl;

    add(lista1, 3);
    cout << "get: " << get(lista1, 2) << endl;

    remove(lista1);
    cout << "length: " << length(lista1) << endl;

    /*
    int sumatoria(ArrayList xs)
    Devuelve la suma de to dos los elementos.
    2. void sucesores(ArrayList xs)
    Incrementa en uno to dos los elementos.
    3. bool pertenece(int x, ArrayList xs)
    Indica si el elemento p ertenece a la lista.
    4. int apariciones(int x, ArrayList xs)
    Indica la cantidad de elementos iguales a x.
    5. ArrayList append(ArrayList xs, ArrayList ys)
    Crea una nueva lista a partir de la primera y la segunda (en ese orden).
    Página 3 de 4
    Estructuras de datos - UNQ
    6. int minimo(ArrayList xs)
    Devuelve el elemento más chico de la lista
    */
}