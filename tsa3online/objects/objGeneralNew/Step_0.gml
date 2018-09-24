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
	if (createStuff) {
		instance_create_depth(room_width / 2, 350, 0, objClickToEnter)
		
		var createObjs
		createObjs[0] = objDesertBk
		createObjs[1] = objMountainBk
		createObjs[2] = objForestBk
		createObjs[3] = objTundraBk
		
		var createXAvg
		createXAvg[0] = 125
		createXAvg[1] = 305
		createXAvg[2] = 440
		createXAvg[3] = 635
		
		var bkWidth = 50
		
		for (var xx = 0; xx < room_width; xx += bkWidth) {
			var centerX = xx + bkWidth / 2
			var props
			props[0] = 0
			
			for (var i = 0; i < 4; i++) {
				var prop = room_width / power(abs(centerX - createXAvg[i]), 2)
				
				if (i == 0) {
					props[i] = prop
				} else {
					props[i] = props[i - 1] + prop
				}
			}
			
			for (var yy = 0; yy < room_height; yy += bkWidth) {
				var rand = random(props[array_length_1d(props) - 1])
				var createObj
			
				for (var i = 0; i < 4; i++) {
					if (rand < props[i]) {
						createObj = createObjs[i]
						break
					}
				}
				
				instance_create_depth(xx, yy, 0, createObj)
			}
		}
		
		createStuff = false
	}
	
	if (mouse_check_button_pressed(mb_left)) {
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
	if (createStuff) {
		createStuff = false
	}
	
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
} else if (room == rmOptions) {
	if (backPressed) {
		targetRoom = "mainMenu"
	} else {
		if (createStuff) {
			instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
			createStuff = false
		}
	}
	
	currRoom = "options"
} else if (room == rmHelp) {
	if (backPressed) {
		targetRoom = "mainMenu"
	} else {
		if (createStuff) {
			instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
			createStuff = false
		}
	}
	
	if (keyboard_check_pressed(ord("1"))) {
		targetRoom = "mageHelp"
	}
	
	currRoom = "help"
} else if (room == rmMageHelp) {
	if (backPressed) {
		targetRoom = "help"
	} else {
		if (createStuff) {
			instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
			createStuff = false
		}
	}
	
	currRoom = "mageHelp"
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
		} else if (targetRoom == "characterSelect") {
			room_goto(rmCharacterSelect)
		} else if (targetRoom == "opCharacterSelect") {
			room_goto(rmOPCharacterSelect)
		} else if (targetRoom == "options") {
			room_goto(rmOptions)
		} else if (targetRoom == "help") {
			room_goto(rmHelp)
		} else if (targetRoom == "mageHelp") {
			room_goto(rmMageHelp)
		} else if (targetRoom == "mapSelect") {
			room_goto(rmMapSelect)
		}
		
		createStuff = true
		currTime = 0
	}
} else {
	currTime = 0;
}