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
/// @DnDArgument : "code" "///@desc abilities$(13_10)//ability input$(13_10)for (var i = 0; i < numAbilities; i++) {$(13_10)	if (cooldownTimer[i] > 0) {$(13_10)		cooldownTimer[i]--;$(13_10)		continue;$(13_10)	}$(13_10)	$(13_10)	var index = i + 4;$(13_10)	$(13_10)	if (durationHeld[index] > 0 && !heldBefore[index]) {$(13_10)		if (aState != abilityKey[i] && aPhase == "n") {$(13_10)			if (aPhase == "w") {$(13_10)				cooldownTimer[i] = cooldown[i];$(13_10)			}$(13_10)			$(13_10)			aState = abilityKey[i];$(13_10)			aPhase = "u";$(13_10)			timeInAPhase = 0;$(13_10)			abilityImageXScale = image_xscale;$(13_10)			$(13_10)			//online stuff$(13_10)			clientAState = aState;$(13_10)			timeToActivate = current_time + windUp[i];$(13_10)		}$(13_10)	} else if (aState == abilityKey[i]) {$(13_10)		if (aPhase != "n") {$(13_10)			timeInAPhase++;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "u" && timeInAPhase >= windUp[i]) {$(13_10)			aPhase = "d";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "d" && timeInAPhase >= duration[i]) {$(13_10)			aPhase = "w";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "w" && timeInAPhase >= windDown[i]) {$(13_10)			aPhase = "n";$(13_10)			timeInAPhase = 0;$(13_10)			aState = "n";$(13_10)			cooldownTimer[i] = cooldown[i];$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	if (aState != abilityKey[i]) {$(13_10)		firstTime[i] = true;$(13_10)	}$(13_10)}"
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
			
			//online stuff
			clientAState = aState;
			timeToActivate = current_time + windUp[i];
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
/// @DnDArgument : "code" "///@desc ability function$(13_10)//show_debug_message(string(aState) + " " + string(aPhase));$(13_10)if (aState == "1") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[0]) {$(13_10)			instance_create_depth(preciseX, preciseY, thisNumber, objFireSlashHitbox);$(13_10)			timeSinceSlashBlast = 0;$(13_10)			$(13_10)			for (var i = 0; i < slashBlastAmount; i++) {$(13_10)				blastAngle = 90 - image_xscale * 90 + slashBlastCentralAngle * image_xscale + slashBlastSpread * i / (slashBlastAmount - 1) - slashBlastSpread / 2;$(13_10)				instance_create_depth(preciseX + slashBlastAheadDist * dcos(blastAngle), preciseY - slashBlastAheadDist * dsin(blastAngle), thisNumber, objFireShot);$(13_10)			}$(13_10)			$(13_10)			firstTime[0] = false;$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	scrResetAir();$(13_10)} else if (aState == "2") {$(13_10)	if (aPhase == "u") {$(13_10)		lobChargeTime = 0;$(13_10)		numLobs = 0;$(13_10)	}$(13_10)	$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[1]) {$(13_10)			for (var i = 0; i < maxLobs; i++) {$(13_10)				var angleDir = i % 2 == 0 ? -1 : 1;$(13_10)				var angle = lobBaseAngle + angleDir * lobAngleBetween * floor((i + 1) / 2);$(13_10)				diffX = lobDist * dcos(angle);$(13_10)				diffY = lobDist * dsin(angle);$(13_10)				instance_create_depth(preciseX + diffX * image_xscale, preciseY - diffY, thisNumber, objFireLob);$(13_10)			}$(13_10)			$(13_10)			firstTime[1] = false;$(13_10)		}$(13_10)		/*if (numLobs == 0) {$(13_10)			var angle = lobBaseAngle;$(13_10)			diffX = lobDist * dcos(angle);$(13_10)			diffY = lobDist * dsin(angle);$(13_10)			instance_create_depth(preciseX + diffX * image_xscale, preciseY - diffY, thisNumber, objFireLobCharge);$(13_10)			numLobs++;$(13_10)		}$(13_10)		$(13_10)		if (lobChargeTime / timePerLobCharge > numLobs && numLobs < maxLobs) {$(13_10)			var angleDir = numLobs % 2 == 0 ? -1 : 1;$(13_10)			var angle = lobBaseAngle + angleDir * lobAngleBetween * floor((numLobs + 1) / 2);$(13_10)			diffX = lobDist * dcos(angle);$(13_10)			diffY = lobDist * dsin(angle);$(13_10)			instance_create_depth(preciseX + diffX * image_xscale, preciseY - diffY, thisNumber, objFireLobCharge);$(13_10)			numLobs++;$(13_10)		}$(13_10)		$(13_10)		lobChargeTime++;*/$(13_10)	}$(13_10)} else if (aState == "3") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[2]) {$(13_10)			var moveMod = instance_create(0, 0, objMoveMod);$(13_10)			moveMod.dy = rocketSpd;$(13_10)			moveMod.ddy = -rocketDec;$(13_10)			moveMod.duration = duration[2];$(13_10)			ds_list_add(envMoveModList, moveMod);$(13_10)			audio_play_sound(sndRocket, 1, false);$(13_10)		}$(13_10)		$(13_10)		scrResetAir();$(13_10)		$(13_10)		for (var i = 0; i < 12; i++) {$(13_10)			instance_create(preciseX + random_range(-particleOffset, particleOffset), preciseY - random_range(-particleOffset, 0), objFireScrap);$(13_10)		}$(13_10)		$(13_10)		firstTime[2] = false;$(13_10)	} else if (aPhase == "w") {$(13_10)		if (timeInAPhase >= windDown[2] - 1) {$(13_10)			gravMoveMod.dy = dy;$(13_10)		}$(13_10)	}$(13_10)} else if (aState == "4") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[3]) {$(13_10)			timeSinceBlast = 0;$(13_10)			$(13_10)			for (var i = 0; i < blastAmount; i++) {$(13_10)				blastAngle = 90 - image_xscale * 90 + blastSpread * i / (blastAmount - 1) - blastSpread / 2;$(13_10)				instance_create_depth(preciseX, preciseY, thisNumber, objFireShot);$(13_10)			}$(13_10)			$(13_10)			var moveMod = instance_create(0, 0, objMoveMod);$(13_10)			moveMod.dx = blastRecoilSpd * image_xscale;$(13_10)			moveMod.ddx = blastRecoilDSpd * image_xscale;$(13_10)			moveMod.duration = blastRecoilDuration;$(13_10)			ds_list_add(envMoveModList, moveMod);$(13_10)			firstTime[3] = false;$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	timeSinceBlast++;$(13_10)	scrResetAir();$(13_10)}"
///@desc ability function
//show_debug_message(string(aState) + " " + string(aPhase));
if (aState == "1") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[0]) {
			instance_create_depth(preciseX, preciseY, thisNumber, objFireSlashHitbox);
			timeSinceSlashBlast = 0;
			
			for (var i = 0; i < slashBlastAmount; i++) {
				blastAngle = 90 - image_xscale * 90 + slashBlastCentralAngle * image_xscale + slashBlastSpread * i / (slashBlastAmount - 1) - slashBlastSpread / 2;
				instance_create_depth(preciseX + slashBlastAheadDist * dcos(blastAngle), preciseY - slashBlastAheadDist * dsin(blastAngle), thisNumber, objFireShot);
			}
			
			firstTime[0] = false;
		}
	}
	
	scrResetAir();
} else if (aState == "2") {
	if (aPhase == "u") {
		lobChargeTime = 0;
		numLobs = 0;
	}
	
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[1]) {
			for (var i = 0; i < maxLobs; i++) {
				var angleDir = i % 2 == 0 ? -1 : 1;
				var angle = lobBaseAngle + angleDir * lobAngleBetween * floor((i + 1) / 2);
				diffX = lobDist * dcos(angle);
				diffY = lobDist * dsin(angle);
				instance_create_depth(preciseX + diffX * image_xscale, preciseY - diffY, thisNumber, objFireLob);
			}
			
			firstTime[1] = false;
		}
		/*if (numLobs == 0) {
			var angle = lobBaseAngle;
			diffX = lobDist * dcos(angle);
			diffY = lobDist * dsin(angle);
			instance_create_depth(preciseX + diffX * image_xscale, preciseY - diffY, thisNumber, objFireLobCharge);
			numLobs++;
		}
		
		if (lobChargeTime / timePerLobCharge > numLobs && numLobs < maxLobs) {
			var angleDir = numLobs % 2 == 0 ? -1 : 1;
			var angle = lobBaseAngle + angleDir * lobAngleBetween * floor((numLobs + 1) / 2);
			diffX = lobDist * dcos(angle);
			diffY = lobDist * dsin(angle);
			instance_create_depth(preciseX + diffX * image_xscale, preciseY - diffY, thisNumber, objFireLobCharge);
			numLobs++;
		}
		
		lobChargeTime++;*/
	}
} else if (aState == "3") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[2]) {
			var moveMod = instance_create(0, 0, objMoveMod);
			moveMod.dy = rocketSpd;
			moveMod.ddy = -rocketDec;
			moveMod.duration = duration[2];
			ds_list_add(envMoveModList, moveMod);
			audio_play_sound(sndRocket, 1, false);
		}
		
		scrResetAir();
		
		for (var i = 0; i < 12; i++) {
			instance_create(preciseX + random_range(-particleOffset, particleOffset), preciseY - random_range(-particleOffset, 0), objFireScrap);
		}
		
		firstTime[2] = false;
	} else if (aPhase == "w") {
		if (timeInAPhase >= windDown[2] - 1) {
			gravMoveMod.dy = dy;
		}
	}
} else if (aState == "4") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[3]) {
			timeSinceBlast = 0;
			
			for (var i = 0; i < blastAmount; i++) {
				blastAngle = 90 - image_xscale * 90 + blastSpread * i / (blastAmount - 1) - blastSpread / 2;
				instance_create_depth(preciseX, preciseY, thisNumber, objFireShot);
			}
			
			var moveMod = instance_create(0, 0, objMoveMod);
			moveMod.dx = blastRecoilSpd * image_xscale;
			moveMod.ddx = blastRecoilDSpd * image_xscale;
			moveMod.duration = blastRecoilDuration;
			ds_list_add(envMoveModList, moveMod);
			firstTime[3] = false;
		}
	}
	
	timeSinceBlast++;
	scrResetAir();
}/**/

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 78F94C44
/// @DnDArgument : "code" "///@desc sprite and image$(13_10)if (aState == "n") {$(13_10)	if (durationHeld[RIGHT] > 0) {$(13_10)		image_xscale = 1;$(13_10)	} else if (durationHeld[LEFT] > 0) {$(13_10)		image_xscale = -1;$(13_10)	}$(13_10)} else {$(13_10)	image_xscale = abilityImageXScale;$(13_10)}$(13_10)$(13_10)if (aPhase != "n") {$(13_10)	if (aPhase == "u" && timeInAPhase == 0) {$(13_10)		image_index = 0;$(13_10)	}$(13_10)	$(13_10)	if (aState == "1") {$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprMageSlash2$(13_10)		} else {$(13_10)			sprite_index = sprMageSlash$(13_10)		}$(13_10)	} else if (aState == "2") {$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprMageLob2$(13_10)		} else {$(13_10)			sprite_index = sprMageLob$(13_10)		}$(13_10)	} else if (aState == "3") {$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprMageRocket2$(13_10)		} else {$(13_10)			sprite_index = sprMageRocket$(13_10)		}$(13_10)	} else if (aState == "4") {$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprMageBlast2$(13_10)		} else {$(13_10)			sprite_index = sprMageBlast$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	if (image_index >= image_number - image_speed) {$(13_10)		image_index = image_number - image_speed;$(13_10)	}$(13_10)} else if (!grounded) {$(13_10)	if (dy >= 0) {$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprMageGoingUp2$(13_10)		} else {$(13_10)			sprite_index = sprMageGoingUp$(13_10)		}$(13_10)	} else {$(13_10)		if (sprite2) {$(13_10)			sprite_index = sprMageGoingDown2$(13_10)		} else {$(13_10)			sprite_index = sprMageGoingDown$(13_10)		}$(13_10)	}$(13_10)} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {$(13_10)	if (sprite2) {$(13_10)		sprite_index = sprMageMove2$(13_10)	} else {$(13_10)		sprite_index = sprMageMove$(13_10)	}$(13_10)} else {$(13_10)	if (sprite2) {$(13_10)		sprite_index = sprMageNone2$(13_10)	} else {$(13_10)		sprite_index = sprMageNone$(13_10)	}$(13_10)}$(13_10)$(13_10)if (hp <= 0) {$(13_10)	sprite_index = sprMine;$(13_10)}"
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
			sprite_index = sprMageSlash2
		} else {
			sprite_index = sprMageSlash
		}
	} else if (aState == "2") {
		if (sprite2) {
			sprite_index = sprMageLob2
		} else {
			sprite_index = sprMageLob
		}
	} else if (aState == "3") {
		if (sprite2) {
			sprite_index = sprMageRocket2
		} else {
			sprite_index = sprMageRocket
		}
	} else if (aState == "4") {
		if (sprite2) {
			sprite_index = sprMageBlast2
		} else {
			sprite_index = sprMageBlast
		}
	}
	
	if (image_index >= image_number - image_speed) {
		image_index = image_number - image_speed;
	}
} else if (!grounded) {
	if (dy >= 0) {
		if (sprite2) {
			sprite_index = sprMageGoingUp2
		} else {
			sprite_index = sprMageGoingUp
		}
	} else {
		if (sprite2) {
			sprite_index = sprMageGoingDown2
		} else {
			sprite_index = sprMageGoingDown
		}
	}
} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {
	if (sprite2) {
		sprite_index = sprMageMove2
	} else {
		sprite_index = sprMageMove
	}
} else {
	if (sprite2) {
		sprite_index = sprMageNone2
	} else {
		sprite_index = sprMageNone
	}
}

if (hp <= 0) {
	sprite_index = sprMine;
}