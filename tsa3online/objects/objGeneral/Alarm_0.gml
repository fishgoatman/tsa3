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
	if (rmNumber == -1) {
		alarm[NEXT_GAME] = 0.5 * room_speed;
	} else {
	    room_goto(rooms[rmNumber]);
	    gg = NONE;
	}
}