
#ifndef OBJECT 
#define OBJECT 0


/*
    Object controller
*/


class Object {
    U8* name;
    U8* description;
};


Object* initObject(U8* name, U8* desc = "") {
    // Creates a new object

    Object* nobj = MAlloc(sizeof(Object));
    nobj->name = name;
    nobj->description = desc;
    return nobj;
}


Object** addObject(Object** list, Object* obj) {
    // Adds an object to an existing list

    Object** n_array = MAlloc(MSize(list)+sizeof(Object));
    Object** ptr = n_array;
    MemCpy(ptr, list, MSize(list));
    ptr += MSize(list);
    MemCpy(ptr, &obj, MSize(obj));
    return n_array;
}


// U0 FreeObject(Object* obj) {
//     // Clears the object

//     Free(obj->name);
//     Free(obj->description);
//     Free(obj);
// }


#endif