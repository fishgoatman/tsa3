/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3AB2A1AA
/// @DnDArgument : "code" "/// @desc damage$(13_10)//collision$(13_10)collisionList = scrInstancePlaceList(preciseX, preciseY, objHitbox);$(13_10)$(13_10)for (var i = 0; i < ds_list_size(collisionList); i++) {$(13_10)	var collidingId = ds_list_find_value(collisionList, i);$(13_10)	$(13_10)	if (collidingId != noone && collidingId.thisNumber != thisNumber) {$(13_10)		var dmgMod = instance_create(0, 0, objDmgMod);$(13_10)		dmgMod.dmg = collidingId.dmg;$(13_10)		dmgMod.dDmg = collidingId.dDmg;$(13_10)		dmgMod.duration = collidingId.duration;$(13_10)		dmgMod.forever = collidingId.forever;$(13_10)		ds_list_add(dmgModList, dmgMod);$(13_10)		$(13_10)		with (collidingId) {$(13_10)			instance_destroy();$(13_10)		}$(13_10)	}$(13_10)}$(13_10)$(13_10)//taking damage$(13_10)var hpLost = 0;$(13_10)$(13_10)for (var i = 0; i < ds_list_size(dmgModList); i++) {$(13_10)	var dmgMod = ds_list_find_value(dmgModList, i);$(13_10)	$(13_10)	if (dmgMod.duration <= 0) {$(13_10)		ds_list_delete(dmgModList, i);$(13_10)		$(13_10)		with (dmgMod) {$(13_10)			instance_destroy();$(13_10)		}$(13_10)	} else {$(13_10)		hpLost += dmgMod.dmg;$(13_10)	}$(13_10)}$(13_10)$(13_10)scrThisTakeDamage(hpLost);$(13_10)$(13_10)//die$(13_10)if (hp <= 0) {$(13_10)	instance_destroy();$(13_10)}"
/// @desc damage
//collision
collisionList = scrInstancePlaceList(preciseX, preciseY, objHitbox);

for (var i = 0; i < ds_list_size(collisionList); i++) {
	var collidingId = ds_list_find_value(collisionList, i);
	
	if (collidingId != noone && collidingId.thisNumber != thisNumber) {
		var dmgMod = instance_create(0, 0, objDmgMod);
		dmgMod.dmg = collidingId.dmg;
		dmgMod.dDmg = collidingId.dDmg;
		dmgMod.duration = collidingId.duration;
		dmgMod.forever = collidingId.forever;
		ds_list_add(dmgModList, dmgMod);
		
		with (collidingId) {
			instance_destroy();
		}
	}
}

//taking damage
var hpLost = 0;

for (var i = 0; i < ds_list_size(dmgModList); i++) {
	var dmgMod = ds_list_find_value(dmgModList, i);
	
	if (dmgMod.duration <= 0) {
		ds_list_delete(dmgModList, i);
		
		with (dmgMod) {
			instance_destroy();
		}
	} else {
		hpLost += dmgMod.dmg;
	}
}

scrThisTakeDamage(hpLost);

