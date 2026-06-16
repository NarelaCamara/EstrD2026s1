# Estructuras de datos

Lista de videos

[![Estructuras de Datos - Clase 1](https://img.youtube.com/vi/CW09lRWB1cY/0.jpg)](https://www.youtube.com/watch?v=CW09lRWB1cY)

Tarea

- Añadir invariantes
- costos

C++ / C
Comando para compilar y ejecutar el programa a la vez:

- cls; g++ -std=c++11 -O2 -o tp-9\tp-9.exe tp-9\tp-9.cpp; tp-9\tp-9.exe
- cls; g++ -std=c++11 -O2 -o tp-10\tp-10.exe tp-10\tp-10.cpp; tp-10\tp-10.exe
- cls; g++ -std=c++11 -O2 -o tp-11\tp-11.exe tp-11\tp-11.cpp; tp-11\tp-11.exe
- cls; g++ -std=c++11 -O2 -o acceso-memoria.exe acceso-memoria.cpp; .\acceso-memoria.exe

Memoria -> Espacio que tenemos para guardar datos.
haskell -> Maneja la memoria automáticamente, no tenemos que preocuparnos por liberar memoria.
Manejo de memoria automatica -> Garbage Collector (GC) -> Se encarga de liberar memoria automáticamente cuando ya no se necesita.
C++ -> Tenemos que gestionar la memoria manualmente, utilizando new y delete. Utiliza memoria estatica y dinamica.
Memoria estatica -> Se asigna en tiempo de compilación, no cambia durante la ejecución.
Memoria dinamica -> Se asigna en tiempo de ejecución, puede cambiar durante la ejecución.

-- TAREA IMPORTANTE HACER EL GRAFICO DE COMO SE MUEVE LA MEMORIA

BFS (Búsqueda en Amplitud) y DFS (Búsqueda en Profundidad) 


BFS (Amplitud): Imagina que es como una ola en el agua. Desde el nodo inicial, primero miras a todos los nodos directamente conectados a él. Luego, a todos los nodos conectados a esos, y así sucesivamente. Para más detalles sobre cómo este algoritmo recorre los grafos, puedes consultar la Diferencia entre BFS y DFS - GeeksforGeeks.

DFS (Profundidad): Piensa en explorar un laberinto. Caminas por un pasillo hacia adelante todo lo que puedas sin detenerte. Cuando llegas a una pared (un nodo sin explorar), das un paso atrás y tomas la siguiente bifurcación