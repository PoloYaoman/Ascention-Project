
#ifndef OBJ_LIB
#define OBJ_LIB 0


/*
    A collection of objects
*/


#define OBJ_NUM 3


#include "classes/Room.HC"
#include "classes/Object.HC"
#include "libs/utils.HC"


U8* objects[OBJ_NUM] = {
    "$$GREEN$$a chalice$$BLUE$$",   //1
    "$$GREEN$$a note$$BLUE$$",      //2
    "$$GREEN$$a key$$BLUE$$"        //3
};


U0 FillObjects (Room* r) {
    // Fills in every "[o]" with a random object

    while(Find(r->description, "[o]")!=NULL) {
        I32 ind = Abs(RandI64 % OBJ_NUM);
        r->description = FindAndReplace(r->description, "[o]", objects[ind]);
        r->num_objects++;
        r->objects = addObject(r->objects, initObject(objects[ind]));
    }
    return;
}


#endif