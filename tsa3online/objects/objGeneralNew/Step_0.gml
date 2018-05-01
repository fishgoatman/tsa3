///@desc handle game rooms
if (createGameStuff) {	
	for (var i = 0; i < numPlayers; i++) {
		playerHandlerObj[i] = instance_create_depth(0, 0, i, objPlayerHandler);
		lockedIn[i] = false;
	}
	
	createGameStuff = false;
}

if (room == rmMainMenu) {
	if (keyboard_check_pressed(vk_space)) {
		startOffline = true;
		//startOnline = true;
	}
	
	if (startOffline) {
		for (var i = 0; i < numPlayers; i++) {
			thisInControl[i] = true;
		}
		
		targetRoom = "characterSelect";
		mode = "offline";
		startOffline = false;
	} else if (startOnline) {
		targetRoom = "characterSelect";
		mode = "online";
		instance_create(0, 0, objClient);
		startOnline = false;
	}
} else if (room == rmCharacterSelectionScreen) {
	if (createSelectStuff) {
		for (var i = 0; i < numPlayers; i++) {
			lockedIn[i] = false;
			heroId[i] = instance_create_depth(0, 0, i, objCharacterSelecter);
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
		targetRoom = "mapSelect";
	}
	
	currRoom = "characterSelect";
} else if (room == rmMapSelectionScreen) {
	if (keyboard_check_pressed(ord("1"))) {
		selectedArena = rmBowl;
		targetRoom = "game";
	} else if (keyboard_check_pressed(ord("2"))) {
		selectedArena = rmPillar;
		targetRoom = "game";
	} else if (keyboard_check_pressed(ord("3"))) {
		selectedArena = rmHill;
		targetRoom = "game";
	} else if (keyboard_check_pressed(ord("4"))) {
		selectedArena = rmFlat;
		targetRoom = "game";
	}
	
	if (auto) {
		selectedArena = scrRandomArena();
		targetRoom = "game";
	}
} else if (scrInArena()) {
	var numAlivePlayers = 0;
	
	for (var i = 0; i < numPlayers; i++) {
		if (heroId[i].hp > 0) {
			numAlivePlayers++;
		}
	}
	
	if (numAlivePlayers <= 1) {
		targetRoom = "characterSelect";
	}
	
	currRoom = "game";
}

if (currRoom != targetRoom) {
	currTime++;
	
	if (currTime >= 0.5 * room_speed || currRoom == "main") {
		if (targetRoom == "game") {
			room_goto(selectedArena);
			createGameStuff = true;
		} else if (targetRoom == "characterSelect") {
			room_goto(rmCharacterSelectionScreen);
			createSelectStuff = true;
		} else if (targetRoom == "mapSelect") {
			room_goto(rmMapSelectionScreen);
		}
		
		currTime = 0;
	}
} else {
	currTime = 0;
}