
#ifndef ROOM 
#define ROOM 0

/*Room controller*/


//Cd(__DIR__);;

#include "classes/Descriptor.HC"


union Room {
$ID,2$/* Essentially a linked list */
I32 num;
Room* lastRoom;
Room* nextRoom;
I64 description;
Bool visited;
$ID,-2$};

Room* InitRoom(Room* l_room) {
$ID,2$Room* r = MAlloc(sizeof(Room));
r->lastRoom = l_room;
r->nextRoom = NULL;
if (l_room!=NULL) {
$ID,2$l_room->nextRoom = r;
$ID,-2$}
r->description = GenRoomDescription();
/*r->visited = 0;*/
"Room materialised\n";
return r;
$ID,-2$}


#endif 