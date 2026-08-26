#include "Stack.h"
#include <iostream>
#include <algorithm>

struct StackNodeStr{
    void* value;
    StackNodeStr* next;
};

struct StackStr{
    StackNode first;
};

Stack miStack(){
    Stack r = new StackStr;
    r->first = NULL;
    return r;
}

bool isEmpty(Stack s){
    return s->first == NULL;
}

void push(void* node, int index, Stack s){
    StackNode n = new StackNodeStr;
    n->value = node;
    n->next = s->first;
    s->first = n;
}

void pop(Stack s){
    StackNode n = s->first;
    s->first = s->first->next;
    delete n;
}

void* topNode(Stack s){
    return s->first;
}

