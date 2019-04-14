/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3AB2A1AA
/// @DnDArgument : "code" "///@desc damage$(13_10)scrDamageStuff();"
///@desc damage
scrDamageStuff();

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 74C028A6
/// @DnDArgument : "code" "///@desc get input$(13_10)if (hp > 0) {$(13_10)	if (room == rmCasterHelp) {$(13_10)	} else if (auto || ai) {$(13_10)		scrAICasterGetInput();$(13_10)	} else {$(13_10)		scrPlayerGetInput();$(13_10)	}$(13_10)}"
///@desc get input
if (hp > 0) {
	if (room == rmCasterHelp) {
	} else if (auto || ai) {
		scrAICasterGetInput();
	} else {
		scrPlayerGetInput();
	}
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 58EEEB9A
/// @DnDArgument : "code" "///@desc movement$(13_10)scrPlayerMovementCode();"
///@desc movement
scrPlayerMovementCode();

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 1B235E9C
/// @DnDArgument : "code" "///@desc abilities$(13_10)//ability input$(13_10)for (var i = 0; i < numAbilities; i++) {$(13_10)	if (current_time < cooldownTime[i]) {$(13_10)		continue$(13_10)	}$(13_10)	$(13_10)	var index = i + 4$(13_10)	$(13_10)	if (aPhase == "n" && durationHeld[index] > 0 && !heldBefore[index]) {$(13_10)		aState = abilityKey[i]$(13_10)		aPhase = "u"$(13_10)		aPhaseChangeTime = current_time + windUp[i]$(13_10)		abilityImageXScale = image_xscale$(13_10)		abilityPreciseX = preciseX$(13_10)		abilityPreciseY = preciseY$(13_10)		firstTime[i] = true$(13_10)		resetImageIndex = true$(13_10)		$(13_10)		//online stuff$(13_10)		clientAState = aState$(13_10)		timeToActivate = aPhaseChangeTime$(13_10)		abilitySentNum++$(13_10)	} else if (aState == abilityKey[i]) {$(13_10)		if (aPhase == "u" && current_time >= aPhaseChangeTime) {$(13_10)			aPhase = "d"$(13_10)			aPhaseChangeTime = current_time + duration[i]$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "d" && current_time >= aPhaseChangeTime) {$(13_10)			aPhase = "w"$(13_10)			aPhaseChangeTime = current_time + windDown[i]$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "w" && current_time >= aPhaseChangeTime) {$(13_10)			aPhase = "n"$(13_10)			aState = "n"$(13_10)			cooldownTime[i] = current_time + cooldown[i]$(13_10)		}$(13_10)	}$(13_10)}"
///@desc abilities
//ability input
for (var i = 0; i < numAbilities; i++) {
	if (current_time < cooldownTime[i]) {
		continue
	}
	
	var index = i + 4
	
	if (aPhase == "n" && durationHeld[index] > 0 && !heldBefore[index]) {
		aState = abilityKey[i]
		aPhase = "u"
		aPhaseChangeTime = current_time + windUp[i]
		abilityImageXScale = image_xscale
		abilityPreciseX = preciseX
		abilityPreciseY = preciseY
		firstTime[i] = true
		resetImageIndex = true
		
		//online stuff
		clientAState = aState
		timeToActivate = aPhaseChangeTime
		abilitySentNum++
	} else if (aState == abilityKey[i]) {
		if (aPhase == "u" && current_time >= aPhaseChangeTime) {
			aPhase = "d"
			aPhaseChangeTime = current_time + duration[i]
		}
			
		if (aPhase == "d" && current_time >= aPhaseChangeTime) {
			aPhase = "w"
			aPhaseChangeTime = current_time + windDown[i]
		}
			
		if (aPhase == "w" && current_time >= aPhaseChangeTime) {
			aPhase = "n"
			aState = "n"
			cooldownTime[i] = current_time + cooldown[i]
		}
	}
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3771CA6E
/// @DnDArgument : "code" "///@desc ability function$(13_10)if (!(aState == "3" && aPhase == "d") && instance_exists(shadowId)) {$(13_10)	preciseX = endX;$(13_10)	preciseY = endY;$(13_10)			$(13_10)	with (shadowId) {$(13_10)		instance_destroy();$(13_10)	}$(13_10)}$(13_10)$(13_10)if (aState == "1") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[0]) {$(13_10)			//instance_create_depth(preciseX, preciseY, thisNumber, objIceShot1)$(13_10)			$(13_10)			for (var i = 0; i < shotAmount; i++) {$(13_10)				var xDist$(13_10)				$(13_10)				if (i == 1) {$(13_10)					xDist = shotXMax$(13_10)				} else {$(13_10)					xDist = shotXMin$(13_10)				}$(13_10)				$(13_10)				instance_create_depth(abilityPreciseX + xDist * image_xscale, abilityPreciseY - (shotAmount - 1) * shotDist / 2 + i * shotDist, thisNumber, objIceTriShot)$(13_10)			}$(13_10)			$(13_10)			firstTime[0] = false$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	scrResetAir();$(13_10)} else if (aState == "2") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[1]) {$(13_10)			lobId = instance_create_depth(abilityPreciseX, abilityPreciseY, thisNumber, objIceLob)$(13_10)			audio_play_sound(sndIceLob, 1, false)$(13_10)			firstTime[1] = false$(13_10)		}$(13_10)	}$(13_10)} else if (aState == "3") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[2]) {$(13_10)			endX = abilityPreciseX + image_xscale * teleportDist;$(13_10)			$(13_10)			if (endX < 1) {$(13_10)				endX = 1;$(13_10)			}$(13_10)			$(13_10)			var maxX$(13_10)			$(13_10)			if (scrInArena()) {$(13_10)				maxX = room_width - 1$(13_10)			} else if (room == rmMainMenu || room == rmCasterHelp) {$(13_10)				maxX = room_width / 2 - 1$(13_10)			}$(13_10)			$(13_10)			if (endX > maxX) {$(13_10)				endX = maxX$(13_10)			}$(13_10)			$(13_10)			endY = abilityPreciseY$(13_10)			preciseX = room_width / 2$(13_10)			preciseY = -50$(13_10)			shadowId = instance_create_depth(endX, endY, thisNumber, objCasterShadow)$(13_10)			audio_play_sound(sndTeleport, 1, false)$(13_10)			firstTime[2] = false$(13_10)		} else if (timeInAPhase >= duration[2] - 1) {$(13_10)			scrResetAir();$(13_10)			preciseX = endX;$(13_10)			preciseY = endY;$(13_10)			$(13_10)			with (shadowId) {$(13_10)				instance_destroy();$(13_10)			}$(13_10)		}$(13_10)	}$(13_10)} else if (aState == "4") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[3]) {$(13_10)			//instance_create_depth(preciseX + slowOffset * image_xscale, room_height, thisNumber, objIceSlow);$(13_10)			ballId = instance_create_depth(abilityPreciseX, abilityPreciseY, thisNumber, objIceBall)$(13_10)			firstTime[3] = false;$(13_10)		}$(13_10)	}$(13_10)}"
///@desc ability function
if (!(aState == "3" && aPhase == "d") && instance_exists(shadowId)) {
	preciseX = endX;
	preciseY = endY;
			
	with (shadowId) {
		instance_destroy();
	}
}

if (aState == "1") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[0]) {
			//instance_create_depth(preciseX, preciseY, thisNumber, objIceShot1)
			
			for (var i = 0; i < shotAmount; i++) {
				var xDist
				
				if (i == 1) {
					xDist = shotXMax
				} else {
					xDist = shotXMin
				}
				
				instance_create_depth(abilityPreciseX + xDist * image_xscale, abilityPreciseY - (shotAmount - 1) * shotDist / 2 + i * shotDist, thisNumber, objIceTriShot)
			}
			
			firstTime[0] = false
		}
	}
	
	scrResetAir();
} else if (aState == "2") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[1]) {
			lobId = instance_create_depth(abilityPreciseX, abilityPreciseY, thisNumber, objIceLob)
			audio_play_sound(sndIceLob, 1, false)
			firstTime[1] = false
		}
	}
} else if (aState == "3") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[2]) {
			endX = abilityPreciseX + image_xscale * teleportDist;
			
			if (endX < 1) {
				endX = 1;
			}
			
			var maxX
			
			if (scrInArena()) {
				maxX = room_width - 1
			} else if (room == rmMainMenu || room == rmCasterHelp) {
				maxX = room_width / 2 - 1
			}
			
			if (endX > maxX) {
				endX = maxX
			}
			
			endY = abilityPreciseY
			preciseX = room_width / 2
			preciseY = -50
			shadowId = instance_create_depth(endX, endY, thisNumber, objCasterShadow)
			audio_play_sound(sndTeleport, 1, false)
			firstTime[2] = false
		} else if (timeInAPhase >= duration[2] - 1) {
			scrResetAir();
			preciseX = endX;
			preciseY = endY;
			
			with (shadowId) {
				instance_destroy();
			}
		}
	}
} else if (aState == "4") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[3]) {
			//instance_create_depth(preciseX + slowOffset * image_xscale, room_height, thisNumber, objIceSlow);
			ballId = instance_create_depth(abilityPreciseX, abilityPreciseY, thisNumber, objIceBall)
			firstTime[3] = false;
		}
	}
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 78F94C44
/// @DnDArgument : "code" "///@desc sprite and image$(13_10)if (hp <= 0) {$(13_10)	if (sprite_index != sprCasterDeath && sprite_index != sprCasterDeath2) {$(13_10)		image_index = 0$(13_10)		$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprCasterDeath2$(13_10)		} else {$(13_10)			sprite_index = sprCasterDeath$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	if (image_index >= image_number - image_speed) {$(13_10)		image_speed = 0$(13_10)	}$(13_10)} else {$(13_10)	if (aState == "n") {$(13_10)		if (durationHeld[RIGHT] > 0) {$(13_10)			image_xscale = 1;$(13_10)		} else if (durationHeld[LEFT] > 0) {$(13_10)			image_xscale = -1;$(13_10)		}$(13_10)	} else {$(13_10)		image_xscale = abilityImageXScale;$(13_10)	}$(13_10)$(13_10)	if (aPhase != "n") {$(13_10)		if (resetImageIndex) {$(13_10)			image_index = 0$(13_10)			resetImageIndex = false$(13_10)		}$(13_10)	$(13_10)		if (aState == "1") {$(13_10)			if (sprite2) {$(13_10)				sprite_index = sprCasterShoot2$(13_10)			} else {$(13_10)				sprite_index = sprCasterShoot$(13_10)			}$(13_10)		} else if (aState == "2") {$(13_10)			if (sprite2) {$(13_10)				sprite_index = sprCasterLob2$(13_10)			} else {$(13_10)				sprite_index = sprCasterLob$(13_10)			}$(13_10)		} else if (aState == "4") {$(13_10)			if (sprite2) {$(13_10)				sprite_index = sprCasterBlizzard2$(13_10)			} else {$(13_10)				sprite_index = sprCasterBlizzard$(13_10)			}$(13_10)		}$(13_10)	$(13_10)		if (image_index >= image_number - image_speed) {$(13_10)			image_index = image_number - image_speed;$(13_10)		}$(13_10)	} else if (!grounded) {$(13_10)		if (dy >= 0) {$(13_10)			if (sprite2) {$(13_10)				sprite_index = sprCasterGoingUp2$(13_10)			} else {$(13_10)				sprite_index = sprCasterGoingUp$(13_10)			}$(13_10)		} else {$(13_10)			if (sprite2) {$(13_10)				sprite_index = sprCasterGoingDown2$(13_10)			} else {$(13_10)				sprite_index = sprCasterGoingDown$(13_10)			}$(13_10)		}$(13_10)	} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprCasterMove2$(13_10)		} else {$(13_10)			sprite_index = sprCasterMove$(13_10)		}$(13_10)	} else {$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprCasterNone2$(13_10)		} else {$(13_10)			sprite_index = sprCasterNone$(13_10)		}$(13_10)	}$(13_10)}"
///@desc sprite and image
if (hp <= 0) {
	if (sprite_index != sprCasterDeath && sprite_index != sprCasterDeath2) {
		image_index = 0
		
		if (sprite2) {
			sprite_index = sprCasterDeath2
		} else {
			sprite_index = sprCasterDeath
		}
	}
	
	if (image_index >= image_number - image_speed) {
		image_speed = 0
	}
} else {
	if (aState == "n") {
		if (durationHeld[RIGHT] > 0) {
			image_xscale = 1;
		} else if (durationHeld[LEFT] > 0) {
			image_xscale = -1;
		}
	} else {
		image_xscale = abilityImageXScale;
	}

	if (aPhase != "n") {
		if (resetImageIndex) {
			image_index = 0
			resetImageIndex = false
		}
	
		if (aState == "1") {
			if (sprite2) {
				sprite_index = sprCasterShoot2
			} else {
				sprite_index = sprCasterShoot
			}
		} else if (aState == "2") {
			if (sprite2) {
				sprite_index = sprCasterLob2
			} else {
				sprite_index = sprCasterLob
			}
		} else if (aState == "4") {
			if (sprite2) {
				sprite_index = sprCasterBlizzard2
			} else {
				sprite_index = sprCasterBlizzard
			}
		}
	
		if (image_index >= image_number - image_speed) {
			image_index = image_number - image_speed;
		}
	} else if (!grounded) {
		if (dy >= 0) {
			if (sprite2) {
				sprite_index = sprCasterGoingUp2
			} else {
				sprite_index = sprCasterGoingUp
			}
		} else {
			if (sprite2) {
				sprite_index = sprCasterGoingDown2
			} else {
				sprite_index = sprCasterGoingDown
			}
		}
	} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {
		if (sprite2) {
			sprite_index = sprCasterMove2
		} else {
			sprite_index = sprCasterMove
		}
	} else {
		if (sprite2) {
			sprite_index = sprCasterNone2
		} else {
			sprite_index = sprCasterNone
		}
	}
}