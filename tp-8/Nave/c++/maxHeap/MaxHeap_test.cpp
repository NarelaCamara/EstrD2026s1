#include <iostream>
#include "MaxHeap.h"

using namespace std;

int testMaxHeap() {
    MaxHeap h = emptyH();
    cout << "Is the heap empty? " << (isEmptyH(h) ? "Yes" : "No") << endl;

    insertH(10, h);
    insertH(20, h);
    insertH(5, h);
    insertH(30, h);

    cout << "Max element: " << maxH(h) << endl;
    showMH(h);

    deleteMaxH(h);
    cout << "After deleting max, new max: " << maxH(h) << endl;
    showMH(h);

    return 0;
}