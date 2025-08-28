
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
    r->num_objects = 0;

    GenRoomDescription(r);
    if (r->description == NULL) {
        "Failed to describe the room";
        return NULL;
    }

    return r;
}


U0 ListObjects(Room* r) {
    // Lists names of objects in the room

    I32 i = 0;
    while (i < r->num_objects) {
        "%d: ", i+1;
        "%s\n", r->objects[i]->name;
        i++;
    }
}

U8* removeObjectRoom (Room* r, U8* obj) {
    // Removes sentence containing object and counts down 
    // their number
    
    U8* o_loc = Find(r->description, obj);

    U8* last_point = r->description;
    U8* last_point_tmp = last_point;
    while (*last_point != '\0') {
        if (*last_point == '.') {
            last_point_tmp = last_point+1;
        } if (last_point == o_loc) {
            last_point = last_point_tmp;
            break;
        }
        last_point++;
    }
    
    U8* next_point = o_loc;
    while (*next_point != '\0' && *next_point != '.') {
        next_point++;
    }

    U8* ndesc = MAlloc(StrLen(r->description)-StrLen(last_point)+StrLen(next_point)+1);
    ndesc = MemCpy("", r->description, StrLen(r->description)-StrLen(last_point));
    ndesc = Concat(ndesc, next_point);

    r->num_objects--;

    return ndesc;
}


U0 RoomPickObject (Room* r, I64 ind) {
    if (r->objects[ind] != NULL) {
        r->description = removeObjectRoom(r, r->objects[ind]->name);
    }
    "\nRoom description updated:\n%s\n", r->description;
    removeObject(&(r->objects), ind);
    r->num_objects--;
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