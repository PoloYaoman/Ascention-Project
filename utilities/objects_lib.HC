
#ifndef OBJ_LIB
#define OBJ_LIB 0


#define OBJ_NUM 3


// class Room {
//     I64 num_objects;
//     U8* description;
// };

#include "classes/Room.HC"
#include "classes/Object.HC"
#include "utilities/string_ops.HC"


U8* objects[OBJ_NUM] = {
    "a chalice",
    "a note",
    "a key"
};


U0 InsObjects (Room* r) {
    I64 num_obj = 0;
    while (num_obj < r->num_objects) {
        I64 ind = Abs(RandI64 % OBJ_NUM);
        Object* n_obj = initObject(objects[ind]);
        r->description = FindAndReplace(r->description, "[o]", n_obj->name);
        num_obj++;
    }
}


#endif