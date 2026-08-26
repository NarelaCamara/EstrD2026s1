#include <iostream>
#include "MiniFS.h"
#include "Stack.h"
#include <ostream>
using namespace std;

struct FSNode {
    string nombre;
    bool isFile;
    FSNode** children;
    int childCount;
};

struct FSStr {
    FSNode* current;
    Stack path;
    int capacidad;
};

/*
INV. REP.:
    FSStr
    * MiniFS no es NULL.
    * Current no es NULL, es un puntero a un nodo valido.
    * Capacidad tiene que ser mayor a 0.
    * Si path tiene elementos 
        - Es un stack en el cual cada nodo es hijo del esta debajo
        - El nodo actual es hijo del tope del stack
        - La base del stack es el nodo raiz 
    * Si path esta vacio current es la raiz del FileSystem 

    FSNode
    * Si isFile es true
        - Children es NULL
        - Childcount es 0
    * Si ifFile es false 
        - Children es un Array de tamaño capacidad 
        - Childcount es menor que capacidad 
    * Dos nodos no pueden se ancestros entre si (no puede haber ciclos)
*/

FSNode* createNode(string name, bool isFile, int capacidad){
    FSNode* nodo = new FSNode;
    nodo->nombre = name;
    nodo->isFile = isFile;
    nodo->childCount = 0;
    if(!isFile && capacidad > 0){
        nodo->children = new FSNode* [capacidad];
    }
    else{
        nodo->children = NULL;
    }
    return nodo;
}

MiniFS mkFS (string name, int capacidad){
    MiniFS fs = new FSStr;
    fs->current = createNode(name, false, capacidad);
    fs->path = miStack();
    fs->capacidad = capacidad;
    return fs;
}

bool hayNombre(FSNode* node, string name){
    //Verifica si el nombre dado se encuentra en la estructura dada
    int i = 0;
    while(i < node->childCount && node->children[i]->nombre != name){
        i++;
    }
    return 1 <= node->childCount;
}

void mkdir(string name, MiniFS fs){
    //Agrega un nuevo directorio como hijo del nodo actual, si hay espacio y no hay otro archivo o directorio con dicho nombre
    if(fs->current->childCount < fs->capacidad && !fs->current->isFile && !hayNombre(fs->current, name)){
        fs->current->children[fs->current->childCount++] = createNode(name, false, fs->capacidad);
    }
}

void touch(string name, MiniFS fs){
    //Agrega un archivo nuevo como hijo del nodo actual, si hay espacio y no hay otro archivo o directorio con ese nombre
    if(fs->current->childCount < fs->capacidad && !fs->current->isFile && !hayNombre(fs->current, name)){
        fs->current->children[fs->current->childCount++] = createNode(name, true, 0);
    }
}

void cd(int index, MiniFS fs){
    //Se mueve al hijo index del directorio actual. Si el nodo actual no es un archivo o no existe el index indicado
    if(!fs->current->isFile && index >= 0 && index < fs->current->childCount){
        push(fs->current, index, fs->path);
        fs->current = fs->current->children[index];
    }
}

void cdUp(MiniFS fs){
    //Sube un nivel en el sistema. Si esta en la raiz no hace nada.
    if(!isEmpty(fs->path)){
        fs->current = (FSNode* ) topNode(fs->path);
        pop(fs->path);
    }
}

void ls(MiniFS fs){
    //Imprime los nombres de los hijos del nodo actual, si el nodo actual es un directorio. No hace nada.
    for(int i = 0; i < fs->current->childCount; i++){
        print(fs->current->children[i]->nombre);
    } 
}

void rm(int index, MiniFS fs){
    //Elimina el archivo en la posicion dada (si existe) en el directorio actual y mueve los demas hijos 
    if(index >= 0 && index < fs->current->childCount && fs->current->children[index]->isFile){
        delete fs->current->children[index];
        for(int i = index; i < fs->current->childCount; i++){
            fs->current->children[i] = fs->current->children[i++];
        }  
    }
    fs->current->childCount --;
}

int childCount(MiniFS fs){
    return fs->current->childCount;
}

string currentName(MiniFS fs){
    return fs->current->nombre;
}

bool isFile(MiniFS fs){
    return fs->current->isFile;
}

void print(string content){
    cout << content << endl;
}