//die
if (hp <= 0) {
	instance_destroy();
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 74C028A6
/// @DnDArgument : "code" "///@desc get input$(13_10)var arrayToUse;$(13_10)$(13_10)if (thisNumber == 0) {$(13_10)	arrayToUse = leftKeyOrder;$(13_10)} else if (thisNumber == 1) {$(13_10)	arrayToUse = rightKeyOrder;$(13_10)}$(13_10)$(13_10)for (var i = 0; i < numKeys; i++) {$(13_10)	if (thisNumber == 0 || rightControlMode == "keyboard" || i >= 4) {$(13_10)		if (keyboard_check_direct(arrayToUse[i])) {$(13_10)			if (durationHeld[i] > 0) {$(13_10)				heldBefore[i] = true;$(13_10)			}$(13_10)		$(13_10)			durationHeld[i]++;$(13_10)		} else {$(13_10)			durationHeld[i] = 0;$(13_10)			heldBefore[i] = false;$(13_10)		}$(13_10)	} else {$(13_10)		if (i == 0) {$(13_10)			if (mouse_check_button(mb_right)) {$(13_10)				if (durationHeld[i] > 0) {$(13_10)					heldBefore[i] = true;$(13_10)				}$(13_10)		$(13_10)				durationHeld[i]++;$(13_10)			} else {$(13_10)				durationHeld[i] = 0;$(13_10)				heldBefore[i] = false;$(13_10)			}$(13_10)		}$(13_10)		$(13_10)		var offset = 5;$(13_10)		var mouseMiddle = maxMouseX + offset * -image_xscale;$(13_10)		$(13_10)		if (i == 1) {$(13_10)			if (mouse_check_button(mb_left) && mouse_x < mouseMiddle) {$(13_10)				if (durationHeld[i] > 0) {$(13_10)					heldBefore[i] = true;$(13_10)				}$(13_10)		$(13_10)				durationHeld[i]++;$(13_10)			} else {$(13_10)				durationHeld[i] = 0;$(13_10)				heldBefore[i] = false;$(13_10)			}$(13_10)		}$(13_10)		$(13_10)		if (i == 2) {$(13_10)			if (1 == 2) {$(13_10)				if (durationHeld[i] > 0) {$(13_10)					heldBefore[i] = true;$(13_10)				}$(13_10)		$(13_10)				durationHeld[i]++;$(13_10)			} else {$(13_10)				durationHeld[i] = 0;$(13_10)				heldBefore[i] = false;$(13_10)			}$(13_10)		}$(13_10)		$(13_10)		if (i == 3) {$(13_10)			if (mouse_check_button(mb_left) && mouse_x > mouseMiddle) {$(13_10)				if (durationHeld[i] > 0) {$(13_10)					heldBefore[i] = true;$(13_10)				}$(13_10)		$(13_10)				durationHeld[i]++;$(13_10)			} else {$(13_10)				durationHeld[i] = 0;$(13_10)				heldBefore[i] = false;$(13_10)			}$(13_10)		}$(13_10)		$(13_10)		if (abs(mouse_x) * image_xscale > maxMouseX * image_xscale) {$(13_10)			maxMouseX = mouse_x;$(13_10)		}$(13_10)	}$(13_10)}"
///@desc get input
var arrayToUse;

if (thisNumber == 0) {
	arrayToUse = leftKeyOrder;
} else if (thisNumber == 1) {
	arrayToUse = rightKeyOrder;
}

for (var i = 0; i < numKeys; i++) {
	if (thisNumber == 0 || rightControlMode == "keyboard" || i >= 4) {
		if (keyboard_check_direct(arrayToUse[i])) {
			if (durationHeld[i] > 0) {
				heldBefore[i] = true;
			}
		
			durationHeld[i]++;
		} else {
			durationHeld[i] = 0;
			heldBefore[i] = false;
		}
	} else {
		if (i == 0) {
			if (mouse_check_button(mb_right)) {
				if (durationHeld[i] > 0) {
					heldBefore[i] = true;
				}
		
				durationHeld[i]++;
			} else {
				durationHeld[i] = 0;
				heldBefore[i] = false;
			}
		}
		
		var offset = 5;
		var mouseMiddle = maxMouseX + offset * -image_xscale;
		
		if (i == 1) {
			if (mouse_check_button(mb_left) && mouse_x < mouseMiddle) {
				if (durationHeld[i] > 0) {
					heldBefore[i] = true;
				}
		
				durationHeld[i]++;
			} else {
				durationHeld[i] = 0;
				heldBefore[i] = false;
			}
		}
		
		if (i == 2) {
			if (1 == 2) {
				if (durationHeld[i] > 0) {
					heldBefore[i] = true;
				}
		
				durationHeld[i]++;
			} else {
				durationHeld[i] = 0;
				heldBefore[i] = false;
			}
		}
		
		if (i == 3) {
			if (mouse_check_button(mb_left) && mouse_x > mouseMiddle) {
				if (durationHeld[i] > 0) {
					heldBefore[i] = true;
				}
		
				durationHeld[i]++;
			} else {
				durationHeld[i] = 0;
				heldBefore[i] = false;
			}
		}
		
		if (abs(mouse_x) * image_xscale > maxMouseX * image_xscale) {
			maxMouseX = mouse_x;
		}
	}
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 58EEEB9A
/// @DnDArgument : "code" "///@desc movement$(13_10)//left right$(13_10)if (durationHeld[RIGHT] > 0) {$(13_10)	var moveMod = instance_create(0, 0, objMoveMod);$(13_10)	moveMod.dx = moveSpd;$(13_10)	ds_list_add(moveModList, moveMod);$(13_10)}$(13_10)$(13_10)if (durationHeld[LEFT] > 0) {$(13_10)	var moveMod = instance_create(0, 0, objMoveMod);$(13_10)	moveMod.dx = -moveSpd;$(13_10)	ds_list_add(moveModList, moveMod);$(13_10)}$(13_10)$(13_10)//gravity$(13_10)grounded = !place_meeting(preciseX, preciseY, objBlock) && place_meeting(preciseX, preciseY + 1, objBlock);$(13_10)ceilinged = !place_meeting(preciseX, preciseY, objBlock) && place_meeting(preciseX, preciseY - 1, objBlock);$(13_10)$(13_10)if (grounded) {$(13_10)	if (instance_exists(gravMoveMod)) {$(13_10)		gravMoveMod.duration = 0;$(13_10)	}$(13_10)} else {$(13_10)	if (!instance_exists(gravMoveMod)) {$(13_10)		gravMoveMod = instance_create(0, 0, objMoveMod);$(13_10)		gravMoveMod.ddy = -grav;$(13_10)		gravMoveMod.forever = true;$(13_10)		ds_list_add(moveModList, gravMoveMod);$(13_10)	}$(13_10)}$(13_10)$(13_10)if (ceilinged) {$(13_10)	if (instance_exists(gravMoveMod) && dy > 0) {$(13_10)		gravMoveMod.dy = -dy * bounciness;$(13_10)	}$(13_10)}$(13_10)$(13_10)//jumping$(13_10)if (grounded) {$(13_10)	if (instance_exists(jumpMoveMod)) {$(13_10)		jumpMoveMod.duration = 0;$(13_10)	} else if (durationHeld[UP] > 0 && (!heldBefore[UP] || heldBefore[UP] && durationHeld[UP] <= jumpGrace)) {$(13_10)		jumpMoveMod = instance_create(0, 0, objMoveMod);$(13_10)		jumpMoveMod.dy = jumpPower;$(13_10)		jumpMoveMod.forever = true;$(13_10)		ds_list_add(moveModList, jumpMoveMod);$(13_10)		preciseY += 1;$(13_10)	}$(13_10)}$(13_10)$(13_10)if (ceilinged) {$(13_10)	if (instance_exists(jumpMoveMod)) {$(13_10)		jumpMoveMod.duration = 0;$(13_10)	}$(13_10)}$(13_10)$(13_10)//slow from abilities$(13_10)for (var i = 0; i < numAbilities; i++) {$(13_10)	if (aState == abilityKey[i]) {$(13_10)		var slowMod = instance_create(0, 0, objSlowMod);$(13_10)		$(13_10)		if (aPhase == "u") {$(13_10)			slowMod.slow = slowWindUp[i];$(13_10)		} else if (aPhase == "d") {$(13_10)			slowMod.slow = slowDuring[i];$(13_10)		} else if (aPhase == "w") {$(13_10)			slowMod.slow = slowWindDown[i];$(13_10)		}$(13_10)		$(13_10)		ds_list_add(slowModList, slowMod);$(13_10)	}$(13_10)}$(13_10)$(13_10)//main movement logic$(13_10)dx = 0;$(13_10)dy = 0;$(13_10)$(13_10)//moveMod$(13_10)for (var i = 0; i < ds_list_size(moveModList); i++) {$(13_10)	var moveMod = ds_list_find_value(moveModList, i);$(13_10)	$(13_10)	if (moveMod.duration <= 0) {$(13_10)		ds_list_delete(moveModList, i);$(13_10)		i--;$(13_10)		$(13_10)		with (moveMod) {$(13_10)			instance_destroy();$(13_10)		}$(13_10)	} else {$(13_10)		dx += moveMod.dx;$(13_10)		dy += moveMod.dy;$(13_10)	}$(13_10)}$(13_10)$(13_10)//slowMod$(13_10)for (var i = 0; i < ds_list_size(slowModList); i++) {$(13_10)	var slowMod = ds_list_find_value(slowModList, i);$(13_10)	$(13_10)	if (slowMod.duration <= 0) {$(13_10)		ds_list_delete(slowModList, i);$(13_10)		i--;$(13_10)		$(13_10)		with (slowMod) {$(13_10)			instance_destroy();$(13_10)		}$(13_10)	} else {$(13_10)		dx *= slowMod.slow;$(13_10)		dy *= slowMod.slow;$(13_10)	}$(13_10)}$(13_10)$(13_10)//envMoveMod$(13_10)for (var i = 0; i < ds_list_size(envMoveModList); i++) {$(13_10)	var moveMod = ds_list_find_value(envMoveModList, i);$(13_10)	$(13_10)	if (moveMod.duration <= 0) {$(13_10)		ds_list_delete(envMoveModList, i);$(13_10)		i--;$(13_10)		$(13_10)		with (moveMod) {$(13_10)			instance_destroy();$(13_10)		}$(13_10)	} else {$(13_10)		dx += moveMod.dx;$(13_10)		dy += moveMod.dy;$(13_10)	}$(13_10)}$(13_10)$(13_10)scrMove();$(13_10)scrGetOutOfBlock();$(13_10)$(13_10)///needed for sprite and image$(13_10)if (durationHeld[LEFT] || durationHeld[RIGHT]) {$(13_10)	moveState = "move";$(13_10)}"
///@desc movement
//left right
if (durationHeld[RIGHT] > 0) {
	var moveMod = instance_create(0, 0, objMoveMod);
	moveMod.dx = moveSpd;
	ds_list_add(moveModList, moveMod);
}

if (durationHeld[LEFT] > 0) {
	var moveMod = instance_create(0, 0, objMoveMod);
	moveMod.dx = -moveSpd;
	ds_list_add(moveModList, moveMod);
}

//gravity
grounded = !place_meeting(preciseX, preciseY, objBlock) && place_meeting(preciseX, preciseY + 1, objBlock);
ceilinged = !place_meeting(preciseX, preciseY, objBlock) && place_meeting(preciseX, preciseY - 1, objBlock);

if (grounded) {
	if (instance_exists(gravMoveMod)) {
		gravMoveMod.duration = 0;
	}
} else {
	if (!instance_exists(gravMoveMod)) {
		gravMoveMod = instance_create(0, 0, objMoveMod);
		gravMoveMod.ddy = -grav;
		gravMoveMod.forever = true;
		ds_list_add(moveModList, gravMoveMod);
	}
}

if (ceilinged) {
	if (instance_exists(gravMoveMod) && dy > 0) {
		gravMoveMod.dy = -dy * bounciness;
	}
}

//jumping
if (grounded) {
	if (instance_exists(jumpMoveMod)) {
		jumpMoveMod.duration = 0;
	} else if (durationHeld[UP] > 0 && (!heldBefore[UP] || heldBefore[UP] && durationHeld[UP] <= jumpGrace)) {
		jumpMoveMod = instance_create(0, 0, objMoveMod);
		jumpMoveMod.dy = jumpPower;
		jumpMoveMod.forever = true;
		ds_list_add(moveModList, jumpMoveMod);
		preciseY += 1;
	}
}

if (ceilinged) {
	if (instance_exists(jumpMoveMod)) {
		jumpMoveMod.duration = 0;
	}
}

//slow from abilities
for (var i = 0; i < numAbilities; i++) {
	if (aState == abilityKey[i]) {
		var slowMod = instance_create(0, 0, objSlowMod);
		
		if (aPhase == "u") {
			slowMod.slow = slowWindUp[i];
		} else if (aPhase == "d") {
			slowMod.slow = slowDuring[i];
		} else if (aPhase == "w") {
			slowMod.slow = slowWindDown[i];
		}
		
		ds_list_add(slowModList, slowMod);
	}
}

//main movement logic
dx = 0;
dy = 0;

//moveMod
for (var i = 0; i < ds_list_size(moveModList); i++) {
	var moveMod = ds_list_find_value(moveModList, i);
	
	if (moveMod.duration <= 0) {
		ds_list_delete(moveModList, i);
		i--;
		
		with (moveMod) {
			instance_destroy();
		}
	} else {
		dx += moveMod.dx;
		dy += moveMod.dy;
	}
}

//slowMod
for (var i = 0; i < ds_list_size(slowModList); i++) {
	var slowMod = ds_list_find_value(slowModList, i);
	
	if (slowMod.duration <= 0) {
		ds_list_delete(slowModList, i);
		i--;
		
		with (slowMod) {
			instance_destroy();
		}
	} else {
		dx *= slowMod.slow;
		dy *= slowMod.slow;
	}
}

//envMoveMod
for (var i = 0; i < ds_list_size(envMoveModList); i++) {
	var moveMod = ds_list_find_value(envMoveModList, i);
	
	if (moveMod.duration <= 0) {
		ds_list_delete(envMoveModList, i);
		i--;
		
		with (moveMod) {
			instance_destroy();
		}
	} else {
		dx += moveMod.dx;
		dy += moveMod.dy;
	}
}

scrMove();
scrGetOutOfBlock();

///needed for sprite and image
if (durationHeld[LEFT] || durationHeld[RIGHT]) {
	moveState = "move";
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 1B235E9C
/// @DnDArgument : "code" "///@desc abilities$(13_10)//ability input$(13_10)for (var i = 0; i < numAbilities; i++) {$(13_10)	if (cooldownTimer[i] > 0) {$(13_10)		cooldownTimer[i]--;$(13_10)		continue;$(13_10)	}$(13_10)	$(13_10)	var index = i + 4;$(13_10)	$(13_10)	if (durationHeld[index] > 0 && !heldBefore[index]) {$(13_10)		if (aState != abilityKey[i] && aPhase == "n") {$(13_10)			if (aPhase == "w") {$(13_10)				cooldownTimer[i] = cooldown[i];$(13_10)			}$(13_10)			$(13_10)			aState = abilityKey[i];$(13_10)			aPhase = "u";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)	} else if (aState == abilityKey[i]) {$(13_10)		if (aPhase != "n") {$(13_10)			if (!(aState == "2" && aPhase == "d" && durationHeld[TWO] > 0)) {$(13_10)				timeInAPhase++;$(13_10)			}$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "u" && timeInAPhase >= windUp[i]) {$(13_10)			aPhase = "d";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "d" && timeInAPhase >= duration[i]) {$(13_10)			aPhase = "w";$(13_10)			timeInAPhase = 0;$(13_10)		}$(13_10)			$(13_10)		if (aPhase == "w" && timeInAPhase >= windDown[i]) {$(13_10)			aPhase = "n";$(13_10)			timeInAPhase = 0;$(13_10)			aState = "n";$(13_10)			cooldownTimer[i] = cooldown[i];$(13_10)		}$(13_10)	}$(13_10)}"
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
			if (!(aState == "2" && aPhase == "d" && durationHeld[TWO] > 0)) {
				timeInAPhase++;
			}
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
/// @DnDArgument : "code" "///@desc ability function$(13_10)//show_debug_message(string(aState) + " " + string(aPhase));$(13_10)if (aState == "1") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase == 0) {$(13_10)			instance_create_depth(preciseX, preciseY, thisNumber, objFireSlashHitboxTP);$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	scrResetAir();$(13_10)} else if (aState == "2") {$(13_10)	if (aPhase == "u") {$(13_10)		lobChargeTime = 0;$(13_10)		numLobs = 0;$(13_10)	}$(13_10)	$(13_10)	if (aPhase == "d") {$(13_10)		if (numLobs == 0) {$(13_10)			var angle = lobBaseAngle;$(13_10)			diffX = lobDist * dcos(angle);$(13_10)			diffY = lobDist * dsin(angle);$(13_10)			instance_create_depth(preciseX + diffX * image_xscale, preciseY - diffY, thisNumber, objFireLobChargeTP);$(13_10)			numLobs++;$(13_10)		}$(13_10)		$(13_10)		if (lobChargeTime / timePerLobCharge > numLobs && numLobs < maxLobs) {$(13_10)			var angleDir = numLobs % 2 == 0 ? -1 : 1;$(13_10)			var angle = lobBaseAngle + angleDir * lobAngleBetween * floor((numLobs + 1) / 2);$(13_10)			diffX = lobDist * dcos(angle);$(13_10)			diffY = lobDist * dsin(angle);$(13_10)			instance_create_depth(preciseX + diffX * image_xscale, preciseY - diffY, thisNumber, objFireLobChargeTP);$(13_10)			numLobs++;$(13_10)		}$(13_10)		$(13_10)		lobChargeTime++;$(13_10)	}$(13_10)} else if (aState == "3") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase == 0) {$(13_10)			var moveMod = instance_create(0, 0, objMoveMod);$(13_10)			moveMod.dy = rocketSpd;$(13_10)			moveMod.ddy = -rocketDec;$(13_10)			moveMod.duration = duration[2];$(13_10)			ds_list_add(envMoveModList, moveMod);$(13_10)		}$(13_10)		$(13_10)		scrResetAir();$(13_10)		var offset = 15;$(13_10)		$(13_10)		for (var i = 0; i < 12; i++) {$(13_10)			instance_create(preciseX + random_range(-offset, offset), preciseY - random_range(-offset, 0), objFireScrap);$(13_10)		}$(13_10)	} else if (aPhase == "w") {$(13_10)		if (timeInAPhase >= windDown[2] - 1) {$(13_10)			gravMoveMod.dy = dy;$(13_10)		}$(13_10)	}$(13_10)} else if (aState == "4") {$(13_10)	if (aPhase == "d") {$(13_10)		if (timeInAPhase == 0) {$(13_10)			timeSinceBlast = 0;$(13_10)			$(13_10)			for (var i = 0; i < blastAmount; i++) {$(13_10)				blastAngle = 90 - image_xscale * 90 + blastSpread * i / (blastAmount - 1) - blastSpread / 2;$(13_10)				instance_create_depth(preciseX, preciseY, thisNumber, objFireShotTP);$(13_10)			}$(13_10)			$(13_10)			var moveMod = instance_create(0, 0, objMoveMod);$(13_10)			moveMod.dx = blastRecoilSpd * image_xscale;$(13_10)			moveMod.ddx = blastRecoilDSpd * image_xscale;$(13_10)			moveMod.duration = blastRecoilDuration;$(13_10)			ds_list_add(envMoveModList, moveMod);$(13_10)		}$(13_10)	}$(13_10)	$(13_10)	timeSinceBlast++;$(13_10)	scrResetAir();$(13_10)}"
///@desc ability function
//show_debug_message(string(aState) + " " + string(aPhase));
if (aState == "1") {
	if (aPhase == "d") {
		if (timeInAPhase == 0) {
			instance_create_depth(preciseX, preciseY, thisNumber, objFireSlashHitboxTP);
		}
	}
	
	scrResetAir();
} else if (aState == "2") {
	if (aPhase == "u") {
		lobChargeTime = 0;
		numLobs = 0;
	}
	
	if (aPhase == "d") {
		if (numLobs == 0) {
			var angle = lobBaseAngle;
			diffX = lobDist * dcos(angle);
			diffY = lobDist * dsin(angle);
			instance_create_depth(preciseX + diffX * image_xscale, preciseY - diffY, thisNumber, objFireLobChargeTP);
			numLobs++;
		}
		
		if (lobChargeTime / timePerLobCharge > numLobs && numLobs < maxLobs) {
			var angleDir = numLobs % 2 == 0 ? -1 : 1;
			var angle = lobBaseAngle + angleDir * lobAngleBetween * floor((numLobs + 1) / 2);
			diffX = lobDist * dcos(angle);
			diffY = lobDist * dsin(angle);
			instance_create_depth(preciseX + diffX * image_xscale, preciseY - diffY, thisNumber, objFireLobChargeTP);
			numLobs++;
		}
		
		lobChargeTime++;
	}
} else if (aState == "3") {
	if (aPhase == "d") {
		if (timeInAPhase == 0) {
			var moveMod = instance_create(0, 0, objMoveMod);
			moveMod.dy = rocketSpd;
			moveMod.ddy = -rocketDec;
			moveMod.duration = duration[2];
			ds_list_add(envMoveModList, moveMod);
		}
		
		scrResetAir();
		var offset = 15;
		
		for (var i = 0; i < 12; i++) {
			instance_create(preciseX + random_range(-offset, offset), preciseY - random_range(-offset, 0), objFireScrap);
		}
	} else if (aPhase == "w") {
		if (timeInAPhase >= windDown[2] - 1) {
			gravMoveMod.dy = dy;
		}
	}
} else if (aState == "4") {
	if (aPhase == "d") {
		if (timeInAPhase == 0) {
			timeSinceBlast = 0;
			
			for (var i = 0; i < blastAmount; i++) {
				blastAngle = 90 - image_xscale * 90 + blastSpread * i / (blastAmount - 1) - blastSpread / 2;
				instance_create_depth(preciseX, preciseY, thisNumber, objFireShotTP);
			}
			
			var moveMod = instance_create(0, 0, objMoveMod);
			moveMod.dx = blastRecoilSpd * image_xscale;
			moveMod.ddx = blastRecoilDSpd * image_xscale;
			moveMod.duration = blastRecoilDuration;
			ds_list_add(envMoveModList, moveMod);
		}
	}
	
	timeSinceBlast++;
	scrResetAir();
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 78F94C44
/// @DnDArgument : "code" "///@desc sprite and image$(13_10)if (durationHeld[RIGHT] > 0) {$(13_10)	image_xscale = 1;$(13_10)} else if (durationHeld[LEFT] > 0) {$(13_10)	image_xscale = -1;$(13_10)}$(13_10)$(13_10)if (aPhase != "n") {$(13_10)	if (aState == "4") {$(13_10)		if (aPhase == "u") {$(13_10)			sprite_index = sprMagePreBlast;$(13_10)			$(13_10)			if (timeInAPhase == 0) {$(13_10)				image_index = 0;$(13_10)			}$(13_10)		} else if (aPhase == "d") {$(13_10)			sprite_index = sprMagePostBlast;$(13_10)			$(13_10)			if (timeInAPhase == 0) {$(13_10)				image_index = 0;$(13_10)			}$(13_10)		}$(13_10)	}$(13_10)} else if (!grounded) {$(13_10)	if (dy >= 0) {$(13_10)		sprite_index = sprMageGoingUp;$(13_10)	} else {$(13_10)		sprite_index = sprMageGoingDown;$(13_10)	}$(13_10)} else if (durationHeld[RIGHT] > 0 || durationHeld[LEFT] > 0) {$(13_10)	sprite_index = sprMageMove;$(13_10)} else {$(13_10)	sprite_index = sprMageNone;$(13_10)}"
///@desc sprite and image
if (durationHeld[RIGHT] > 0) {
	image_xscale = 1;
} else if (durationHeld[LEFT] > 0) {
	image_xscale = -1;
}

if (aPhase != "n") {
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
}