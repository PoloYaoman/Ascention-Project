
Cd(__DIR__);;


#include "classes/Game.HC"


//Main------------------------//

U0 Main() {
    CDC *dc = DCAlias;
    SettingsPush;

    Game* newGame = InitGame();

    EnterRoom(newGame);

    while(newGame->on) {
        NextAction(newGame);
    }
}

Main;






