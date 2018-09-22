///@desc handle game rooms
if (mouse_x < backButtonOffset + 60 && mouse_y < backButtonOffset + 35) {
	backHover = true
	
	if (instance_exists(objBackButton)) {
		objBackButton.image_index = 1
	}
} else {
	backHover = false
	
	if (instance_exists(objBackButton)) {
		objBackButton.image_index = 0
	}
}

if (mouse_check_button_pressed(mb_left) && backHover) {
	backPressed = true
	audio_stop_all()
} else {
	backPressed = false
}

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
	if (mouse_check_button_pressed(mb_left) && targetRoom == "mainMenu") {
		if (mouse_x < room_width / 2) {
			targetRoom = "characterSelect"
		} else {
			var height = floor(room_height / 3)
			
			if (mouse_y < height) {
				targetRoom = "opCharacterSelect"
			} else if (mouse_y < height * 2) {
				targetRoom = "options"
			} else {
				targetRoom = "help"
			}
		}
	} else {
		if (mouse_x < room_width / 2) {
			selectHighlightId.image_index = 0
			selectHighlightId.x = 0
			selectHighlightId.y = 0
		} else {
			selectHighlightId.image_index = 1
			selectHighlightId.x = room_width / 2
			var height = ceil(room_height / 3)
			
			if (mouse_y < height) {
				selectHighlightId.y = 0
			} else if (mouse_y < height * 2) {
				selectHighlightId.y = height
			} else {
				selectHighlightId.y = height * 2
			}
		}
	}
	
	currRoom = "mainMenu"
} else if (room == rmCharacterSelect) {
	if (backPressed) {
		targetRoom = "mainMenu"
	} else {
		if (createStuff) {
			for (var i = 0; i < numPlayers; i++) {
				lockedIn[i] = false
				heroId[i] = instance_create_depth(objMageSelection.x, objMageSelection.y, i, objCharacterSelector)
			}
			
			instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
			playerMode = "two"
			createStuff = false
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
	}
	
	currRoom = "characterSelect"
} else if (room == rmOPCharacterSelect) {
	if (backPressed) {
		targetRoom = "mainMenu"
	} else {
		if (createStuff) {
			instance_create_depth(objMageSelection.x, objMageSelection.y, 0, objCharacterSelector)
			instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
			lockedIn[0] = false
			playerMode = "one"
			createStuff = false
		}
	
		if (lockedIn[0]) {
			targetRoom = "mapSelect"
		}
	}
	
	currRoom = "opCharacterSelect"
} else if (room == rmMapSelect) {
	if (backPressed) {
		if (playerMode == "one") {
			targetRoom = "opCharacterSelect"
		} else if (playerMode == "two") {
			targetRoom = "characterSelect"
		}
	} else {
		if (createStuff) {
			instance_create_depth(objDesertSelection.x, objDesertSelection.y, 0, objMapSelector)
			instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
			mapLockedIn = false
			createStuff = false
		}
	
		if (mapLockedIn) {
			targetRoom = "game"
		}
	
		if (auto) {
			selectedMap = scrRandomArena()
			targetRoom = "game"
		}
	}
	
	currRoom = "mapSelect"
} else if (scrInArena()) {
	if (backPressed) {
		if (playerMode == "one") {
			targetRoom = "opCharacterSelect"
		} else if (playerMode == "two") {
			targetRoom = "characterSelect"
		}
	} else {
		if (createStuff) {
			numberWithSprite2 = irandom(1)
			
			if (playerMode == "two") {
				for (var i = 0; i < numPlayers; i++) {
					playerHandlerObj[i] = instance_create_depth(0, 0, i, objPlayerHandler);
					lockedIn[i] = false;
				}
			} else {
				selectedHero[1] = "mage"
				playerHandlerObj[1] = instance_create_depth(0, 0, -1, objPlayerHandler)
				playerHandlerObj[0] = instance_create_depth(0, 0, 0, objPlayerHandler)
			}
	
			instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
			bkMusic = bkMusics[irandom(array_length_1d(bkMusics) - 1)]
			audio_play_sound(bkMusic, 1, true)
			createStuff = false
		}
	
		numAlivePlayers = 0
	
		for (var i = 0; i < numPlayers; i++) {
			if (heroId[i].hp > 0) {
				numAlivePlayers++;
			}
		}
	
		if (numAlivePlayers <= 1) {
			if (playerMode == "two") {
				targetRoom = "characterSelect"
			} else if (playerMode == "one") {
				targetRoom = "opCharacterSelect"
			}
		
			audio_stop_sound(bkMusic);
		}
	}
	
	currRoom = "game";
}

if (currRoom != targetRoom) {
	currTime++;
	
	var waitTime
	
	if (currRoom == "start" || currRoom == "mainMenu" || backPressed) {
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
			createStuff = true
		} else if (targetRoom == "opCharacterSelect") {
			room_goto(rmOPCharacterSelect)
			createStuff = true
		} else if (targetRoom == "options") {
			room_goto(rmOptions)
		} else if (targetRoom == "help") {
			room_goto(rmHelp)
		} else if (targetRoom == "characterSelect") {
			room_goto(rmCharacterSelect)
			createStuff = true
		} else if (targetRoom == "mapSelect") {
			room_goto(rmMapSelect)
			createStuff = true
		}
		
		currTime = 0;
	}
} else {
	currTime = 0;
}