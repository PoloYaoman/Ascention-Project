
#ifndef ROOMS_LIB
#define ROOMS_LIB 0


#include "utilities/string_ops.HC"
#include "classes/Object.HC"
#include "classes/Room.HC"
#include "utilities/objects_lib.HC"

#define NUM_ROOMS 3

U8* rooms[NUM_ROOMS] = {
    "The air around you is seasonless, and you can't quite point out the source of light, but it is all dimly illuminated.",

    "Strange warmth envoleps you. You feel like you've already been here.",

    "This room is so weirdly shaped that you can't quite count the number of corners in it. Near the wall to the right of you, you spot [o]."
};

I64 room_obj_attributes[NUM_ROOMS] = {
    0,
    0,
    1
};

U0 GenRoomDescription(Room* r) {
    I64 ind = Abs(RandI64 % NUM_ROOMS);
    U8* desc = Concat(rooms[ind],
        " There are two doors, opposite of each other.\n");
    r->description = desc;

    r->num_objects = room_obj_attributes[ind];
    I64 r_obj = r->num_objects;
    while (r_obj>0) {
        InsObjects(r);
        r_obj--;
    }
}


#endif