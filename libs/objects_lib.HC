
#ifndef OBJ_LIB
#define OBJ_LIB 0


/*
    A collection of objects
*/


#define OBJ_NUM 3
#define ODESC_NUM 3


#include "classes/Room.HC"
#include "classes/Object.HC"
#include "libs/utils.HC"


U8* objects[OBJ_NUM] = {
    "$$GREEN$$a chalice$$BLUE$$",   //1
    "$$GREEN$$a note$$BLUE$$",      //2
    "$$GREEN$$a key$$BLUE$$"        //3
};


U8** obj_descriptions[ODESC_NUM] = {
    {
        "$$GREEN$$This chalice is carved out of wood. There is a deep rack on the side of it.$$BLUE$$",
        "$$GREEN$$This chalice looks like it's made out of gold, but once you pick it up you realise it is too light to be a precious metal.$$BLUE$$",
        "$$GREEN$$This chalice is warm to the touch.$$BLUE$$"
    },
    {
        "$$GREEN$$The note doesn't say anything, but has a drawing of a river and a bridge, coloured in crayons.$$BLUE$$",
        "$$GREEN$$You recognise your own handwriting, but not the words.$$BLUE$$",
        "$$GREEN$$The note says 'Will be late. Dinner is in the fridge.'$$BLUE$$"
    },
    {
        "$$GREEN$$This key is rusted to the core and is unlikely to open anything.$$BLUE$$",
        "$$GREEN$$This key has a tag on it, which says it belongs to a certain Sarah.$$BLUE$$",
        "$$GREEN$$You recognise that this is a key, but the shapeof it sure is strange.$$BLUE$$"
    }
};


U0 FillObjects (Room* r) {
    // Fills in every "[o]" with a random object

    while(Find(r->description, "[o]")!=NULL) {
        I32 ind = Abs(RandI64 % OBJ_NUM);
        r->description = FindAndReplace(r->description, "[o]", objects[ind]);
        r->num_objects++;

        I32 indd = Abs(RandI64 % ODESC_NUM);
        r->objects = addObject(r->objects, initObject(objects[ind],obj_descriptions[ind][indd]));
    }
    return;
}


#endif