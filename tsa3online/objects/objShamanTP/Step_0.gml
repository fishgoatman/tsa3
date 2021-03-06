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
/// @DnDArgument : "code" "///@desc abilities$(13_10)//ability input$(13_10)//totem charge$(13_10)if (aState != "4" && currCharges < maxCharges && chargeTimer == 0) {$(13_10)	chargeTimer = cooldown[3];$(13_10)}$(13_10)$(13_10)if (chargeTimer > 0) {$(13_10)	chargeTimer--;$(13_10)	$(13_10)	if (chargeTimer == 0) {$(13_10)		currCharges++;$(13_10)	}$(13_10)}$(13_10)$(13_10)for (var i = 0; i < numAbilities; i++) {$(13_10)	if (cooldownTimer[i] > 0) {$(13_10)		cooldownTimer[i]--;$(13_10)		continue;$(13_10)	}$(13_10)	$(13_10)	var index = i + 4;$(13_10)	$(13_10)	if (durationHeld[index] > 0 && !heldBefore[index]) {$(13_10)		if (aState != abilityKey[i] && aPhase == "n") {$(13_10)			/*if (aPhase == "w") {$(13_10)				cooldownTimer[i] = cooldown[i];$(13_10)			}*/$(13_10)			$(13_10)			aState = abilityKey[i];$(13_10)			aPhase = "u";$(13_10)			timeInAPhase = 0;$(13_10)			abilityImageXScale = image_xscale;$(13_10)		}$(13_10)	} else if (aState == abilityKey[i]) {$(13_10)		if (aPhase != "n") {$(13_10)			timeInAPhase++;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "u" && timeInAPhase >= windUp[i]) {$(13_10)			aPhase = "d";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "d" && timeInAPhase >= duration[i]) {$(13_10)			aPhase = "w";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "w" && timeInAPhase >= windDown[i]) {$(13_10)			aPhase = "n";$(13_10)			timeInAPhase = 0;$(13_10)			$(13_10)			if (aState == "4") {$(13_10)				currCharges--;$(13_10)			}$(13_10)			$(13_10)			if (aState != "4" || currCharges == 0) {$(13_10)				cooldownTimer[i] = cooldown[i];$(13_10)			}$(13_10)			$(13_10)			aState = "n";$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	if (aState != abilityKey[i]) {$(13_10)		firstTime[i] = true;$(13_10)	}$(13_10)}"
///@desc abilities
//ability input
//totem charge
if (aState != "4" && currCharges < maxCharges && chargeTimer == 0) {
	chargeTimer = cooldown[3];
}

if (chargeTimer > 0) {
	chargeTimer--;
	
	if (chargeTimer == 0) {
		currCharges++;
	}
}

