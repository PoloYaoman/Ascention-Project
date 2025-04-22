
Cd(__DIR__);;


#include "classes/Game.HC"


//Main------------------------//

U0 Main() {
    CDC *dc = DCAlias;
    SettingsPush;

    // Init new game
    Game* newGame = InitGame();
    if (newGame == NULL) {
        "\nPath failed to start\n";
        return;
    }

    EnterRoom(newGame);

    // Game loop
    while(newGame->on) {
        NextAction(newGame);
    }
}

Main;