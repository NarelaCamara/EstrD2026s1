

Sector crearS(SectorId sId){
    Sector s = new SectorSt;
    s->sectorId = sId;
    s->componentes = vector<Componente>();
    s->tripulantes = emptyS();
    return s;
};

SectorId sectorId(Sector s){
    return s->sectorId;
};

Componente[] componentesS (Sector s){
    return s->componentes;
};

Set tripulantesS (Sector s){
    return s->tripulantes;
};

void agregarC (Componente c, Sector s){
    Set componentes = s->componentes;
    componentes = addS(c, componentes);
    s->componentes = componentes;
};

void agregarT (Tripulant t, Sector s){
    Set tripulantes = s->tripulantes;
    tripulantes = addS(t, tripulantes);
    s->tripulantes = tripulantes;
};
