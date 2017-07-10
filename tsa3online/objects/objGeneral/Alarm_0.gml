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
	if (testingMode) {
		room_goto(rm0);
		gg = NONE;
	} else {
		room_goto(rooms[rmNumber]);
		gg = NONE;
	}
}