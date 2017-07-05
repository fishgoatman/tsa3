/// @description next game
if (mouseWins >= firstTo) {
    mouseWins = 0;
    keyboardWins = 0;
    alarm[RESET] = matchVictoryTime;
    instance_create(signX, signY, objMouseWin);
} else if (keyboardWins >= firstTo) {
    mouseWins = 0;
    keyboardWins = 0;
    alarm[RESET] = matchVictoryTime;
} else {
    room_goto(scrRandRoom());
    gg = NONE;
}

