
#ifndef PERSON
#define PERSON 0


class Person {
    U8* name;
    U8* description;
    U8* words;
};

Person* InitPerson(U8* name, U8* desc = "\n", U8* words = "\n") {
    // Creates a new person

    Person* p = MAlloc(sizeof(Person));
    p->name = name;
    p->description = desc;
    p->words = words;
    return p;
}


U0 addPerson(Object*** list, Person* prs) {
    // Adds an object to an existing list

    if (*list != NULL) {
        *list = ReAlloc(list, MSize(list)+sizeof(Person*));
        MemCpy(*list+MSize(*list), &prs, sizeof(Person*));
    } else {
        *list = MAlloc(sizeof(Person*));
        **list = prs;
    }
}



#endif