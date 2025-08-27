

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


class Player {
    Object* left_hand; 
    Object* right_hand;
};


Player* InitPlayer() {
    // Creates you

    Player* p = MAlloc(sizeof(Player));
    p->left_hand = NULL; p->right_hand = NULL;
    return p;
}


U0 PlayerPickObject(Player* p, Object* obj) {
    // Places an object in your inventory
    
    if (p->left_hand == NULL) {
        p->left_hand = obj;
        "You pick up %s with your left hand\n", obj->name;
    } else if (p->right_hand == NULL) {
        p->right_hand = obj;
        "You pick up %s with your right hand\n", obj->name;
    } else {
        "\nYou don't have enough hands to carry that\n";
    }
}


U0 DisplayInventory(Player* p) {
    // Displays player's inventory

    if (p != NULL) {
        if (p->left_hand != NULL) {
            "You are holding :\n\t%s in your left hand\n", p->left_hand->name;
        } 
        if (p->right_hand != NULL) {
            "\t%s in your right hand\n", p->right_hand->name;
        }
    }
}


// U0 FreePlayer(Player* player) {
//     // Clears you

//     Free(player);
//     return;
// }


#endif