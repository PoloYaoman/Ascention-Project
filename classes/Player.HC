

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

    I32 n_hands = p->num_hands;
    if (n_hands<2) {
        p->inventory = addObject(p->inventory, r->objects[ind]);
        p->num_hands = n_hands+1;
        if (r->objects[ind] != NULL) {
            r->description = removeObjectRoom(r, r->objects[ind]->name);
        }
        r->objects = removeObject(r->objects, ind);
        r->num_objects--;
    } else {
        "\nYou don't have enough hands to carry that\n";
    }
}

U0 DisplayInventory(Player* p) {
    // "Hands occupied : %d\n", p->num_hands;
    if (p->num_hands > 0) {
        "You are holding :\n\t%s in your left hand\n", p->inventory[0]->name;
    } 
    if (p->num_hands == 2) {
        "\t%s in your right hand\n", p->inventory[1]->name;
    }
}


// U0 FreePlayer(Player* player) {
//     // Clears you

//     Free(player);
//     return;
// }


#endif