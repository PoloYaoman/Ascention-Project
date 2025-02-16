
#ifndef ROOM 
#define ROOM 0

/*Room controller*/


#include "utilities/rooms_lib.HC"


class Room {
    /* Essentially a linked list */

    I32 num;
    Room* lastRoom;
    Room* nextRoom;
    U8* description;
    Bool visited;

    I64 num_objects;
    Object** objects;
};

Room* InitRoom(Room* l_room) {
    /*Linking adjacent rooms and setting the visited flag*/

    Room* r = MAlloc(sizeof(Room));
    r->lastRoom = l_room;
    r->nextRoom = NULL;
    if (l_room!=NULL) {
        l_room->nextRoom = r;
    }

    GenRoomDescription(r);
    r->visited = 0;
    return r;
}


#endif 