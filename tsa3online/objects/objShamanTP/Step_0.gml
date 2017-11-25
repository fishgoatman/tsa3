/// @description act based on input
//dx
if (stunTime > 0) {
	stunTime--;
	onePressed = false;
	twoPressed = false;
	threePressed = false;
	fourPressed = false;
	ducking = false;
	upPressed = false;
	upHeld = false;
	moveDx = 0;
	moveDy = 0;
} else {
	if (state == MOVE) {
	    if (direct == RIGHT && !place_meeting(preciseX + 1, preciseY, objBlock) || direct == LEFT
	    && !place_meeting(preciseX - 1, preciseY, objBlock)) {
	        moveDx = direct * spd;
	    } else {
	        moveDx = 0;
	    }
	} else {
	    moveDx = 0;
	}

	//dy
	if (upPressed) {
		upPressed = false;
		
		if (place_meeting(preciseX, preciseY + 1, objBlock)) {
			jumpState = INIT_JUMP;
		}
	}

	if (jumpState == INIT_JUMP) {
		jumpState = NONE;
		naturalDy = 0;
		moveDy = jumpDy;
		preciseY--;
	}

	//summon totem
	if (onePressed) {
	    if (totemReady) {
	        totemReady = false;
			
	        if (place_meeting(preciseX, preciseY, objTotem)) {
				//logicId.summonEarthAura = true;
				logicId.summonTotem = true;
			} else {
				logicId.summonTotem = true;
			}
	    }
	
		onePressed = false;
	}

	//wind
	if (twoPressed) {
	    if (windReady) {
	        windReady = false;
	        logicId.summonWind = true;
	    }
	
		twoPressed = true;
	}

	//lightning
	if (threePressed) {
	    if (lightningReady) {
	        lightningReady = false;
	        logicId.summonLightning = true;
	    }
	
		threePressed = false;
	}

	//fire
	if (fourPressed) {
	    if (fireReady) {
	        fireReady = false;
			
			if (place_meeting(preciseX, preciseY, objTotem)) {
				//logicId.summonFireAura = true;
				logicId.summonFire = true;
			} else {
				logicId.summonFire = true;
			}
	    }
	
		fourPressed = false;
	}
}

if (place_meeting(preciseX, preciseY + 1, objBlock)) {
	moveDy = 0;
	naturalDy = 0;
	currAirJumps = 0;
	jumpState = NONE;
} else if (place_meeting(preciseX, preciseY - 1, objBlock)) {
	moveDy = 0;
	naturalDy = 0;
	preciseY++;
} else {
	if (moveDy > ddy) {
		moveDy -= ddy;
	} else if (moveDy > 0) {
		moveDy = 0;
	} else {
		naturalDy -= ddy;
	}
}

dx = moveDx + naturalDx;
dy = moveDy + naturalDy;
scrMove();

///sprite and image
image_xscale = direct;

if (jumpState == PRE_JUMP) {
    sprite_index = sprShamanPreJump;
} else if (jumpState == POST_JUMP) {
    sprite_index = sprShamanPostJump;
} else {
    if (!place_meeting(preciseX, preciseY + 1, objBlock)) {
        if (dy > 0) {
            sprite_index = sprShamanGoingUp;
        } else if (dy == 0) {
            sprite_index = sprShamanNone;
        } else {
            sprite_index = sprShamanGoingDown;
        }
    } else if (state == MOVE) {
        sprite_index = sprShamanMove;
    } else {
        if (ducking) {
            sprite_index = sprShamanNoneDuck;
        } else {
            sprite_index = sprShamanNone;
        }
    }
}

///die
if (hp <= 0) {
    instance_destroy();
}