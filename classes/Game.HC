
#ifndef GAME 
#define GAME 0


/*
    Game controller
    Tracks game status
*/


#include "classes/Room.HC"
#include "classes/Player.HC"

//union Player{};

class Game {
    Bool on;
    Player* you;
    Room* room;
};


Game* InitGame() {
    // Starts the game

    Game* ngame = MAlloc(sizeof(Game));
    ngame->on = 1;

    ngame->you = InitPlayer();
    if (ngame->you == NULL) {
        "\nYou failed to materialise\n";
        return NULL;
    }
    // "Hands occupied so far : %d\n", ngame->you->num_hands;

    ngame->room = InitRoom(NULL);
    if (ngame->you == NULL) {
        "\nThe room failed to materialise\n";
        return NULL;
    }

    return ngame;
}


U0 EnterRoom(Game* game, I32 rn=0) {
    // Prints entered room description and inventory
    // Creates a room if it doesn't exist yet

    "\n\n";    
    if (rn == 0) {
        "You wake up in a room, but you do not remember how you got here.\n\n";
        "%s", game->room->description;
    } else if (rn == 1) {
        if (game->room->lastRoom != NULL) {
            game->room = game->room->lastRoom;
            "You return to the other room.\n\n"
            "%s", game->room->description;
        } else {
            "There is nothing behind the door. You decide to remain here.\n\n"
            "%s", game->room->description;
        }
    } else if (rn == 2) {
        if (game->room->nextRoom != NULL) {
            game->room = game->room->nextRoom;
            "You have already been to this room\n\n";
            "%s", game->room->description;
        } else {
            game->room->nextRoom = InitRoom(game->room);
            game->room = game->room->nextRoom;
            "You enter a new room\n\n";
            "%s", game->room->description;
        }
    } else {
        "There is no such door.\n\n";
    }

    DisplayInventory(game->you);

    "\n\n";
    return;
}


U0 NextAction(Game* g) {
    // Lets you pick the next action

    "\nWhat will you do?\n\n";
    if (g->room->objects != NULL) {
        "3: Pick up an object\n";
        "2: Examine an object\n";
    }
    "1: Go through a door\n";
    "$$GREY$$0: End experience$$BLUE$$\n";

    I64 A = GetI64;
    "\n";

    switch(A) {
        case 0:
            g->on = 0;
            break;

        case 1:
            "1: First door\n2: Second door\n";
            I64 A1 = GetI64;
            EnterRoom(g,A1);
            break;

        case 2:
            ListObjects(g->room);
            I64 A2 = GetI64;
            if (A2 <= g->room->num_objects) {
                "\n%s\n", g->room->objects[A2-1]->description;
            } else {
                "There is no such thing here\n";
            }
            break;

        case 3:
            ListObjects(g->room);
            I64 A3 = GetI64;
            if (A3 <= g->room->num_objects) {
                PlayerPickObject(g->you, g->room->objects[A3-1]);
                g->room = RoomPickObject(g->room, A3-1);
            } else {
                "\n There is no such thing here\n";
            }
            break;
            
        default:
            "This action is not in the texts\n";
            break;
    }

    return;
}


// U0 FreeGame(Game* game) {
//     // Clears the game
//     FreePlayer(game->you);
//     FreeRoom(game->room);
//     Free(game);
//     return;
// }


#endif