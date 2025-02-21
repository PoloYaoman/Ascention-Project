
#ifndef ROOMS_LIB
#define ROOMS_LIB 0


/*
    Collection of different rooms
    [o] is an object flag
*/


#include "classes/Room.HC"
#include "libs/utils.HC"
#include "libs/objects_lib"


#define NUM_ROOMS 3


U64* rooms[NUM_ROOMS] = {
    "The air around you is seasonless, and you can't quite point out the source of light, but it is all dimly illuminated.\n",

    "Strange warmth envoleps you. You feel like you've already been here.\n",

    "This room is so weirdly shaped that you can't quite count the number of corners in it. Near the wall to the right of you, you spot [o].\n"
};


U0 GenRoomDescription(Room* r) {
    // Picks a random room
    // Fills objects on [o] flags
    // Fills characters on [c] flags
    
    I64 ind = Abs(RandI64 % NUM_ROOMS);
    U8* desc = Concat(rooms[ind],
        "\nThere are $$PURPLE$$two doors$$BLUE$$, opposite of each other.\n\n");
    r->description = desc;
    FillObjects(r);
    return;
}


#endif