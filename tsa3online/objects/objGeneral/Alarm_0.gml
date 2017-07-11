/// @description next game
if (thisWins >= firstTo) {
    thisWins = 0;
    otherWins = 0;
    alarm[RESET] = matchVictoryTime;
    instance_create(signX, signY, objMouseWin);
} else if (otherWins >= firstTo) {
    thisWins = 0;
    otherWins = 0;
    alarm[RESET] = matchVictoryTime;
	instance_create(signX, signY, objKeyboardWin);
} else {
	room_goto(rooms[rmNumber]);
	gg = NONE;
}