
#ifndef ROOM 
#define ROOM 0


/*
Room controller
Essentially creates and navigates a linked list
*/


#include "classes/Object.HC"


class Room {
    Room* lastRoom;
    Room* nextRoom;
    U8* description;
    I32 num_objects;
    Object** objects;
};


#include "libs/rooms_lib.HC"


Room* InitRoom(Room* l_room) {
    // Creates a next room to l_room
    // If l_room is NULL, creates the first room

    Room* r = MAlloc(sizeof(Room));
    r->lastRoom = l_room;
    r->nextRoom = NULL;
    if (l_room!=NULL)   l_room->nextRoom = r;
    r->objects = NULL;

    GenRoomDescription(r);
    if (r->description == NULL) {
        "Failed to describe the room";
        return NULL;
    }

    return r;
}


// U0 FreeRoom(Room* room) {
//     // Clears all rooms in the list

//     while (room->lastRoom!=NULL)    room = room->lastRoom;
//     while (room->nextRoom!=NULL) {
//         room = room->nextRoom;
//         Free(room->description);
//         Free(room->lastRoom);
//     }
//     return;
// }


#endif