#include <iostream>
#include "Persona.h"
#include "Pokemon.h"
#include "Entrenador.h"
using namespace std;

// TP 10 - Ejercicio 1: Registros - 1.1

Persona pepe = consPersona("pepito", 25);
Persona tatu = consPersona("tatu", 25);

void showPersona(Persona p) {
    cout << "Persona " << p << " <- celda de memoria" << endl;
    cout << "   nombre: " << nombre(p) << endl;
    cout << "   edad:   " << edad(p) << endl;
}

void mainPersona() {
    showPersona(pepe);
    if(esMayorQueLaOtra(pepe, tatu)) { cout << "True" << endl;} else { cout << "False" << endl;}
    cout << "se esperaba False" << endl;
    crecer(pepe);
    showPersona(pepe);
    if(esMayorQueLaOtra(pepe, tatu)) { cout << "True" << endl;} else { cout << "False" << endl;}
    cout << "se esperaba True" << endl;
    cambioDeNombre("pepita", pepe);
    showPersona(laQueEsMayor(pepe, tatu));
    cout << "se esperaba pepita con 26" << endl;
    crecer(tatu);
    showPersona(tatu);
    showPersona(laQueEsMayor(pepe, tatu));
}

// TP 10 - Ejercicio 1: Registros - 1.2
 
Pokemon charmander = consPokemon("Fuego"); 
Pokemon flareon    = consPokemon("Fuego"); 
Pokemon squirtle   = consPokemon("Agua");   
Pokemon chicorita  = consPokemon("Planta");
Pokemon star       = consPokemon("Agua");
Pokemon magikarp   = consPokemon("Agua");
Pokemon lapras     = consPokemon("Agua");
Pokemon vaporeon   = consPokemon("Agua");
Pokemon ivy        = consPokemon("Planta");
Pokemon cactus     = consPokemon("Planta");

Pokemon pokesDeAsh[6]      = {charmander, squirtle, star, magikarp, lapras, chicorita};
Pokemon pokesDeMistica[4]  = {star, magikarp, lapras, vaporeon};
Pokemon pokesDeBrooklyn[2] = {ivy, cactus};

Entrenador ash      = consEntrenador("Ash", 6, pokesDeAsh);
Entrenador mistica  = consEntrenador("Mistica", 4, pokesDeMistica);
Entrenador brooklyn = consEntrenador("Brooklyn", 2, pokesDeBrooklyn);
Entrenador rookie   = consEntrenador("Rookie", 0, NULL);

void showPoke(Pokemon p) {
    cout << "Pokemon: " << p << " -> tipo: " <<  tipoDePokemon(p) << " / energ: " << energia(p) << endl; 
}

void testSuperaA(Pokemon p1, Pokemon p2, string r) {
    if (superaA(p1, p2)) { cout << "rta: true" << "  / esperable: " << r << endl;}
     else { cout << "rta: false" << " / esperable: " << r << endl;}
}

void testLeGanaATodos(Entrenador e1, Entrenador e2, bool esperable) {
    cout << nombreDeEntrenador(e1) << " tiene al menos uno que le gana a todos los de " << nombreDeEntrenador(e2) << endl;
    cout << "Esperable: " << ends; if(esperable==1) { cout << "true // ";} else { cout << "false  // ";} 
    cout << "Obtenido: " << ends; if( leGanaATodos(e1, e2)==1) { cout << "true" << ends;} else { cout << "false" << ends;} 
    cout << " ==> " << ends;
    if (leGanaATodos(e1, e2) == esperable) { cout << "PASSED" << endl;}
                                      else { cout << "ERROR" << endl;}
}


void printLinea(){
  cout << "-------------------------------------------------------------------------" << endl;
}

void mainPokemon() {
    // showPoke(charmander);
    // perderEnergia(150, charmander);
    // showPoke(charmander);
     testSuperaA(charmander, chicorita, "true");
     testSuperaA(charmander, squirtle, "false");
     testSuperaA(charmander, flareon, "false");
     testSuperaA(squirtle, flareon, "true");
     testSuperaA(squirtle, squirtle, "false");
     testSuperaA(squirtle, cactus, "false");
     testSuperaA(chicorita, squirtle, "true");
     testSuperaA(chicorita, charmander, "false");
     testSuperaA(chicorita, cactus, "false");
    cout << cantidadDePokemonDe("Fuego", ash) << " / esperable: 1" << endl;
    cout << cantidadDePokemonDe("Planta", brooklyn) << " / esperable: 2" << endl;
    cout << cantidadDePokemonDe("Agua", brooklyn) << " / esperable: 0" << endl;
    cout << cantidadDePokemonDe("Agua", mistica) << " / esperable: 4" << endl;
    cout << cantidadDePokemonDe("Agua", rookie) << " / esperable: 0" << endl;
//
  //  showPoke(pokemonNro(3, ash));
  //  cout << "esperable: " << endl;
  //  showPoke(chicorita);
//
  //  showPoke(pokemonNro(1, mistica));
  //  cout << "esperable: " << endl;
  //  showPoke(star);
    /* 
   testLeGanaATodos(ash, mistica, true);
    printLinea();
    testLeGanaATodos(mistica, ash, false);
    printLinea();
    testLeGanaATodos(brooklyn, mistica, true);
    printLinea();
    testLeGanaATodos(brooklyn, ash, false);
    printLinea();
    testLeGanaATodos(rookie, ash, false);
    printLinea();
    testLeGanaATodos(rookie, mistica, false);
    printLinea();
    testLeGanaATodos(mistica, rookie, true);
    printLinea();
    testLeGanaATodos(ash, rookie, true);
  */
}



main(){
    //mainPersona();
    //printLinea();   
    mainPokemon();
}