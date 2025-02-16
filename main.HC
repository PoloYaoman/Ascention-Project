
Cd(__DIR__);;

// #include "classes/Room.HC"
// #include "classes/Player.HC"
#include "classes/Game.HC"
// #include "classes/Object.HC"


//Main------------------------//

U0 Main() {
    CDC *dc = DCAlias;
    SettingsPush;

    Game* newGame = InitGame();

    EnterRoom(newGame);

    while(newGame->on) {
        NextAction(newGame);
    }
}

Main;






