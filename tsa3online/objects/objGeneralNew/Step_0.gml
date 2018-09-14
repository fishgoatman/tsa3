///@desc handle game rooms
if (room == rmStartScreen) {
	if (keyboard_check_pressed(vk_anykey)) {
		startOffline = true;
		//startOnline = true;
	}
	
	if (startOffline) {
		for (var i = 0; i < numPlayers; i++) {
			thisInControl[i] = true;
		}
		
		targetRoom = "mainMenu";
		mode = "offline";
		startOffline = false;
	} else if (startOnline) {
		targetRoom = "mainMenu";
		mode = "online";
		instance_create(0, 0, objClient);
		startOnline = false;
	}
} else if (room == rmMainMenu) {
	if (mouse_check_button(mb_left) && targetRoom == "mainMenu") {
		if (mouse_x < room_width / 2) {
			targetRoom = "characterSelect"
		} else {
			var height = floor(room_height / 3)
			
			if (mouse_y < height) {
				targetRoom = "opCharacterSelect"
			} else if (mouse_y < height / 2) {
				targetRoom = "options"
			} else {
				targetRoom = "help"
			}
		}
	}
	
	currRoom = "mainMenu"
} else if (room == rmCharacterSelect) {
	if (createSelectStuff) {
		for (var i = 0; i < numPlayers; i++) {
			lockedIn[i] = false
			heroId[i] = instance_create_depth(objMageSelection.x, objMageSelection.y, i, objCharacterSelector)
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
	
	currRoom = "characterSelect"
} else if (room == rmMapSelect) {
	if (createMapSelectStuff) {
		instance_create_depth(objDesertSelection.x, objDesertSelection.y, 0, objMapSelector)
		createMapSelectStuff = false
		mapLockedIn = false
	}
	
	if (mapLockedIn) {
		targetRoom = "game"
	}
	
	if (auto) {
		selectedMap = scrRandomArena()
		targetRoom = "game"
	}
	
	currRoom = "mapSelect"
} else if (scrInArena()) {
	if (createGameStuff) {	
		numberWithSprite2 = irandom(1)
	
		for (var i = 0; i < numPlayers; i++) {
			playerHandlerObj[i] = instance_create_depth(0, 0, i, objPlayerHandler);
			lockedIn[i] = false;
		}
	
		createGameStuff = false;
		bkMusic = bkMusics[irandom(array_length_1d(bkMusics) - 1)]
	
		audio_play_sound(bkMusic, 1, true);
	}
	
	var numAlivePlayers = 0;
	
	for (var i = 0; i < numPlayers; i++) {
		if (heroId[i].hp > 0) {
			numAlivePlayers++;
		}
	}
	
	if (numAlivePlayers <= 1) {
		targetRoom = "characterSelect";
		audio_stop_sound(bkMusic);
	}
	
	currRoom = "game";
}

if (currRoom != targetRoom) {
	currTime++;
	
	var waitTime
	
	if (currRoom == "start") {
		waitTime = 0
	} else if (currRoom == "game") {
		waitTime = 1.5 * room_speed
	} else {
		waitTime = 0.5 * room_speed
	}
	
	if (currTime >= waitTime) {
		if (targetRoom == "mainMenu") {
			room_goto(rmMainMenu)
		} else if (targetRoom == "game") {
			room_goto(selectedMap)
			createGameStuff = true
		} else if (targetRoom == "opCharacterSelect") {
			room_goto(rmOPCharacterSelect)
		} else if (targetRoom == "options") {
			room_goto(rmOptions)
		} else if (targetRoom == "help") {
			room_goto(rmHelp)
		} else if (targetRoom == "characterSelect") {
			room_goto(rmCharacterSelect)
			createSelectStuff = true
		} else if (targetRoom == "mapSelect") {
			room_goto(rmMapSelect)
			createMapSelectStuff = true
		}
		
		currTime = 0;
	}
} else {
	currTime = 0;
}