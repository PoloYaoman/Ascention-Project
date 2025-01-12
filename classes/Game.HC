
#ifndef GAME 
#define GAME 0

/*Game controller*/


//Cd(__DIR__);;

#include "classes/Player.HC"
#include "classes/Room.HC"


class Game {
    Bool on;
    I32 rnum;
    Player* you;
    Room* room;
};

Game* InitGame() {
    Game* ngame = MAlloc(sizeof(Game));
    ngame->on = 1;
    ngame->you = InitPlayer();
    ngame->room = InitRoom(NULL);
    ngame->rnum = 1;
    return ngame;
}


U0 EnterRoom (Game* g, I64 rn = 0) {
    /*Prints description of the current room*/

    "\n";    
    if (rn == 0) {
        "You wake up in a room, but you do not remember how you got here.\n";
        "%s", g->room->description;
        g->room->visited = 1;
    } else if (rn == 1) {
        if (g->room->lastRoom != NULL) {
            g->room = g->room->lastRoom;
            "You return to the other room.\n"
            "%s", g->room->description;
        } else {
            "There is nothing behind the door. You decide to remain here.\n"
            "%s", g->room->description;
        }
    } else if (rn == 2) {
        if (g->room->nextRoom != NULL) {
            g->room = g->room->nextRoom;
            "You have already been to this room\n";
            "%s", g->room->description;
        } else {
            g->room->nextRoom = InitRoom(g->room);
            g->room = g->room->nextRoom;
            "You enter a new room\n";
            "%s", g->room->description;
            g->room->visited = 1;
            g->rnum++;
        }
    } else {
        "There is no such door.\n";
    }
}


U0 NextAction(Game* g) {
    "\nWhat will you do?\n";
    "1: Go through a door\n\n";

    I64 A = GetI64;
    "/n";

    switch(A) {
        case 0:
            g->on = 0;
            break;

        case 1:
            "1: First door\n2: Second door\n";
            I64 A2 = GetI64;
            EnterRoom(g,A2);
            break;
            
        default:
            "We know not of such actions\n";
            break;
    }
}


#endif