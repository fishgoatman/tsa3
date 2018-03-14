///@desc start game
if (gameWasStarted) {
	gameWasStarted = false;
	numPlayersCreated = 0;
	
	for (var i = 0; i < numPlayers; i++) {
		if (i == 0) {
			var createdId = instance_create_depth(0, 0, 1, objPlayerHandler);
			playerHandlerObj[1] = createdId;
		} else if (i == 1) {
			var createdId = instance_create_depth(0, 0, 0, objPlayerHandler);
			playerHandlerObj[0] = createdId;
		} else {
			var createdId = instance_create_depth(0, 0, i, objPlayerHandler);
			playerHandlerObj[i] = createdId;
		}
		
	}
}

if (room == rmCharacterSelectionScreen) {
	startGame = true;

	for (var i = 0; i < numPlayers; i++) {
		if (!lockedIn[i]) {
			startGame = false;
		}
	}
} else {
	var numAlivePlayers = 0;
	
	for (var i = 0; i < numPlayers; i++) {
		if (heroId[i].hp > 0) {
			numAlivePlayers++;
		}
	}
	
	if (numAlivePlayers <= 1) {
		if (!startGame) {
			currTime = 0;
		}
		
		startGame = true;
	} else {
		startGame = false;
	}
}

if (startGame) {
	if (currTime < startGameDelay) {
		currTime++;
	} else {
		room_goto(rmStandard);
		gameWasStarted = true;
	
		for (var i = 0; i < numPlayers; i++) {
			lockedIn[i] = false;
		}
	}
}