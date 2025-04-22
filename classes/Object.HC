
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
        "Memory allocated\n";
        MemCpy(n_array, list, MSize(list));
        "Initial list copied\n";
        MemCpy(n_array+MSize(list), &obj, sizeof(Object*));
        "Object added\n";
    } else {
        n_array = MAlloc(sizeof(Object*));
        *n_array = obj;
    }
 
    // I32 i = 0;
    // while (n_array[i]->name != NULL) {
    //     "\nNew object : %s\n", n_array[i]->name;
    //     i++;
    // }

    return n_array;
}

U0 removeObject(Object** list, I64 ind) {
    // Removes object at ind and pushes back following items

    I64 i = ind;
    while (list[i+1] != NULL) {
        list[i] = list[i+1];
        i++;
    }
    Free(list[i]);
}


// U0 FreeObject(Object* obj) {
//     // Clears the object

//     Free(obj->name);
//     Free(obj->description);
//     Free(obj);
// }


#endif