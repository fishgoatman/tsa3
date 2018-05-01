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
/// @DnDArgument : "code" "///@desc ability function$(13_10)//show_debug_message(string(aState) + " " + string(aPhase));$(13_10)if (aState == "1") {$(13_10)	if (aPhase == "d" && timeInAPhase >= 0 && firstTime[0]) {$(13_10)		for (var i = 0; i < fanNumKnives; i++) {$(13_10)			fanCurrAngle = 90 - 90 * image_xscale - fanAngle / fanNumKnives * i * image_xscale;$(13_10)			instance_create_depth(preciseX, preciseY, thisNumber, objKnife);$(13_10)		}$(13_10)		$(13_10)		firstTime[0] = false;$(13_10)	}$(13_10)	$(13_10)	scrResetAir();$(13_10)} else if (aState == "2") {$(13_10)	if (aPhase == "d" && timeInAPhase >= 0 && firstTime[1]) {$(13_10)		instance_create_depth(preciseX, preciseY, thisNumber, objPiercingKnife);$(13_10)		var moveMod = instance_create(0, 0, objMoveMod);$(13_10)		moveMod.dx = image_xscale * pierceDashSpd;$(13_10)		moveMod.ddx = -image_xscale * pierceDashDSpd;$(13_10)		moveMod.duration = duration[1];$(13_10)		ds_list_add(envMoveModList, moveMod);$(13_10)		firstTime[1] = false;$(13_10)	}$(13_10)	$(13_10)	scrResetAir();$(13_10)} else if (aState == "3") {$(13_10)	if (aPhase == "d" && timeInAPhase >= 0 && firstTime[2]) {$(13_10)		for (var i = 0; i < jumpNumKnives; i++) {$(13_10)			fanCurrAngle = 270 - jumpKnifeAngle / 2 + jumpKnifeAngle / jumpNumKnives * i;$(13_10)			instance_create_depth(preciseX, preciseY, thisNumber, objKnife);$(13_10)		}$(13_10)		$(13_10)		scrResetAir();$(13_10)		preciseY--;$(13_10)		jumpMoveMod = instance_create(0, 0, objMoveMod);$(13_10)		jumpMoveMod.dy = jumpPower;$(13_10)		jumpMoveMod.forever = true;$(13_10)		ds_list_add(moveModList, jumpMoveMod);$(13_10)		firstTime[2] = false;$(13_10)	}$(13_10)} else if (aState == "4") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[3]) {$(13_10)			for (var i = 0; i < blinkNumBlades; i++) {$(13_10)				blinkCurrAngle = 90 - 90 * image_xscale - blinkBladeAngle / 2 + blinkBladeAngle / blinkNumBlades * i;$(13_10)				instance_create_depth(preciseX, preciseY, thisNumber, objBlade);$(13_10)			}$(13_10)			$(13_10)			var moveMod = instance_create(0, 0, objMoveMod);$(13_10)			moveMod.dx = -image_xscale * blinkSpd;$(13_10)			moveMod.ddx = image_xscale * blinkDSpd;$(13_10)			moveMod.duration = duration[1];$(13_10)			ds_list_add(envMoveModList, moveMod);$(13_10)			firstTime[3] = false;$(13_10)		}$(13_10)		$(13_10)		//scrResetAir();$(13_10)	}$(13_10)}"
///@desc ability function
//show_debug_message(string(aState) + " " + string(aPhase));
if (aState == "1") {
	if (aPhase == "d" && timeInAPhase >= 0 && firstTime[0]) {
		for (var i = 0; i < fanNumKnives; i++) {
			fanCurrAngle = 90 - 90 * image_xscale - fanAngle / fanNumKnives * i * image_xscale;
			instance_create_depth(preciseX, preciseY, thisNumber, objKnife);
		}
		
		firstTime[0] = false;
	}
	
	scrResetAir();
} else if (aState == "2") {
	if (aPhase == "d" && timeInAPhase >= 0 && firstTime[1]) {
		instance_create_depth(preciseX, preciseY, thisNumber, objPiercingKnife);
		var moveMod = instance_create(0, 0, objMoveMod);
		moveMod.dx = image_xscale * pierceDashSpd;
		moveMod.ddx = -image_xscale * pierceDashDSpd;
		moveMod.duration = duration[1];
		ds_list_add(envMoveModList, moveMod);
		firstTime[1] = false;
	}
	
	scrResetAir();
} else if (aState == "3") {
	if (aPhase == "d" && timeInAPhase >= 0 && firstTime[2]) {
		for (var i = 0; i < jumpNumKnives; i++) {
			fanCurrAngle = 270 - jumpKnifeAngle / 2 + jumpKnifeAngle / jumpNumKnives * i;
			instance_create_depth(preciseX, preciseY, thisNumber, objKnife);
		}
		
		scrResetAir();
		preciseY--;
		jumpMoveMod = instance_create(0, 0, objMoveMod);
		jumpMoveMod.dy = jumpPower;
		jumpMoveMod.forever = true;
		ds_list_add(moveModList, jumpMoveMod);
		firstTime[2] = false;
	}
} else if (aState == "4") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[3]) {
			for (var i = 0; i < blinkNumBlades; i++) {
				blinkCurrAngle = 90 - 90 * image_xscale - blinkBladeAngle / 2 + blinkBladeAngle / blinkNumBlades * i;
				instance_create_depth(preciseX, preciseY, thisNumber, objBlade);
			}
			
			var moveMod = instance_create(0, 0, objMoveMod);
			moveMod.dx = -image_xscale * blinkSpd;
			moveMod.ddx = image_xscale * blinkDSpd;
			moveMod.duration = duration[1];
			ds_list_add(envMoveModList, moveMod);
			firstTime[3] = false;
		}
		
		//scrResetAir();
	}
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 78F94C44
/// @DnDArgument : "code" "///@desc sprite and image$(13_10)if (aState == "n") {$(13_10)	if (durationHeld[RIGHT] > 0) {$(13_10)		image_xscale = 1;$(13_10)	} else if (durationHeld[LEFT] > 0) {$(13_10)		image_xscale = -1;$(13_10)	}$(13_10)} else {$(13_10)	image_xscale = abilityImageXScale;$(13_10)}$(13_10)$(13_10)if (aPhase != "n") {$(13_10)	if (aPhase == "u" && timeInAPhase == 0) {$(13_10)		image_index = 0;$(13_10)	}$(13_10)	$(13_10)	if (aState == "1") {$(13_10)		sprite_index = sprRogueAttack;$(13_10)	} else if (aState == "2") {$(13_10)		if (aPhase == "d" && timeInAPhase == 0) {$(13_10)			image_index = 0;$(13_10)		}$(13_10)		$(13_10)		if (aPhase == "u") {$(13_10)			sprite_index = sprRogueNoneDuck;$(13_10)		} else {$(13_10)			sprite_index = sprRogueDash;$(13_10)		}$(13_10)	} else if (aState == "4") {$(13_10)		sprite_index = sprRogueAttack;$(13_10)	}$(13_10)	$(13_10)	if (image_index >= image_number - image_speed) {$(13_10)		image_index = image_number - image_speed;$(13_10)	}$(13_10)} else if (!grounded) {$(13_10)	if (dy >= 0) {$(13_10)		sprite_index = sprRogueGoingUp;$(13_10)	} else {$(13_10)		sprite_index = sprRogueGoingDown;$(13_10)	}$(13_10)} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {$(13_10)	sprite_index = sprRogueMove;$(13_10)} else {$(13_10)	sprite_index = sprRogueNone;$(13_10)}$(13_10)$(13_10)if (hp <= 0) {$(13_10)	sprite_index = sprMine;$(13_10)}"
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
		sprite_index = sprRogueAttack;
	} else if (aState == "2") {
		if (aPhase == "d" && timeInAPhase == 0) {
			image_index = 0;
		}
		
		if (aPhase == "u") {
			sprite_index = sprRogueNoneDuck;
		} else {
			sprite_index = sprRogueDash;
		}
	} else if (aState == "4") {
		sprite_index = sprRogueAttack;
	}
	
	if (image_index >= image_number - image_speed) {
		image_index = image_number - image_speed;
	}
} else if (!grounded) {
	if (dy >= 0) {
		sprite_index = sprRogueGoingUp;
	} else {
		sprite_index = sprRogueGoingDown;
	}
} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {
	sprite_index = sprRogueMove;
} else {
	sprite_index = sprRogueNone;
}

if (hp <= 0) {
	sprite_index = sprMine;
}