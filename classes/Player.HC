

#ifndef PLAYER 
#define PLAYER


/*
    Player controller
    TODO inventory
*/


#include "classes/Object.HC"
#include "classes/Room.HC"


union Player {
    Object** inventory;
    I64 num_hands;
};


Player* InitPlayer() {
    // Creates you

    Player* p = MAlloc(sizeof(Player));
    p->inventory = NULL;
    p->num_hands = 0;
    return p;
}


U0 PickObject(Player* p, Room* r, I64 ind) {
    // Picks an object from the room and puts it into 
    // player's inventory

    addObject(p->inventory, r->objects[ind]);
    p->num_hands++;
    r->description = removeObjectRoom(r, r->objects[ind]->name);
    removeObject(r->objects, ind);
}


// U0 FreePlayer(Player* player) {
//     // Clears you

//     Free(player);
//     return;
// }


#endif