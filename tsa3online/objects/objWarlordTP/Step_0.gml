/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3AB2A1AA
/// @DnDArgument : "code" "///@desc damage$(13_10)scrDamageStuff();"
///@desc damage
scrDamageStuff();

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 74C028A6
/// @DnDArgument : "code" "///@desc get input$(13_10)if (hp > 0) {$(13_10)	if (auto) {$(13_10)		scrAIMageGetInput();$(13_10)	} else {$(13_10)		scrPlayerGetInput();$(13_10)	}$(13_10)}"
///@desc get input
if (hp > 0) {
	if (auto) {
		scrAIMageGetInput();
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
/// @DnDArgument : "code" "///@desc abilities$(13_10)//ability input$(13_10)for (var i = 0; i < numAbilities; i++) {$(13_10)	if (cooldownTimer[i] > 0) {$(13_10)		cooldownTimer[i]--;$(13_10)		continue;$(13_10)	}$(13_10)	$(13_10)	var index = i + 4;$(13_10)	$(13_10)	if (durationHeld[index] > 0 && !heldBefore[index]) {$(13_10)		if (aState != abilityKey[i] && aPhase == "n") {$(13_10)			if (aPhase == "w") {$(13_10)				cooldownTimer[i] = cooldown[i];$(13_10)			}$(13_10)			$(13_10)			aState = abilityKey[i];$(13_10)			aPhase = "u";$(13_10)			timeInAPhase = 0;$(13_10)			abilityImageXScale = image_xscale;$(13_10)		}$(13_10)	} else if (aState == abilityKey[i]) {$(13_10)		if (aPhase != "n") {$(13_10)			timeInAPhase++;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "u" && timeInAPhase >= windUp[i]) {$(13_10)			aPhase = "d";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "d" && timeInAPhase >= duration[i]) {$(13_10)			aPhase = "w";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "w" && timeInAPhase >= windDown[i]) {$(13_10)			aPhase = "n";$(13_10)			timeInAPhase = 0;$(13_10)			aState = "n";$(13_10)			cooldownTimer[i] = cooldown[i];$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	if (aState != abilityKey[i]) {$(13_10)		firstTime[i] = true;$(13_10)	}$(13_10)}"
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
/// @DnDArgument : "code" "///@desc ability function$(13_10)if (aState == "1") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[0]) {$(13_10)			//instance_create_depth(preciseX, preciseY, thisNumber, objHammerSwing);$(13_10)			firstTime[0] = false;$(13_10)		}$(13_10)	$(13_10)		scrResetAir();$(13_10)	}$(13_10)} else if (aState == "2") {$(13_10)	if (aPhase == "u") {$(13_10)		if (timeInAPhase >= 0 && firstTime[1]) {$(13_10)			instance_create_depth(preciseX, preciseY, thisNumber, objFlashKick);$(13_10)			firstTime[1] = false;$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	scrResetAir();$(13_10)} else if (aState == "3") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[2]) {$(13_10)			var moveMod = instance_create(0, 0, objMoveMod);$(13_10)			moveMod.dx = image_xscale * dashXSpd;$(13_10)			moveMod.dy = dashYSpd;$(13_10)			moveMod.ddx = image_xscale * dashDXSpd;$(13_10)			moveMod.ddy = dashDYSpd;$(13_10)			moveMod.duration = dashDuration;$(13_10)			ds_list_add(envMoveModList, moveMod);$(13_10)			jumpEnabled = false;$(13_10)			firstTime[2] = false;$(13_10)		}$(13_10)		$(13_10)		if (!grounded && !jumpEnabled) {$(13_10)			jumpEnabed = true;$(13_10)			currAirJumps = -1;$(13_10)		}$(13_10)		$(13_10)		scrResetAir();$(13_10)	}$(13_10)} else if (aState == "4") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[3]) {$(13_10)			instance_create_depth(preciseX, preciseY, thisNumber, objHammerSwing)$(13_10)			firstTime[3] = false$(13_10)		}$(13_10)		$(13_10)	}$(13_10)	$(13_10)	scrResetAir();$(13_10)}"
///@desc ability function
if (aState == "1") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[0]) {
			//instance_create_depth(preciseX, preciseY, thisNumber, objHammerSwing);
			firstTime[0] = false;
		}
	
		scrResetAir();
	}
} else if (aState == "2") {
	if (aPhase == "u") {
		if (timeInAPhase >= 0 && firstTime[1]) {
			instance_create_depth(preciseX, preciseY, thisNumber, objFlashKick);
			firstTime[1] = false;
		}
	}
	
	scrResetAir();
} else if (aState == "3") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[2]) {
			var moveMod = instance_create(0, 0, objMoveMod);
			moveMod.dx = image_xscale * dashXSpd;
			moveMod.dy = dashYSpd;
			moveMod.ddx = image_xscale * dashDXSpd;
			moveMod.ddy = dashDYSpd;
			moveMod.duration = dashDuration;
			ds_list_add(envMoveModList, moveMod);
			jumpEnabled = false;
			firstTime[2] = false;
		}
		
		if (!grounded && !jumpEnabled) {
			jumpEnabed = true;
			currAirJumps = -1;
		}
		
		scrResetAir();
	}
} else if (aState == "4") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[3]) {
			instance_create_depth(preciseX, preciseY, thisNumber, objHammerSwing)
			firstTime[3] = false
		}
		
	}
	
	scrResetAir();
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 78F94C44
/// @DnDArgument : "code" "///@desc sprite and image$(13_10)if (aState == "n") {$(13_10)	if (durationHeld[RIGHT] > 0) {$(13_10)		image_xscale = 1;$(13_10)	} else if (durationHeld[LEFT] > 0) {$(13_10)		image_xscale = -1;$(13_10)	}$(13_10)} else {$(13_10)	image_xscale = abilityImageXScale;$(13_10)}$(13_10)$(13_10)/*$(13_10)if (currAirJumps == -1) {$(13_10)	if (!instance_exists(jumpIndicatorId)) {$(13_10)		jumpIndicatorId = instance_create_depth(preciseX, preciseY, thisNumber, objJumpIndicator);$(13_10)	}$(13_10)} else {$(13_10)	if (instance_exists(jumpIndicatorId)) {$(13_10)		with (jumpIndicatorId) {$(13_10)			instance_destroy();$(13_10)		}$(13_10)	}$(13_10)}$(13_10)$(13_10)if (aPhase != "n") {$(13_10)	if (aPhase == "u" && timeInAPhase == 0) {$(13_10)		image_index = 0;$(13_10)	}$(13_10)	$(13_10)	if (aState == "1") {$(13_10)		sprite_index = sprMonkCrescentPunch;$(13_10)	} else if (aState == "2") {$(13_10)		sprite_index = sprMonkFlashKick;$(13_10)	} else if (aState == "3") {$(13_10)		sprite_index = sprMonkDash;$(13_10)	} else if (aState == "4") {$(13_10)		sprite_index = sprMonkThousandPalmsPre;$(13_10)		$(13_10)		if (aPhase == "d") {$(13_10)			sprite_index = sprMonkThousandPalmsDuring;$(13_10)			$(13_10)			if (timeInAPhase == 0) {$(13_10)				image_index = 0;$(13_10)			}$(13_10)			$(13_10)			if (palmAngle < 90 || palmAngle > 270) {$(13_10)				image_xscale = 1;$(13_10)			} else {$(13_10)				image_xscale = -1;$(13_10)			}$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	if (aState != "4" && image_index >= image_number - image_speed) {$(13_10)		image_index = image_number - image_speed;$(13_10)	}$(13_10)} else if (!grounded) {$(13_10)	if (dy >= 0) {$(13_10)		sprite_index = sprMonkGoingUp;$(13_10)	} else {$(13_10)		sprite_index = sprMonkGoingDown;$(13_10)	}$(13_10)} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {$(13_10)	sprite_index = sprMonkMove;$(13_10)} else {$(13_10)	sprite_index = sprMonkNone;$(13_10)}$(13_10)*/$(13_10)$(13_10)if (hp <= 0) {$(13_10)	sprite_index = sprMine;$(13_10)}"
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

