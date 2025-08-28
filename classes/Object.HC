
#ifndef OBJECT 
#define OBJECT 0

#include "libs/utils.HC"


/*
    Object controller
*/


class Object {
    U8* name;
    U8* description;
};


Object* initObject(U8* name, U8* desc = "\n") {
    // Creates a new object

    Object* nobj = MAlloc(sizeof(Object));
    nobj->name = name;
    nobj->description = desc;
    return nobj;
}


// Object** addObject(Object** list, Object* obj) {
//     // Adds an object to an existing list

//     Object** n_array;

//     if (list != NULL) {
//         n_array = MAlloc(MSize(list)+sizeof(Object*));
//         MemCpy(n_array, list, MSize(list));
//         MemCpy(n_array+MSize(list), &obj, sizeof(Object*));
//     } else {
//         n_array = MAlloc(sizeof(Object*));
//         *n_array = obj;
//     }

//     return n_array;
// }

U0 addObject(Object*** list, Object* obj) {
    // Adds an object to an existing list

    if (*list != NULL) {
        *list = ReAlloc(list, MSize(list)+sizeof(Object*));
        MemCpy(*list+MSize(*list), &obj, sizeof(Object*));
    } else {
        *list = MAlloc(sizeof(Object*));
        **list = obj;
    }
}

U0 removeObject(Object*** list, I64 ind) {
    // Removes object at ind and pushes back following items

    I64 i = ind;
    Object* listp = (*list)[ind+1];
    while (listp != NULL) {
        (*list)[i] = listp;
        i++;
        listp = (*list)[i+1];
    }
    *list = ReAlloc(*list, MSize(*list)-sizeof(Object*));
}


// U0 FreeObject(Object* obj) {
//     // Clears the object

//     Free(obj->name);
//     Free(obj->description);
//     Free(obj);
// }


#endif