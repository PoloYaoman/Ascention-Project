
Cd(__DIR__);;

#include "utilities/concat.HC"
#include "classes/Descriptor.HC"
#include "classes/Room.HC"
#include "classes/Player.HC"
#include "classes/Game.HC"


//Main------------------------//

U0 Main() {
    CDC *dc = DCAlias;
    SettingsPush;

    Game* newGame = InitGame();

    EnterRoom(newGame);

    while(1) {
        NextAction(newGame);
    }
}

Main;