for (var i = 0; i < numAbilities; i++) {
	if (cooldownTimer[i] > 0) {
		cooldownTimer[i]--;
		continue;
	}
	
	var index = i + 4;
	
	if (durationHeld[index] > 0 && !heldBefore[index]) {
		if (aState != abilityKey[i] && aPhase == "n") {
			/*if (aPhase == "w") {
				cooldownTimer[i] = cooldown[i];
			}*/
			
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
			
			if (aState == "4") {
				currCharges--;
			}
			
			if (aState != "4" || currCharges == 0) {
				cooldownTimer[i] = cooldown[i];
			}
			
			aState = "n";
		}
	}
	
	if (aState != abilityKey[i]) {
		firstTime[i] = true;
	}
}/**/

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3771CA6E
/// @DnDArgument : "code" "///@desc ability function$(13_10)//show_debug_message(string(aState) + " " + string(aPhase));$(13_10)if (aState == "1") {$(13_10)	if (aPhase == "d") {$(13_10)		for (var i = 0; i < lavaAmountPerTick; i++) {$(13_10)			//instance_create_depth(x + xVar, y + yVar, thisNumber, objLava);$(13_10)			$(13_10)			for (var j = 0; j < ds_list_size(totemIdList); j++) {$(13_10)				var totemId = ds_list_find_value(totemIdList, j);$(13_10)				lavaDx = lavaBaseDx + random_range(-lavaDxVar, lavaDxVar);$(13_10)				lavaDy = lavaBaseDy + random_range(-lavaDyVar, lavaDyVar);$(13_10)				var xVar = image_xscale * random_range(lavaXOff, lavaXOff + lavaXVar);$(13_10)				var yVar = random_range(-lavaYVar, lavaYVar);$(13_10)				$(13_10)				if (instance_exists(totemId)) {$(13_10)					instance_create_depth(totemId.x + xVar, totemId.y + yVar, thisNumber, objLava);$(13_10)				} else {$(13_10)					ds_list_delete(totemIdList, j);$(13_10)				}$(13_10)			}$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	scrResetAir();$(13_10)} else if (aState == "2") {$(13_10)	if (aPhase == "u") {$(13_10)		numLightnings = 0;$(13_10)		timeLastLightning = -lightningInBetweenTime;$(13_10)	}$(13_10)	$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase - timeLastLightning >= lightningInBetweenTime) {$(13_10)			timeLastLightning = timeInAPhase;$(13_10)$(13_10)			for (var i = 0; i < ds_list_size(totemIdList); i++) {$(13_10)				var currId = ds_list_find_value(totemIdList, i);$(13_10)					$(13_10)				if (instance_exists(currId)) {$(13_10)					var xVar = image_xscale * lightningOffset * numLightnings;$(13_10)					var xPos = currId.x + xVar;$(13_10)					var yPos = preciseY;$(13_10)					var pixel = instance_create(xPos, yPos, objPixel);$(13_10)					lightningColliding = false;$(13_10)				$(13_10)					do {$(13_10)						yPos++;$(13_10)						pixel.y = yPos;$(13_10)					$(13_10)						with (pixel) {$(13_10)							if (place_meeting(x, y, objBlock)) {$(13_10)								other.lightningColliding = true;$(13_10)							} else {$(13_10)								other.lightningColliding = false;$(13_10)							}$(13_10)						}$(13_10)					} until (yPos > room_height || (yPos > 12 && lightningColliding));$(13_10)						$(13_10)					instance_create_depth(xPos, yPos - room_height / 2, thisNumber, objLightningHitbox);$(13_10)				} else {$(13_10)					ds_list_delete(totemIdList, i);$(13_10)				}$(13_10)			}$(13_10)			$(13_10)			numLightnings++;$(13_10)		}$(13_10)	}$(13_10)			$(13_10)	scrResetAir();$(13_10)} else if (aState == "3") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[2]) {$(13_10)			jetAngle = jetStartAngle;$(13_10)			jetId = instance_create_depth(preciseX, preciseY, thisNumber, objWaterJet);$(13_10)			$(13_10)			for (var i = 0; i < ds_list_size(totemIdList); i++) {$(13_10)				var totemId = ds_list_find_value(totemIdList, i);$(13_10)				$(13_10)				if (instance_exists(totemId) && totemId != id) {$(13_10)					instance_create_depth(totemId.x, totemId.y, thisNumber, objWaterBlast);$(13_10)				}$(13_10)			}$(13_10)			$(13_10)			firstTime[2] = false;$(13_10)		}$(13_10)		$(13_10)		if (durationHeld[RIGHT] > 0) {$(13_10)			jetAngle -= jetDAngle;$(13_10)		}$(13_10)		$(13_10)		if (durationHeld[LEFT] > 0) {$(13_10)			jetAngle += jetDAngle;$(13_10)		}$(13_10)		$(13_10)		if (durationHeld[UP] > 0) {$(13_10)			jetCurrSpd = jetSpd;$(13_10)		} else if (durationHeld[DOWN] > 0) {$(13_10)			jetCurrSpd = -jetSpd;$(13_10)		} else {$(13_10)			jetCurrSpd = 0;$(13_10)		}$(13_10)		$(13_10)		if ((timeInAPhase >= duration[2] - 1 || durationHeld[THREE] > 0 && !heldBefore[THREE]) && instance_exists(jetId)) {$(13_10)			image_angle = 0;$(13_10)			var moveMod = instance_create(0, 0, objMoveMod);$(13_10)			moveMod.dx = jetId.dx;$(13_10)			moveMod.dy = jetId.dy;$(13_10)			moveMod.ddx = -jetId.dx * jetMultiplier;$(13_10)			moveMod.ddy = -jetId.dy * jetMultiplier;$(13_10)			moveMod.duration = 1 / jetMultiplier;$(13_10)			ds_list_add(envMoveModList, moveMod);$(13_10)			$(13_10)			with (jetId) {$(13_10)				instance_destroy();$(13_10)			}$(13_10)			$(13_10)			timeInAPhase = duration[2] - 1;$(13_10)		}$(13_10)		$(13_10)		scrResetAir();$(13_10)	}$(13_10)} else if (aState == "4") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase >= 0 && firstTime[3]) {$(13_10)			var totemId = instance_create_depth(preciseX, preciseY, thisNumber, objTotem);$(13_10)			ds_list_add(totemIdList, totemId);$(13_10)			firstTime[3] = false;$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	scrResetAir();$(13_10)}"
///@desc ability function
//show_debug_message(string(aState) + " " + string(aPhase));
if (aState == "1") {
	if (aPhase == "d") {
		for (var i = 0; i < lavaAmountPerTick; i++) {
			//instance_create_depth(x + xVar, y + yVar, thisNumber, objLava);
			
			for (var j = 0; j < ds_list_size(totemIdList); j++) {
				var totemId = ds_list_find_value(totemIdList, j);
				lavaDx = lavaBaseDx + random_range(-lavaDxVar, lavaDxVar);
				lavaDy = lavaBaseDy + random_range(-lavaDyVar, lavaDyVar);
				var xVar = image_xscale * random_range(lavaXOff, lavaXOff + lavaXVar);
				var yVar = random_range(-lavaYVar, lavaYVar);
				
				if (instance_exists(totemId)) {
					instance_create_depth(totemId.x + xVar, totemId.y + yVar, thisNumber, objLava);
				} else {
					ds_list_delete(totemIdList, j);
				}
			}
		}
	}
	
	scrResetAir();
} else if (aState == "2") {
	if (aPhase == "u") {
		numLightnings = 0;
		timeLastLightning = -lightningInBetweenTime;
	}
	
	if (aPhase == "d") {
		if (timeInAPhase - timeLastLightning >= lightningInBetweenTime) {
			timeLastLightning = timeInAPhase;

			for (var i = 0; i < ds_list_size(totemIdList); i++) {
				var currId = ds_list_find_value(totemIdList, i);
					
				if (instance_exists(currId)) {
					var xVar = image_xscale * lightningOffset * numLightnings;
					var xPos = currId.x + xVar;
					var yPos = preciseY;
					var pixel = instance_create(xPos, yPos, objPixel);
					lightningColliding = false;
				
					do {
						yPos++;
						pixel.y = yPos;
					
						with (pixel) {
							if (place_meeting(x, y, objBlock)) {
								other.lightningColliding = true;
							} else {
								other.lightningColliding = false;
							}
						}
					} until (yPos > room_height || (yPos > 12 && lightningColliding));
						
					instance_create_depth(xPos, yPos - room_height / 2, thisNumber, objLightningHitbox);
				} else {
					ds_list_delete(totemIdList, i);
				}
			}
			
			numLightnings++;
		}
	}
			
	scrResetAir();
} else if (aState == "3") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[2]) {
			jetAngle = jetStartAngle;
			jetId = instance_create_depth(preciseX, preciseY, thisNumber, objWaterJet);
			
			for (var i = 0; i < ds_list_size(totemIdList); i++) {
				var totemId = ds_list_find_value(totemIdList, i);
				
				if (instance_exists(totemId) && totemId != id) {
					instance_create_depth(totemId.x, totemId.y, thisNumber, objWaterBlast);
				}
			}
			
			firstTime[2] = false;
		}
		
		if (durationHeld[RIGHT] > 0) {
			jetAngle -= jetDAngle;
		}
		
		if (durationHeld[LEFT] > 0) {
			jetAngle += jetDAngle;
		}
		
		if (durationHeld[UP] > 0) {
			jetCurrSpd = jetSpd;
		} else if (durationHeld[DOWN] > 0) {
			jetCurrSpd = -jetSpd;
		} else {
			jetCurrSpd = 0;
		}
		
		if ((timeInAPhase >= duration[2] - 1 || durationHeld[THREE] > 0 && !heldBefore[THREE]) && instance_exists(jetId)) {
			image_angle = 0;
			var moveMod = instance_create(0, 0, objMoveMod);
			moveMod.dx = jetId.dx;
			moveMod.dy = jetId.dy;
			moveMod.ddx = -jetId.dx * jetMultiplier;
			moveMod.ddy = -jetId.dy * jetMultiplier;
			moveMod.duration = 1 / jetMultiplier;
			ds_list_add(envMoveModList, moveMod);
			
			with (jetId) {
				instance_destroy();
			}
			
			timeInAPhase = duration[2] - 1;
		}
		
		scrResetAir();
	}
} else if (aState == "4") {
	if (aPhase == "d") {
		if (timeInAPhase >= 0 && firstTime[3]) {
			var totemId = instance_create_depth(preciseX, preciseY, thisNumber, objTotem);
			ds_list_add(totemIdList, totemId);
			firstTime[3] = false;
		}
	}
	
	scrResetAir();
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 78F94C44
/// @DnDArgument : "code" "///@desc sprite and image$(13_10)if (aState == "n") {$(13_10)	if (durationHeld[RIGHT] > 0) {$(13_10)		image_xscale = 1;$(13_10)	} else if (durationHeld[LEFT] > 0) {$(13_10)		image_xscale = -1;$(13_10)	}$(13_10)} else {$(13_10)	image_xscale = abilityImageXScale;$(13_10)}$(13_10)$(13_10)if (aPhase != "n" && aState != "2") {$(13_10)	/*if (aPhase == "u" && timeInAPhase == 0) {$(13_10)		image_index = 0;$(13_10)	}$(13_10)	$(13_10)	if (aState == "1") {$(13_10)		sprite_index = sprMageSlash;$(13_10)	} else if (aState == "3") {$(13_10)		sprite_index = sprMageRocket;$(13_10)	} else if (aState == "4") {$(13_10)		sprite_index = sprMageBlast;$(13_10)	}$(13_10)	$(13_10)	if (image_index >= image_number - image_speed) {$(13_10)		image_index = image_number - image_speed;$(13_10)	}*/$(13_10)} else if (!grounded) {$(13_10)	if (dy >= 0) {$(13_10)		sprite_index = sprShamanGoingUp;$(13_10)	} else {$(13_10)		sprite_index = sprShamanGoingDown;$(13_10)	}$(13_10)} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {$(13_10)	sprite_index = sprShamanMove;$(13_10)} else {$(13_10)	sprite_index = sprShamanNone;$(13_10)}$(13_10)$(13_10)if (hp <= 0) {$(13_10)	sprite_index = sprMine;$(13_10)}"
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

if (aPhase != "n" && aState != "2") {
	/*if (aPhase == "u" && timeInAPhase == 0) {
		image_index = 0;
	}
	
	if (aState == "1") {
		sprite_index = sprMageSlash;
	} else if (aState == "3") {
		sprite_index = sprMageRocket;
	} else if (aState == "4") {
		sprite_index = sprMageBlast;
	}
	
	if (image_index >= image_number - image_speed) {
		image_index = image_number - image_speed;
	}*/
} else if (!grounded) {
	if (dy >= 0) {
		sprite_index = sprShamanGoingUp;
	} else {
		sprite_index = sprShamanGoingDown;
	}
} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {
	sprite_index = sprShamanMove;
} else {
	sprite_index = sprShamanNone;
}

if (hp <= 0) {
	sprite_index = sprMine;
}/**/