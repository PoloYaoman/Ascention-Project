

#ifndef PLAYER 
#define PLAYER


/*
Player controller
TODO inventory
*/


union Player {

};


Player* InitPlayer() {
    // Creates you

    Player* p = MAlloc(sizeof(Player));
    return p;
}


// U0 FreePlayer(Player* player) {
//     // Clears you

//     Free(player);
//     return;
// }


#endif