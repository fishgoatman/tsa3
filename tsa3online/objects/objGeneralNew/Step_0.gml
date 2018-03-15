///@desc handle game rooms
//determine what target game screen in
if (createGameStuff) {	
	for (var i = 0; i < numPlayers; i++) {
		playerHandlerObj[i] = instance_create_depth(0, 0, i, objPlayerHandler);
		lockedIn[i] = false;
	}
	
	createGameStuff = false;
}

if (room == rmCharacterSelectionScreen) {
	var startGame = true;
	
	for (var i = 0; i < numPlayers; i++) {
		if (!lockedIn[i]) {
			startGame = false;
		}
	}
	
	if (startGame) {
		targetRoom = "game";
	}
	
	currRoom = "select";
} else if (room == rmStandard) {
	var numAlivePlayers = 0;
	
	for (var i = 0; i < numPlayers; i++) {
		if (heroId[i].hp > 0) {
			numAlivePlayers++;
		}
	}
	
	if (numAlivePlayers <= 1) {
		targetRoom = "select";
	}
	
	currRoom = "game";
}

if (currRoom != targetRoom) {
	currTime++;
	
	if (currTime >= 1 * room_speed) {
		if (targetRoom == "game") {
			room_goto(rmStandard);
			createGameStuff = true;
		} else if (targetRoom == "select") {
			room_goto(rmCharacterSelectionScreen);
		}
		
		currTime = 0;
	}
} else {
	currTime = 0;
}