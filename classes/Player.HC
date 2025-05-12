

#ifndef PLAYER 
#define PLAYER


/*
    Player controller
    TODO inventory
*/


// #include "classes/Game.HC"
#include "classes/Object.HC"
#include "classes/Room.HC"


// class Game{};


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


Player* PlayerPickObject(Player* p, Object* obj) {
    // Places an object into player's inventory
    
    Player* p_upd = p;
    if (p_upd->num_hands < 2) {
        p_upd->inventory = addObject(p_upd->inventory, obj);
        "\nObject picked : %s\n", obj->name;
        p_upd->num_hands++;
    } else {
        "\nYou don't have enough hands to carry that\n";
    }
    return p_upd;
}


U0 DisplayInventory(Player* p) {
    // "Hands occupied : %d\n", p->num_hands;
    if (p != NULL) {
        if (p->num_hands > 0) {
            "You are holding :\n\t%s in your left hand\n", p->inventory[0]->name;
        } 
        if (p->num_hands == 2) {
            "\t%s in your right hand\n", p->inventory[1]->name;
        }
    }
}


// U0 FreePlayer(Player* player) {
//     // Clears you

//     Free(player);
//     return;
// }


#endif