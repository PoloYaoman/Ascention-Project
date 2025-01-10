
#ifndef PLAYER 
#define PLAYER

/*Player controller. Possibly 
useless*/


union Player {

};

Player* InitPlayer() {
    Player* p = MAlloc(sizeof(Player));
    return p;
}


#endif