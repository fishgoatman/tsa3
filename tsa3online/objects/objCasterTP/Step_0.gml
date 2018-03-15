/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3AB2A1AA
/// @DnDArgument : "code" "///@desc damage$(13_10)scrDamageStuff();"
///@desc damage
scrDamageStuff();

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 74C028A6
/// @DnDArgument : "code" "///@desc get input$(13_10)if (hp > 0) {$(13_10)	scrPlayerGetInput();$(13_10)}"
///@desc get input
if (hp > 0) {
	scrPlayerGetInput();
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
/// @DnDArgument : "code" "///@desc abilities$(13_10)//ability input$(13_10)for (var i = 0; i < numAbilities; i++) {$(13_10)	if (cooldownTimer[i] > 0) {$(13_10)		cooldownTimer[i]--;$(13_10)		continue;$(13_10)	}$(13_10)	$(13_10)	var index = i + 4;$(13_10)	$(13_10)	if (durationHeld[index] > 0 && !heldBefore[index]) {$(13_10)		if (aState != abilityKey[i] && aPhase == "n") {$(13_10)			if (aPhase == "w") {$(13_10)				cooldownTimer[i] = cooldown[i];$(13_10)			}$(13_10)			$(13_10)			aState = abilityKey[i];$(13_10)			aPhase = "u";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)	} else if (aState == abilityKey[i]) {$(13_10)		if (aPhase != "n") {$(13_10)			timeInAPhase++;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "u" && timeInAPhase >= windUp[i]) {$(13_10)			aPhase = "d";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "d" && timeInAPhase >= duration[i]) {$(13_10)			aPhase = "w";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "w" && timeInAPhase >= windDown[i]) {$(13_10)			aPhase = "n";$(13_10)			timeInAPhase = 0;$(13_10)			aState = "n";$(13_10)			cooldownTimer[i] = cooldown[i];$(13_10)		}$(13_10)	}$(13_10)}"
///@desc abilities
//ability input
for (var i = 0; i < numAbilities; i++) {
	if (cooldownTimer[i] > 0) {
		cooldownTimer[i]--;
		continue;
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
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3771CA6E
/// @DnDArgument : "code" "///@desc ability function$(13_10)//show_debug_message(string(aState) + " " + string(aPhase));$(13_10)if (aState == "1") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase == 0) {$(13_10)			instance_create_depth(preciseX, preciseY, thisNumber, objIceShot);$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	scrResetAir();$(13_10)} else if (aState == "2") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase == 0) {$(13_10)			lobId = instance_create_depth(preciseX, preciseY, thisNumber, objIceLob);$(13_10)		}$(13_10)	}$(13_10)} else if (aState == "3") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase == 0) {$(13_10)			endX = preciseX + image_xscale * teleportDist;$(13_10)			$(13_10)			if (endX < 1) {$(13_10)				endX = 1;$(13_10)			}$(13_10)			$(13_10)			if (endX > room_width - 1) {$(13_10)				endX = room_width - 1;$(13_10)			}$(13_10)			$(13_10)			endY = preciseY;$(13_10)			preciseX = room_width / 2;$(13_10)			preciseY = -50;$(13_10)			shadowId = instance_create_depth(endX, endY, thisNumber, objCasterShadow);$(13_10)		} else if (timeInAPhase >= duration[2] - 1) {$(13_10)			scrResetAir();$(13_10)			preciseX = endX;$(13_10)			preciseY = endY;$(13_10)			$(13_10)			with (shadowId) {$(13_10)				instance_destroy();$(13_10)			}$(13_10)		}$(13_10)	}$(13_10)} else if (aState == "4") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase == 0) {$(13_10)			instance_create_depth(preciseX + slowOffset * image_xscale, room_height, thisNumber, objIceSlow);$(13_10)		}$(13_10)	}$(13_10)}"
///@desc ability function
//show_debug_message(string(aState) + " " + string(aPhase));
if (aState == "1") {
	if (aPhase == "d") {
		if (timeInAPhase == 0) {
			instance_create_depth(preciseX, preciseY, thisNumber, objIceShot);
		}
	}
	
	scrResetAir();
} else if (aState == "2") {
	if (aPhase == "d") {
		if (timeInAPhase == 0) {
			lobId = instance_create_depth(preciseX, preciseY, thisNumber, objIceLob);
		}
	}
} else if (aState == "3") {
	if (aPhase == "d") {
		if (timeInAPhase == 0) {
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
		if (timeInAPhase == 0) {
			instance_create_depth(preciseX + slowOffset * image_xscale, room_height, thisNumber, objIceSlow);
		}
	}
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 78F94C44
/// @DnDArgument : "code" "///@desc sprite and image$(13_10)if (durationHeld[RIGHT] > 0) {$(13_10)	image_xscale = 1;$(13_10)} else if (durationHeld[LEFT] > 0) {$(13_10)	image_xscale = -1;$(13_10)}$(13_10)$(13_10)if (hp <= 0) {$(13_10)	sprite_index = sprMine;$(13_10)}$(13_10)$(13_10)/*if (aPhase != "n") {$(13_10)	if (aState == "4") {$(13_10)		if (aPhase == "u") {$(13_10)			sprite_index = sprMagePreBlast;$(13_10)			$(13_10)			if (timeInAPhase == 0) {$(13_10)				image_index = 0;$(13_10)			}$(13_10)		} else if (aPhase == "d") {$(13_10)			sprite_index = sprMagePostBlast;$(13_10)			$(13_10)			if (timeInAPhase == 0) {$(13_10)				image_index = 0;$(13_10)			}$(13_10)		}$(13_10)	}$(13_10)} else if (!grounded) {$(13_10)	if (dy >= 0) {$(13_10)		sprite_index = sprMageGoingUp;$(13_10)	} else {$(13_10)		sprite_index = sprMageGoingDown;$(13_10)	}$(13_10)} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {$(13_10)	sprite_index = sprMageMove;$(13_10)} else {$(13_10)	sprite_index = sprMageNone;$(13_10)}*/"
///@desc sprite and image
if (durationHeld[RIGHT] > 0) {
	image_xscale = 1;
} else if (durationHeld[LEFT] > 0) {
	image_xscale = -1;
}

if (hp <= 0) {
	sprite_index = sprMine;
}

/*if (aPhase != "n") {
	if (aState == "4") {
		if (aPhase == "u") {
			sprite_index = sprMagePreBlast;
			
			if (timeInAPhase == 0) {
				image_index = 0;
			}
		} else if (aPhase == "d") {
			sprite_index = sprMagePostBlast;
			
			if (timeInAPhase == 0) {
				image_index = 0;
			}
		}
	}
} else if (!grounded) {
	if (dy >= 0) {
		sprite_index = sprMageGoingUp;
	} else {
		sprite_index = sprMageGoingDown;
	}
} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {
	sprite_index = sprMageMove;
} else {
	sprite_index = sprMageNone;
}*//**/