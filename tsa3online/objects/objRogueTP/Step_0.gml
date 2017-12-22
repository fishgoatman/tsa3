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
/// @DnDArgument : "code" "///@desc abilities$(13_10)//ability input$(13_10)for (var i = 0; i < numAbilities; i++) {$(13_10)	if (cooldownTimer[i] > 0) {$(13_10)		cooldownTimer[i]--;$(13_10)		continue;$(13_10)	}$(13_10)	$(13_10)	var index = i + 4;$(13_10)	$(13_10)	if (durationHeld[index] > 0 && !heldBefore[index]) {$(13_10)		if (aState != abilityKey[i] && aPhase == "n") {$(13_10)			if (aPhase == "w") {$(13_10)				cooldownTimer[i] = cooldown[i];$(13_10)			}$(13_10)			$(13_10)			if (i == 1) {$(13_10)				var checkId = instance_create(preciseX, preciseY, objBounceCheckHitbox);$(13_10)				activate = false;$(13_10)		$(13_10)				with (checkId) {$(13_10)					if (place_meeting(x, y, objBlock)) {$(13_10)						other.activate = true;$(13_10)					}$(13_10)			$(13_10)					instance_destroy();$(13_10)				}$(13_10)			}$(13_10)			$(13_10)			if (i != 1 || activate) {$(13_10)				aState = abilityKey[i];$(13_10)				aPhase = "u";$(13_10)				timeInAPhase = 0;$(13_10)			}$(13_10)		}$(13_10)	} else if (aState == abilityKey[i]) {$(13_10)		if (aPhase != "n") {$(13_10)			timeInAPhase++;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "u" && timeInAPhase >= windUp[i]) {$(13_10)			aPhase = "d";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "d" && timeInAPhase >= duration[i]) {$(13_10)			aPhase = "w";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "w" && timeInAPhase >= windDown[i]) {$(13_10)			aPhase = "n";$(13_10)			timeInAPhase = 0;$(13_10)			aState = "n";$(13_10)			cooldownTimer[i] = cooldown[i];$(13_10)		}$(13_10)	}$(13_10)}"
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
			
			if (i == 1) {
				var checkId = instance_create(preciseX, preciseY, objBounceCheckHitbox);
				activate = false;
		
				with (checkId) {
					if (place_meeting(x, y, objBlock)) {
						other.activate = true;
					}
			
					instance_destroy();
				}
			}
			
			if (i != 1 || activate) {
				aState = abilityKey[i];
				aPhase = "u";
				timeInAPhase = 0;
			}
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
/// @DnDArgument : "code" "///@desc ability function$(13_10)//show_debug_message(string(aState) + " " + string(aPhase));$(13_10)if (aState == "1") {$(13_10)	if (aPhase == "d" && timeInAPhase == 0) {$(13_10)		for (var i = 0; i < fanNumKnives; i++) {$(13_10)			fanCurrAngle = 90 - 90 * image_xscale - fanAngle / fanNumKnives * i * image_xscale;$(13_10)			instance_create_depth(preciseX, preciseY, thisNumber, objKnife);$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	scrResetAir();$(13_10)} else if (aState == "2") {$(13_10)	if (aPhase == "u") {$(13_10)		lobChargeTime = 0;$(13_10)		numLobs = 0;$(13_10)	}$(13_10)	$(13_10)	if (aPhase == "d" && timeInAPhase == 0) {$(13_10)		var checkId = instance_create(preciseX, preciseY, objBounceCheckHitbox);$(13_10)		bounce = false;$(13_10)		$(13_10)		with (checkId) {$(13_10)			if (place_meeting(x, y, objBlock)) {$(13_10)				other.bounce = true;$(13_10)			}$(13_10)			$(13_10)			instance_destroy();$(13_10)		}$(13_10)		$(13_10)		if (bounce) {$(13_10)			scrResetAir();$(13_10)			jumpMoveMod = instance_create(0, 0, objMoveMod);$(13_10)			jumpMoveMod.dy = jumpPower * bounceJumpMultiplier / slowDuring[1];$(13_10)			jumpMoveMod.forever = true;$(13_10)			ds_list_add(moveModList, jumpMoveMod);$(13_10)		}$(13_10)	}$(13_10)} else if (aState == "3") {$(13_10)	if (aPhase == "d" && timeInAPhase == 0) {$(13_10)		for (var i = 0; i < fanNumKnives; i++) {$(13_10)			fanCurrAngle = 270 - jumpKnifeAngle / 2 + jumpKnifeAngle / jumpNumKnives * i;$(13_10)			instance_create_depth(preciseX, preciseY, thisNumber, objKnife);$(13_10)		}$(13_10)		$(13_10)		scrResetAir();$(13_10)		jumpMoveMod = instance_create(0, 0, objMoveMod);$(13_10)		jumpMoveMod.dy = jumpPower;$(13_10)		jumpMoveMod.forever = true;$(13_10)		ds_list_add(moveModList, jumpMoveMod);$(13_10)	}$(13_10)} else if (aState == "4") {$(13_10)	if (aPhase == "d" && timeInAPhase == 0) {$(13_10)		instance_create_depth(preciseX, preciseY, thisNumber, objPiercingKnife);$(13_10)	}$(13_10)	$(13_10)	scrResetAir();$(13_10)}"
///@desc ability function
//show_debug_message(string(aState) + " " + string(aPhase));
if (aState == "1") {
	if (aPhase == "d" && timeInAPhase == 0) {
		for (var i = 0; i < fanNumKnives; i++) {
			fanCurrAngle = 90 - 90 * image_xscale - fanAngle / fanNumKnives * i * image_xscale;
			instance_create_depth(preciseX, preciseY, thisNumber, objKnife);
		}
	}
	
	scrResetAir();
} else if (aState == "2") {
	if (aPhase == "u") {
		lobChargeTime = 0;
		numLobs = 0;
	}
	
	if (aPhase == "d" && timeInAPhase == 0) {
		var checkId = instance_create(preciseX, preciseY, objBounceCheckHitbox);
		bounce = false;
		
		with (checkId) {
			if (place_meeting(x, y, objBlock)) {
				other.bounce = true;
			}
			
			instance_destroy();
		}
		
		if (bounce) {
			scrResetAir();
			jumpMoveMod = instance_create(0, 0, objMoveMod);
			jumpMoveMod.dy = jumpPower * bounceJumpMultiplier / slowDuring[1];
			jumpMoveMod.forever = true;
			ds_list_add(moveModList, jumpMoveMod);
		}
	}
} else if (aState == "3") {
	if (aPhase == "d" && timeInAPhase == 0) {
		for (var i = 0; i < fanNumKnives; i++) {
			fanCurrAngle = 270 - jumpKnifeAngle / 2 + jumpKnifeAngle / jumpNumKnives * i;
			instance_create_depth(preciseX, preciseY, thisNumber, objKnife);
		}
		
		scrResetAir();
		jumpMoveMod = instance_create(0, 0, objMoveMod);
		jumpMoveMod.dy = jumpPower;
		jumpMoveMod.forever = true;
		ds_list_add(moveModList, jumpMoveMod);
	}
} else if (aState == "4") {
	if (aPhase == "d" && timeInAPhase == 0) {
		instance_create_depth(preciseX, preciseY, thisNumber, objPiercingKnife);
	}
	
	scrResetAir();
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 78F94C44
/// @DnDArgument : "code" "///@desc sprite and image$(13_10)if (durationHeld[RIGHT] > 0) {$(13_10)	image_xscale = 1;$(13_10)} else if (durationHeld[LEFT] > 0) {$(13_10)	image_xscale = -1;$(13_10)}$(13_10)$(13_10)/*if (aPhase != "n") {$(13_10)	if (aState == "4") {$(13_10)		if (aPhase == "u") {$(13_10)			sprite_index = sprMagePreBlast;$(13_10)			$(13_10)			if (timeInAPhase == 0) {$(13_10)				image_index = 0;$(13_10)			}$(13_10)		} else if (aPhase == "d") {$(13_10)			sprite_index = sprMagePostBlast;$(13_10)			$(13_10)			if (timeInAPhase == 0) {$(13_10)				image_index = 0;$(13_10)			}$(13_10)		}$(13_10)	}$(13_10)} else if (!grounded) {$(13_10)	if (dy >= 0) {$(13_10)		sprite_index = sprMageGoingUp;$(13_10)	} else {$(13_10)		sprite_index = sprMageGoingDown;$(13_10)	}$(13_10)} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {$(13_10)	sprite_index = sprMageMove;$(13_10)} else {$(13_10)	sprite_index = sprMageNone;$(13_10)}*/"
///@desc sprite and image
if (durationHeld[RIGHT] > 0) {
	image_xscale = 1;
} else if (durationHeld[LEFT] > 0) {
	image_xscale = -1;
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