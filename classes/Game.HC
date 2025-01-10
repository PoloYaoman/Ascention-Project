
#ifndef GAME 
#define GAME 0

/*Game controller*/


//Cd(__DIR__);;

#include "classes/Player.HC"
#include "classes/Room.HC"


class Game {
    I32 rnum;
    Player* you;
    Room* room;
};

Game* InitGame() {
    Game* ngame = MAlloc(sizeof(Game));
    ngame->you = InitPlayer();
    ngame->room = InitRoom(NULL);
    ngame->rnum = 1;
    return ngame;
}


U0 EnterRoom (Game* g, I64 rn = 0) {
    /*Prints description of the current room*/

    "\n";    
    if (g->rnum == 1) {
        "You wake up in a room, but you do not remember how you got here.\n";
        "%s", g->room->description;
        g->room->visited = 1;
    } else if (!(g->room->visited)) {
        "You enter a new room.\n";
        "%s", g->room->description;
        g->room->visited = 1;
        g->rnum++;
    } else {
        "You turn back.\n";
        "%s", g->room->description;
    }
    "\n"; 
}


U0 NextAction(Game* g) {
    "\nWhat will you do?\n";
    "1: Go through a door\n2: Exit the dream\n";

    I64 A = GetI64;
    "action : %d\n", A;

    switch(A) {
        case 1:
            "1: First door\n2: Second door\n";
            I64 A2 = GetI64;

            break;
        default:
            "We know not of such actions\n";
            break;
    }
}


#endif