/*
if (currAirJumps == -1) {
	if (!instance_exists(jumpIndicatorId)) {
		jumpIndicatorId = instance_create_depth(preciseX, preciseY, thisNumber, objJumpIndicator);
	}
} else {
	if (instance_exists(jumpIndicatorId)) {
		with (jumpIndicatorId) {
			instance_destroy();
		}
	}
}

if (aPhase != "n") {
	if (aPhase == "u" && timeInAPhase == 0) {
		image_index = 0;
	}
	
	if (aState == "1") {
		sprite_index = sprMonkCrescentPunch;
	} else if (aState == "2") {
		sprite_index = sprMonkFlashKick;
	} else if (aState == "3") {
		sprite_index = sprMonkDash;
	} else if (aState == "4") {
		sprite_index = sprMonkThousandPalmsPre;
		
		if (aPhase == "d") {
			sprite_index = sprMonkThousandPalmsDuring;
			
			if (timeInAPhase == 0) {
				image_index = 0;
			}
			
			if (palmAngle < 90 || palmAngle > 270) {
				image_xscale = 1;
			} else {
				image_xscale = -1;
			}
		}
	}
	
	if (aState != "4" && image_index >= image_number - image_speed) {
		image_index = image_number - image_speed;
	}
} else if (!grounded) {
	if (dy >= 0) {
		sprite_index = sprMonkGoingUp;
	} else {
		sprite_index = sprMonkGoingDown;
	}
} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {
	sprite_index = sprMonkMove;
} else {
	sprite_index = sprMonkNone;
}
*/

if (hp <= 0) {
	sprite_index = sprMine;
}/**/