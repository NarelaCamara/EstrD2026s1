struct StackNodeStr;
typedef StackNodeStr* StackNode;
struct StackStr;
typedef StackStr* Stack;

Stack miStack();

bool isEmpty(Stack s);

void push(void* node, int index, Stack s);

void pop(Stack s);

void* topNode(Stack s);