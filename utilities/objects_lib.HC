
#ifndef OBJ_LIB
#define OBJ_LIB 0


#define OBJ_NUM 3


class Room {};

#include "classes/Object.HC"
#include "utilities/string_ops.HC"
#include "classes/Room.HC"


U8* objects[OBJ_NUM] = {
    "a chalice",
    "a note",
    "a key"
};

U0 InsObjects (Room* r) {
    I64 num_obj = 0;
    while (num < r->num_objects) {
        I64 ind = Abs(RandI64 % OBJ_NUM);
        Object* n_obj = initObject(objects[ind]);
        FindAndReplace(r->desc, "[o]", n_obj->name);
    }
}


#endif