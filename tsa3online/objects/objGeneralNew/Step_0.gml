///@desc handle game rooms
if (createGameStuff) {	
	for (var i = 0; i < numPlayers; i++) {
		playerHandlerObj[i] = instance_create_depth(0, 0, i, objPlayerHandler);
		lockedIn[i] = false;
	}
	
	createGameStuff = false;
}

if (room == rmMainMenu) {
	if (keyboard_check_pressed(ord("2"))) {
		startOffline = true;
	} else if (keyboard_check_pressed(ord("3"))) {
		startOnline = true;
	}
	
	if (startOffline) {
		for (var i = 0; i < numPlayers; i++) {
			thisInControl[i] = true;
		}
		
		targetRoom = "select";
		mode = "offline";
		startOffline = false;
	} else if (startOnline) {
		targetRoom = "select";
		mode = "online";
		instance_create(0, 0, objClient);
		startOnline = false;
	}
} if (room == rmCharacterSelectionScreen) {
	if (createSelectStuff) {
		for (var i = 0; i < numPlayers; i++) {
			lockedIn[i] = false;
			instance_create_depth(0, 0, i, objCharacterSelecter);
		}
		
		createSelectStuff = false;
	}
	
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
	
	if (currTime >= 1 * room_speed || currRoom == "main") {
		if (targetRoom == "game") {
			room_goto(rmStandard);
			createGameStuff = true;
		} else if (targetRoom == "select") {
			room_goto(rmCharacterSelectionScreen);
			createSelectStuff = true;
		}
		
		currTime = 0;
	}
} else {
	currTime = 0;
}