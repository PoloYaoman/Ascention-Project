
#ifndef GAME 
#define GAME 0

/*Game controller*/


//Cd(__DIR__);;

#include "classes/Player.HC"
#include "classes/Room.HC"


union Game {
$ID,2$I32 rnum;
Player* you;
Room* room;
$ID,-2$};

U0 InitGame(Game* game) {
$ID,2$game->you = InitPlayer();
game->room = InitRoom(NULL);
//game->rnum = 1;
"Path has begun\n";
$ID,-2$}


U0 EnterRoom (Game* g) {
$ID,2$Room* croom = g->room;
$ID,2$$ID,-2$if (g->rnum == 1) {
$ID,2$"You wake up in a room, but you do not remember how you got here.\n";
"%s", croom->description;
croom->visited = 1;
$ID,-2$} else if (!croom->visited) {
$ID,2$"You enter a new room.\n";
"%s", croom->description;
croom->visited = 1;
g->rnum++;
$ID,-2$} else {
$ID,2$"You turn back.\n";
"%s", croom->description;
$ID,-2$}
$ID,-2$}


#endif