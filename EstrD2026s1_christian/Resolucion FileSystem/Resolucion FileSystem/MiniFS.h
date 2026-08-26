using namespace std;

struct FSStr;
typedef FSStr* MiniFS;
struct FSNode;

FSNode* createNode(string name, bool isFile, int capacidad);

MiniFS mkFS (string name, int capacidad);

bool hayNombre(FSNode* node, string name);

void mkdir(string name, MiniFS fs);

void touch(string name, MiniFS fs);

void cd(int index, MiniFS fs);

void cdUp(MiniFS fs);

void ls(MiniFS fs);

void rm(int index, MiniFS fs);

int childCount(MiniFS fs);

bool isFile(MiniFS fs);

string currentName(MiniFS fs);
