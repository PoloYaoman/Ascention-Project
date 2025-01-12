
#ifndef OBJECT 
#define OBJECT 0


class Object {
    U8* name;
    U8* description;
};

Object* initObject(U8* name, U8* desc = "") {
    Object* nobj = MAlloc(sizeof(Object));
    nobj->name = name;
    nobj->description = desc;
    return nobj;
}


#endif