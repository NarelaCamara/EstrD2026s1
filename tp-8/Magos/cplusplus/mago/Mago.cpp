#include "../set/Set.h"

Mago crearM (Nombre n){
    MagoSt* m = new MagoSt;
    m->nombre=n;
    m->hechizos= emptyS();
    return m;
};

Nombre nombre (Mago m){
    return m->nombre;
};

void aprender (Hechizo h, Mago m){
    addS(h, m->hechizos);
};

Set hechizos (Mago m){
    return m->hechizos;
};

void showMago(Mago m){
    cout << "Nombre: " << nombre(m) << endl;
    cout << "Hechizos: ";
    showS(hechizos(m));
};

int testMago() {
    cout << "Test Mago" << endl;
    Mago m = crearM("Gandalf");
    aprender("Luz", m);
    aprender("Fuego", m);
    showMago(m);
    cout << "======================" << endl;
    return 0;
};