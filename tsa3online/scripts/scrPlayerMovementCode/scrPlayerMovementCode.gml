///@desc movement
//left right
if (hp > 0) {
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
}

//gravity
blockGrounded = !place_meeting(preciseX, preciseY, objBlock) && place_meeting(preciseX, preciseY + 1, objBlock);
platformGrounded = !place_meeting(preciseX, preciseY, objPlatform) && place_meeting(preciseX, preciseY + 1, objPlatform);
grounded = blockGrounded || platformGrounded && dy <= 0;
ceilinged = !place_meeting(preciseX, preciseY, objBlock) && place_meeting(preciseX, preciseY - 1, objBlock);

if (grounded) {
	timeSinceGrounded = 0
} else {
	timeSinceGrounded++
}

var coyoteTime = 5

if (grounded) {
	if (instance_exists(gravMoveMod)) {
		gravMoveMod.duration = 0;
	}
	
	currAirJumps = 0;
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
if (timeSinceGrounded == 0) {
	if (instance_exists(jumpMoveMod)) {
		jumpMoveMod.duration = 0
	}
}

if (hp > 0) {
	if (timeSinceGrounded < coyoteTime) {
		if (durationHeld[UP] > 0 && !heldBefore[UP]/*(!heldBefore[UP] || heldBefore[UP] && durationHeld[UP] <= jumpGrace)*/) {
			if (!instance_exists(jumpMoveMod)) {
				jumpMoveMod = instance_create(0, 0, objMoveMod)
				jumpMoveMod.dy = jumpPower
				jumpMoveMod.forever = true
				ds_list_add(moveModList, jumpMoveMod)
			}
		
			if (instance_exists(gravMoveMod)) {
				gravMoveMod.dy = 0
			}
		
			if (timeSinceGrounded == 0) {
				preciseY += 1
			}
		
			timeSinceGrounded = coyoteTime
		}
	}

	if (/*!grounded*/timeSinceGrounded >= coyoteTime && currAirJumps < airJumps) {
		if (durationHeld[UP] > 0 && !heldBefore[UP]/*(!heldBefore[UP] || heldBefore[UP] && durationHeld[UP] <= jumpGrace)*/) {
			if (instance_exists(jumpMoveMod)) {
				jumpMoveMod.dy = jumpPower;
			} else {
				jumpMoveMod = instance_create(0, 0, objMoveMod);
				jumpMoveMod.dy = jumpPower;
				jumpMoveMod.forever = true;
				ds_list_add(moveModList, jumpMoveMod);
			}
		
			if (instance_exists(gravMoveMod)) {
				gravMoveMod.dy = 0;
			}
		
			currAirJumps++;
		}
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
			slowMod.slowTo = slowWindUp[i];
		} else if (aPhase == "d") {
			slowMod.slowTo = slowDuring[i];
		} else if (aPhase == "w") {
			slowMod.slowTo = slowWindDown[i];
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
image_speed = 1;

for (var i = 0; i < ds_list_size(slowModList); i++) {
	var slowMod = ds_list_find_value(slowModList, i);
	
	if (slowMod.slowDuration <= 0) {
		ds_list_delete(slowModList, i);
		i--;
		
		with (slowMod) {
			instance_destroy();
		}
	} else {
		dx *= slowMod.slowTo;
		dy *= slowMod.slowTo;
		
		//bad practice but i'm adding image_speed in here
		if (aState == "n") {
			image_speed *= slowMod.slowTo;
		}
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

/*if (thisNumber == 1) {
	preciseX = room_width - heroId[0].preciseX
	preciseY = heroId[0].preciseY
	x = room_width - heroId[0].x
	y = heroId[0].y
}*/