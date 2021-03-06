///@desc handle game rooms
/*currEpochSec = floor(date_second_span(date_create_datetime(1970,1,1,0,0,0),date_current_datetime()))

if (currEpochSec != lastEpochSec) {
	secStartMill = current_time
}

currEpochMill = currEpochSec * 1000 + current_time - secStartMill

show_debug_message(currEpochMill)
lastEpochSec = currEpochSec*/

if (keyboard_check_pressed(ord("8"))) {
	//urf = !urf
}

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
} else {
	backPressed = false
}

if (mouse_x > room_width - (exitButtonOffset + 50) && mouse_y < exitButtonOffset + 50) {
	exitHover = true
	
	if (instance_exists(objExitButton)) {
		objExitButton.image_index = 1
	}
} else {
	exitHover = false
	
	if (instance_exists(objExitButton)) {
		objExitButton.image_index = 0
	}
}

if (mouse_check_button_pressed(mb_left) && exitHover && room != rmStartScreen) {
	game_end()
} else {
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
		
			audio_play_sound(lobbyMusic, 1, true)
			createStuff = false
		}
	
		if (keyboard_check_pressed(ord("1"))) {
			startOffline = true
		}
		
		if (keyboard_check_pressed(ord("2"))) {
			startOnline = true
		} 
	
		if (startOffline) {
			for (var i = 0; i < numPlayers; i++) {
				thisInControl[i] = true;
			}
		
			targetRoom = "mainMenu";
			mode = "offline";
			startOffline = false
		} else if (startOnline) {
			targetRoom = "mainMenu";
			mode = "online";
			instance_create(0, 0, objClient)
			startOnline = false
		}
	} else if (room == rmMainMenu) {
		if (createStuff) {
			instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, 0, objExitButton)
			createStuff = false
		}
	
		if (exitHover) {
			selectHighlightId.visible = false
		} else {
			selectHighlightId.visible = true
		}
	
		if (mouse_check_button_pressed(mb_left) && targetRoom == "mainMenu") {
			if (mouse_x < room_width / 2) {
				targetRoom = "characterSelect"
			} else {
				var height = floor(room_height / 3)
			
				if (mouse_y < height) {
					targetRoom = "onePlayerMenu"
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
				instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, 0, objExitButton)
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
	} else if (room == rmOnePlayerMenu) {
		if (createStuff) {
			createStuff = false
		}
		
		if (backPressed) {
			targetRoom = "mainMenu"
		} else {
			if (mouse_check_button_pressed(mb_left)) {
				if (mouse_y < room_height / 2) {
					onePlayerRoom = "aiCharacterSelect"
				} else {
					onePlayerRoom = "challengerCharacterSelect"
				}
				
				targetRoom = "opCharacterSelect"
			}
		}
		
		currRoom = "onePlayerMenu"
	} else if (room == rmOPCharacterSelect) {
		if (backPressed) {
			targetRoom = "onePlayerMenu"
		} else {
			if (createStuff) {
				instance_create_depth(objMageSelection.x, objMageSelection.y, 0, objCharacterSelector)
				instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
				instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, 0, objExitButton)
				lockedIn[0] = false
				playerMode = "one"
				createStuff = false
			}
			
			if (keyboard_check_pressed(ord("5"))) {
				lockedIn[0] = true
				selectedHero[0] = "monkMage"
			}
	
			if (lockedIn[0]) {
				targetRoom = onePlayerRoom
			}
		}
	
		currRoom = "opCharacterSelect"
	} else if (room == rmAICharacterSelect) {
		if (backPressed) {
			targetRoom = "opCharacterSelect"
		} else {
			if (createStuff) {
				instance_create_depth(objMageSelection.x, objMageSelection.y, 1, objCharacterSelector)
				instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
				instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, 0, objExitButton)
				lockedIn[1] = false
				aiHalfCooldown = false
				createStuff = false
			}
			
			if (keyboard_check_pressed(ord("5"))) {
				lockedIn[1] = true
				selectedHero[1] = "monkMage"
			}
			
			if (keyboard_check_pressed(ord("6"))) {
				aiHalfCooldown = true
			}
			
			if (lockedIn[1]) {
				targetRoom = "mapSelect"
			}
		}
	
		currRoom = "aiCharacterSelect"
	} else if (room == rmChallengerCharacterSelect) {
		if (backPressed) {
			targetRoom = "opCharacterSelect"
		} else {
			if (createStuff) {
				instance_create_depth(objMageSelection.x, objMageSelection.y, 1, objCharacterSelector)
				instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
				instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, 0, objExitButton)
				lockedIn[1] = false
				aiHalfCooldown = false
				createStuff = false
			}
			
			if (keyboard_check_pressed(ord("5"))) {
				lockedIn[1] = true
				selectedHero[1] = "monkMage"
			}
			
			if (keyboard_check_pressed(ord("6"))) {
				aiHalfCooldown = true
			}
			
			if (lockedIn[1]) {
				targetRoom = "mapSelect"
			}
		}
	
		currRoom = "challengerCharacterSelect"
	} else if (room == rmMapSelect) {
		if (backPressed) {
			if (playerMode == "one") {
				targetRoom = "aiCharacterSelect"
			} else if (playerMode == "two") {
				targetRoom = "characterSelect"
			}
		} else {
			if (createStuff) {
				instance_create_depth(objDesertSelection.x, objDesertSelection.y, 0, objMapSelector)
				instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
				instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, 0, objExitButton)
				mapLockedIn = false
				createStuff = false
			}
			
			if (keyboard_check_pressed(ord("5"))) {
				mapLockedIn = true
				selectedMap = rmBlack
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
	} else if (room == rmOptions) {
		if (backPressed) {
			targetRoom = "mainMenu"
		} else {
			if (createStuff) {
				optionsColor = irandom(3)
				instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
				instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, 0, objExitButton)
				instance_create_depth(room_width / 2, 70, 0, objSoundLabel)
				instance_create_depth(room_width / 2, 170, 0, objSlidingBar)
				instance_create_depth(room_width / 2, 300, 0, objMusic)
				instance_create_depth(room_width / 2, 400, 1, objSlidingBar)
				var createObj
		
				if (optionsColor == 0) {
					createObj = objDesertBk
				
					with (objSlider) {
						sprite_index = sprDesertSlider
					}
				} else if (optionsColor == 1) {
					createObj = objTundraBk
				
					with (objSlider) {
						sprite_index = sprTundraSlider
					}
				} else if (optionsColor == 2) {
					createObj = objMountainBk
				
					with (objSlider) {
						sprite_index = sprMountainSlider
					}
				} else if (optionsColor == 3) {
					createObj = objForestBk
				
					with (objSlider) {
						sprite_index = sprForestSlider
					}
				}
			
				for (var yy = 0; yy < room_height; yy += 50) {
					for (var xx = 0; xx < room_width; xx += 50) {
						instance_create_depth(xx, yy, 5, createObj)
					}
				}
			
				createStuff = false
			}
		
			audio_group_set_gain(soundEffects, soundVolume, 0)
			audio_group_set_gain(backgroundMusic, musicVolume, 0)
			
			if (keyboard_check_pressed(ord("5"))) {
				//targetRoom = "controls"
			}
		}
	
		currRoom = "options"
	} else if (room == rmControls) {
		if (backPressed) {
			targetRoom = "options"
		} else {
			if (createStuff) {
				instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
				instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, 0, objExitButton)
				createStuff = false
			}
		}
		
		currRoom = "controls"
	} else if (room == rmHelp) {
		if (backPressed) {
			targetRoom = "mainMenu"
		} else {
			if (createStuff) {
				instance_create_depth(backButtonOffset, backButtonOffset, -1, objBackButton)
				instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, -1, objExitButton)
				helpHighlightId = instance_create_depth(0, 0, -1, objHelpSelectHighlight)
				createStuff = false
			}
		
			if (mouse_y < room_height / 4) {
				helpHighlightId.y = 0
			} else if (mouse_y < room_height / 2) {
				helpHighlightId.y = room_height / 4
			} else if (mouse_y < room_height * 3 / 4) {
				helpHighlightId.y = room_height / 2
			} else {
				helpHighlightId.y = room_height * 3 / 4
			}
		
			if (mouse_check_button_pressed(mb_left)) {
				if (mouse_y < room_height / 4) {
					targetRoom = "mageHelp"
				} else if (mouse_y < room_height / 2) {
					targetRoom = "casterHelp"
				} else if (mouse_y < room_height * 3 / 4) {
					targetRoom = "rogueHelp"
				} else {
					targetRoom = "monkHelp"
				}
			}
		}
	
		if (backHover || exitHover) {
			helpHighlightId.visible = false
		} else {
			helpHighlightId.visible = true
		}
	
		currRoom = "help"
	} else if (room == rmMageHelp) {
		if (backPressed) {
			targetRoom = "help"
		} else {
			if (createStuff) {
				instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
				instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, 0, objExitButton)
			
				var size = 50

				for (var yy = 0; yy < room_width; yy += size) {
					for (var xx = 0; xx < room_width; xx += size) {
						instance_create_depth(xx, yy, 5, objDesertBk)
					}
				}
			
				createStuff = false
			}
		}
	
		currRoom = "mageHelp"
	} else if (room == rmCasterHelp) {
		if (backPressed) {
			targetRoom = "help"
		} else {
			if (createStuff) {
				instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
				instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, 0, objExitButton)
			
				var size = 50

				for (var yy = 0; yy < room_width; yy += size) {
					for (var xx = 0; xx < room_width; xx += size) {
						instance_create_depth(xx, yy, 5, objTundraBk)
					}
				}
			
				createStuff = false
			}
		}
	
		currRoom = "casterHelp"
	} else if (room == rmRogueHelp) {
		if (backPressed) {
			targetRoom = "help"
		} else {
			if (createStuff) {
				instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
				instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, 0, objExitButton)
			
				var size = 50

				for (var yy = 0; yy < room_width; yy += size) {
					for (var xx = 0; xx < room_width; xx += size) {
						instance_create_depth(xx, yy, 5, objMountainBk)
					}
				}
			
				createStuff = false
			}
		}
	
		currRoom = "rogueHelp"
	} else if (room == rmMonkHelp) {
		if (backPressed) {
			targetRoom = "help"
		} else {
			if (createStuff) {
				instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
				instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, 0, objExitButton)
			
				var size = 50

				for (var yy = 0; yy < room_width; yy += size) {
					for (var xx = 0; xx < room_width; xx += size) {
						instance_create_depth(xx, yy, 5, objForestBk)
					}
				}
			
				createStuff = false
			}
		}
	
		currRoom = "monkHelp"
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
						playerHandlerObj[i] = instance_create_depth(0, 0, i, objPlayerHandler)
						lockedIn[i] = false
					}
				} else {
					playerHandlerObj[1] = instance_create_depth(0, 0, -1, objPlayerHandler)
					playerHandlerObj[0] = instance_create_depth(0, 0, 0, objPlayerHandler)
				}
	
				instance_create_depth(backButtonOffset, backButtonOffset, 0, objBackButton)
				instance_create_depth(room_width - (exitButtonOffset + 40), exitButtonOffset, 0, objExitButton)
				bkMusic = sndEnergy
				audio_stop_all()
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
			}
		}
	
		currRoom = "game";
	}

	if (currRoom != targetRoom) {
		currTime++;
	
		var waitTime
	
		if (currRoom == "start" || currRoom == "mainMenu" || currRoom == "help" || backPressed) {
			waitTime = 0
		} else if (currRoom == "game") {
			waitTime = 1.5 * room_speed
		} else {
			waitTime = 0.5 * room_speed
		}
	
		if (scrInArena()) {
			audio_stop_sound(bkMusic)
			audio_stop_sound(lobbyMusic)
			audio_play_sound(lobbyMusic, 1, true)
		}
	
		if (currTime >= waitTime) {
			if (targetRoom == "mainMenu") {
				room_goto(rmMainMenu)
			} else if (targetRoom == "game") {
				room_goto(selectedMap)
			} else if (targetRoom == "characterSelect") {
				room_goto(rmCharacterSelect)
			} else if (targetRoom == "onePlayerMenu") {
				room_goto(rmOnePlayerMenu)
			} else if (targetRoom == "opCharacterSelect") {
				room_goto(rmOPCharacterSelect)
			} else if (targetRoom == "aiCharacterSelect") {
				room_goto(rmAICharacterSelect)
			} else if (targetRoom == "challengerCharacterSelect") {
				room_goto(rmChallengerCharacterSelect)
			} else if (targetRoom == "options") {
				room_goto(rmOptions)
			} else if (targetRoom == "controls") {
				room_goto(rmControls)
			} else if (targetRoom == "help") {
				room_goto(rmHelp)
			} else if (targetRoom == "mageHelp") {
				room_goto(rmMageHelp)
			} else if (targetRoom == "casterHelp") {
				room_goto(rmCasterHelp)
			} else if (targetRoom == "rogueHelp") {
				room_goto(rmRogueHelp)
			} else if (targetRoom == "monkHelp") {
				room_goto(rmMonkHelp)
			} else if (targetRoom == "mapSelect") {
				room_goto(rmMapSelect)
			}
		
			createStuff = true
			currTime = 0
		}
	} else {
		currTime = 0;
	}
}