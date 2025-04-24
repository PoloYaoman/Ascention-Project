
#ifndef OBJECT 
#define OBJECT 0


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


Object** addObject(Object** list, Object* obj) {
    // Adds an object to an existing list

    Object** n_array;

    if (list != NULL) {
        n_array = MAlloc(MSize(list)+sizeof(Object*));
        MemCpy(n_array, list, MSize(list));
        MemCpy(n_array+MSize(list), &obj, sizeof(Object*));
    } else {
        n_array = MAlloc(sizeof(Object*));
        *n_array = obj;
    }

    return n_array;
}

Object** removeObject(Object** list, I64 ind) {
    // Removes object at ind and pushes back following items

    Object** nlist;
    I64 i = ind;
    while (i<ind) {
        addObject(nlist, list[i]);
        i++;
    }
    list = list+i;
    while (*list != NULL) {
        addObject(nlist, *list);
        list++;
    }
    return nlist;
}


// U0 FreeObject(Object* obj) {
//     // Clears the object

//     Free(obj->name);
//     Free(obj->description);
//     Free(obj);
// }


#endif