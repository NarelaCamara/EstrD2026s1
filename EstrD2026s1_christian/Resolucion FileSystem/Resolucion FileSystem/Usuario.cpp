#include "MiniFS.h"
#include <iostream> 
using namespace std;

int countFiles(MiniFS fs){
    int count = 0;
    if(isFile(fs)){
        count ++;
    }
    else {
        for(int i = 0; i < childCount(fs); i++){
            cd(i, fs);
            count += countFiles(fs);
            cdUp(fs);
        }
    }
    return count;
}

void cdPath(MiniFS fs, string* path, int len){
    //PRECOND: La ruta es valida a partir de la posicion actual, por lo tanto, se que la posicion actual es un directorio.
    for(int i = 0; i< len; i++){
        string next = path[i];
        int j = 0;
        cd(j, fs);
        while(currentName(fs) != next){
            cdUp(fs);
            cd(++j, fs);
        }
    }
}

