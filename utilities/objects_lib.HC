
#ifndef OBJ_LIB
#define OBJ_LIB 0


#define OBJ_NUM 3

#include "classes/Object.HC"
#include "utilities/string_ops.HC"
#include "classes/Room.HC"


U8* objects[OBJ_NUM] = {
    "a chalice",
    "a note",
    "a key"
};

U0 InsObjects(Room* r) {
    
    FindAndReplace(desc);
}


#endif