///@desc start game
if (gameWasStarted) {
	gameWasStarted = false;
	numPlayersCreated = 0;
	
	for (var i = 0; i < numPlayers; i++) {
		var createdId = instance_create_depth(0, 0, i, objPlayerHandler);
		playerHandlerObj[i] = createdId;
	}
}

var startGame;

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
		if (instance_exists(heroId[i])) {
			numAlivePlayers++;
		}
	}
	
	if (numAlivePlayers <= 1) {
		startGame = true;
	} else {
		startGame = false;
	}
}

if (startGame) {
		room_goto(rmFlagship);
		gameWasStarted = true;
	
		for (var i = 0; i < numPlayers; i++) {
			lockedIn[i] = false;
		}
	}