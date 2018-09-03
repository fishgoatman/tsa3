/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3AB2A1AA
/// @DnDArgument : "code" "///@desc damage$(13_10)scrDamageStuff();"
///@desc damage
scrDamageStuff();

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 74C028A6
/// @DnDArgument : "code" "///@desc get input$(13_10)if (hp > 0) {$(13_10)	if (auto) {$(13_10)		scrAIGetInput();$(13_10)	} else {$(13_10)		scrPlayerGetInput();$(13_10)	}$(13_10)}"
///@desc get input
if (hp > 0) {
	if (auto) {
		scrAIGetInput();
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
/// @DnDArgument : "code" "///@desc abilities$(13_10)//ability input$(13_10)for (var i = 0; i < numAbilities; i++) {$(13_10)	if (cooldownTimer[i] >= 1) {$(13_10)		cooldownTimer[i]--;$(13_10)		continue;$(13_10)	} else {$(13_10)		cooldownTimer[i] = 0;$(13_10)	}$(13_10)	$(13_10)	var index = i + 4;$(13_10)	$(13_10)	if (durationHeld[index] > 0 && !heldBefore[index]) {$(13_10)		if (aState != abilityKey[i] && aPhase == "n") {$(13_10)			if (aPhase == "w") {$(13_10)				cooldownTimer[i] = cooldown[i];$(13_10)			}$(13_10)			$(13_10)			aState = abilityKey[i];$(13_10)			aPhase = "u";$(13_10)			timeInAPhase = 0;$(13_10)			abilityImageXScale = image_xscale;$(13_10)		}$(13_10)	} else if (aState == abilityKey[i]) {$(13_10)		if (aPhase != "n") {$(13_10)			timeInAPhase++;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "u" && timeInAPhase >= windUp[i]) {$(13_10)			aPhase = "d";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "d" && timeInAPhase >= duration[i]) {$(13_10)			aPhase = "w";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "w" && timeInAPhase >= windDown[i]) {$(13_10)			aPhase = "n";$(13_10)			timeInAPhase = 0;$(13_10)			aState = "n";$(13_10)			cooldownTimer[i] = cooldown[i];$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	if (aState != abilityKey[i]) {$(13_10)		firstTime[i] = true;$(13_10)	}$(13_10)}"
///@desc abilities
//ability input
for (var i = 0; i < numAbilities; i++) {
	if (cooldownTimer[i] >= 1) {
		cooldownTimer[i]--;
		continue;
	} else {
		cooldownTimer[i] = 0;
	}
	
	var index = i + 4;
	
	if (durationHeld[index] > 0 && !heldBefore[index]) {
		if (aState != abilityKey[i] && aPhase == "n") {
			if (aPhase == "w") {
				cooldownTimer[i] = cooldown[i];
			}
			
			aState = abilityKey[i];
			aPhase = "u";
			timeInAPhase = 0;
			abilityImageXScale = image_xscale;
		}
	} else if (aState == abilityKey[i]) {
		if (aPhase != "n") {
			timeInAPhase++;
		}
			
		if (aPhase == "u" && timeInAPhase >= windUp[i]) {
			aPhase = "d";
			timeInAPhase = 0;
		}
			
		if (aPhase == "d" && timeInAPhase >= duration[i]) {
			aPhase = "w";
			timeInAPhase = 0;
		}
			
		if (aPhase == "w" && timeInAPhase >= windDown[i]) {
			aPhase = "n";
			timeInAPhase = 0;
			aState = "n";
			cooldownTimer[i] = cooldown[i];
		}
	}
	
	if (aState != abilityKey[i]) {
		firstTime[i] = true;
	}
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3771CA6E
/// @DnDArgument : "code" "///@desc ability function$(13_10)if (!(aState == "3" && aPhase == "d") && instance_exists(shadowId)) {$(13_10)	preciseX = endX;$(13_10)	preciseY = endY;$(13_10)			$(13_10)	with (shadowId) {$(13_10)		instance_destroy();$(13_10)	}$(13_10)}$(13_10)$(13_10)if (aState == "1") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[0]) {$(13_10)			instance_create_depth(preciseX, preciseY, thisNumber, objIceShot);$(13_10)			firstTime[0] = false;$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	scrResetAir();$(13_10)} else if (aState == "2") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[1]) {$(13_10)			lobId = instance_create_depth(preciseX, preciseY, thisNumber, objIceLob);$(13_10)			firstTime[1] = false;$(13_10)		}$(13_10)	}$(13_10)} else if (aState == "3") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[2]) {$(13_10)			endX = preciseX + image_xscale * teleportDist;$(13_10)			$(13_10)			if (endX < 1) {$(13_10)				endX = 1;$(13_10)			}$(13_10)			$(13_10)			if (endX > room_width - 1) {$(13_10)				endX = room_width - 1;$(13_10)			}$(13_10)			$(13_10)			endY = preciseY;$(13_10)			preciseX = room_width / 2;$(13_10)			preciseY = -50;$(13_10)			shadowId = instance_create_depth(endX, endY, thisNumber, objCasterShadow);$(13_10)			firstTime[2] = false;$(13_10)		} else if (timeInAPhase >= duration[2] - 1) {$(13_10)			scrResetAir();$(13_10)			preciseX = endX;$(13_10)			preciseY = endY;$(13_10)			$(13_10)			with (shadowId) {$(13_10)				instance_destroy();$(13_10)			}$(13_10)		}$(13_10)	}$(13_10)} else if (aState == "4") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[3]) {$(13_10)			//instance_create_depth(preciseX + slowOffset * image_xscale, room_height, thisNumber, objIceSlow);$(13_10)			instance_create_depth(preciseX, preciseY, thisNumber, objIceBall)$(13_10)			firstTime[3] = false;$(13_10)		}$(13_10)	}$(13_10)}"
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
			instance_create_depth(preciseX, preciseY, thisNumber, objIceShot);
			firstTime[0] = false;
		}
	}
	
	scrResetAir();
} else if (aState == "2") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[1]) {
			lobId = instance_create_depth(preciseX, preciseY, thisNumber, objIceLob);
			firstTime[1] = false;
		}
	}
} else if (aState == "3") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[2]) {
			endX = preciseX + image_xscale * teleportDist;
			
			if (endX < 1) {
				endX = 1;
			}
			
			if (endX > room_width - 1) {
				endX = room_width - 1;
			}
			
			endY = preciseY;
			preciseX = room_width / 2;
			preciseY = -50;
			shadowId = instance_create_depth(endX, endY, thisNumber, objCasterShadow);
			firstTime[2] = false;
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
			instance_create_depth(preciseX, preciseY, thisNumber, objIceBall)
			firstTime[3] = false;
		}
	}
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 78F94C44
/// @DnDArgument : "code" "///@desc sprite and image$(13_10)if (aState == "n") {$(13_10)	if (durationHeld[RIGHT] > 0) {$(13_10)		image_xscale = 1;$(13_10)	} else if (durationHeld[LEFT] > 0) {$(13_10)		image_xscale = -1;$(13_10)	}$(13_10)} else {$(13_10)	image_xscale = abilityImageXScale;$(13_10)}$(13_10)$(13_10)if (aPhase != "n") {$(13_10)	if (aPhase == "u" && timeInAPhase == 0) {$(13_10)		image_index = 0;$(13_10)	}$(13_10)	$(13_10)	if (aState == "1") {$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprCasterShoot2$(13_10)		} else {$(13_10)			sprite_index = sprCasterShoot$(13_10)		}$(13_10)	} else if (aState == "2") {$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprCasterLob2$(13_10)		} else {$(13_10)			sprite_index = sprCasterLob$(13_10)		}$(13_10)	} else if (aState == "4") {$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprCasterBlizzard2$(13_10)		} else {$(13_10)			sprite_index = sprCasterBlizzard$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	if (image_index >= image_number - image_speed) {$(13_10)		image_index = image_number - image_speed;$(13_10)	}$(13_10)} else if (!grounded) {$(13_10)	if (dy >= 0) {$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprCasterGoingUp2$(13_10)		} else {$(13_10)			sprite_index = sprCasterGoingUp$(13_10)		}$(13_10)	} else {$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprCasterGoingDown2$(13_10)		} else {$(13_10)			sprite_index = sprCasterGoingDown$(13_10)		}$(13_10)	}$(13_10)} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {$(13_10)	if (sprite2) {$(13_10)		sprite_index = sprCasterMove2$(13_10)	} else {$(13_10)		sprite_index = sprCasterMove$(13_10)	}$(13_10)} else {$(13_10)	if (sprite2) {$(13_10)		sprite_index = sprCasterNone2$(13_10)	} else {$(13_10)		sprite_index = sprCasterNone$(13_10)	}$(13_10)}$(13_10)$(13_10)if (hp <= 0) {$(13_10)	sprite_index = sprMine;$(13_10)}"
///@desc sprite and image
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
	if (aPhase == "u" && timeInAPhase == 0) {
		image_index = 0;
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

if (hp <= 0) {
	sprite_index = sprMine;
}