/// @description next game
if (mode == "online") {
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
} else if (mode == "offline") {
	if (mouseWins >= firstTo) {
	    mouseWins = 0;
	    keyboardWins = 0;
	    alarm[RESET] = matchVictoryTime;
	    instance_create(signX, signY, objMouseWin);
	} else if (keyboardWins >= firstTo) {
	    mouseWins = 0;
	    keyboardWins = 0;
	    alarm[RESET] = matchVictoryTime;
		instance_create(signX, signY, objKeyboardWin);
	} else {
		room_goto(rooms[rmNumber]);
		gg = NONE;
	}
}