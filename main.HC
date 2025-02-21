
Cd(__DIR__);;


#include "classes/Game.HC"


//Main------------------------//

U0 Main() {
    CDC *dc = DCAlias;
    SettingsPush;

    Game* newGame = InitGame();
    if (newGame == NULL) {
        "\nPath failed to start\n";
        return;
    }

    EnterRoom(newGame);

    while(newGame->on) {
        NextAction(newGame);
    }
}

Main;