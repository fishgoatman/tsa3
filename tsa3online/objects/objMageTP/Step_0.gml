/// @description act based on input
if (boosted) {
	if (abilityState == INIT_ABILITY) {
		spd = boostedDx;
	} else {
		spd = boostedWalkingSpd;
	}
} else if (abilityState == INIT_ABILITY) {
	spd = flyDx;
} else {
	spd = moveSpd;
}

//dx
if (attackState == NONE && state == MOVE) {
    if (direct == RIGHT && !place_meeting(preciseX + 1, preciseY, objBlock) || direct == LEFT
    && !place_meeting(preciseX - 1, preciseY, objBlock)) {
        moveDx = direct * spd;
    } else {
        moveDx = 0;
    }
} else {
    moveDx = 0;
}

if (moveDx != 0 && sign(moveDx) != sign(naturalDx)) {
	if (abs(naturalDx) < abs(moveDx)) {
		naturalDx = 0;
	} else {
		naturalDx += moveDx;
	}
}

dx = moveDx + naturalDx;

//dy
if (attackState == PRE_ATTACK) {
	dy = 0;
} else if (abilityState == INIT_ABILITY) {
	if (upHeld) {
		if (boosted) {
			dy = boostedDy;
		} else {
			dy = flyDy;
		}
		
		upHeld = false;
	} else if (ducking) {
		if (boosted) {
			dy = -boostedDy;
		} else {
			dy = -flyDy;
		}
		
		ducking = false;
	} else {
		dy = 0;
	}
} else if (abilityState == NONE && !place_meeting(preciseX, preciseY + 1, objBlock)) {
    dy -= ddy;
    
    if (dy > 0 && place_meeting(preciseX, preciseY - 1, objBlock)) {
        dy = 0;
    }
} else {
    if (dy < 0) {
        dy = 0;
        jumpState = POST_JUMP;
        currJumps = 0;
        spd = jumpDx;
        alarm[POST_JUMP] = jumpPostTime;
    } else {
		if (upPressed) {
			if (place_meeting(preciseX, preciseY + 1, objBlock)) {
			    jumpState = INIT_JUMP;
			} else if (tpId.currAirJumps < maxAirJumps) {
			    jumpState = INIT_JUMP;
			    currAirJumps++;
			}
	
			upPressed = false;
		}
	
        if (jumpState == INIT_JUMP) {
            jumpState = PRE_JUMP;
            spd = jumpDx;
            alarm[PRE_JUMP] = jumpPreTime;
        } else if (jumpState == JUMP) {
            jumpState = NONE;
            dy = jumpDy;
        }
    }
}

if (upPressed) {
	upPressed = false;
}

if (onePressed && fireballState == NONE) {
	alarm[FIREBALL_PRE] = fireballPreTime;
	fireballState = PRE_ATTACK;
	onePressed = false;
}

if (twoPressed && attackState == NONE) {
    alarm[PRE_ATTACK] = attackPreTime;
    attackState = PRE_ATTACK;
	twoPressed = false;
}

if (threePressed) {
	if (flyReady) {
		if (abilityState == INIT_ABILITY) {
			abilityState = NONE;
			spd = moveSpd;
		} else {
			spd = flyDx;
			abilityState = INIT_ABILITY;
		}
		
		flyReady = false;
		alarm[FLY_CD] = flyCDTime;
	}
	
	threePressed = false;
}

if (fourPressed) {
	if (boostReady) {
		boosted = true;
		alarm[BOOST_DURATION] = boostDuration;
		boostReady = false;
		spd = boostedDx;
	}

	fourPressed = false;
}

scrMove();

/* */
///sprite and image
if (boosted) {
	for (var i = 0; i < 10; i++) {
		instance_create(preciseX - direct * random(10), preciseY - random_range(-12, 5), objFireScrap);
	}
}

if (boostReady) {
	var r = 3;

	for (var i = 0; i < 3; i++) {
		instance_create(preciseX + random_range(-r, r), preciseY - random_range(-r, r), objFireScrap);
	}
}

image_xscale = direct;

if (jumpState == PRE_JUMP) {
    sprite_index = sprMagePreJump;
} else if (jumpState == POST_JUMP) {
    sprite_index = sprMagePostJump;
} else if (attackState == PRE_ATTACK) {
    if (ducking) {
        sprite_index = sprMagePreAttackDuck;
    } else {
        sprite_index = sprMagePreOne;
    }
} else if (attackState == POST_ATTACK) {
    if (ducking) {
        sprite_index = sprMagePostAttackDuck;
    } else {
        sprite_index = sprMagePostOne;
    }
} else if (abilityState == INIT_ABILITY) {
    sprite_index = sprMageFly;
} else {
    if (!place_meeting(preciseX, preciseY + 1, objBlock)) {
        if (dy > 0) {
            sprite_index = sprMageGoingUp;
        } else if (dy == 0) {
            sprite_index = sprMageNone;
        } else {
            sprite_index = sprMageGoingDown;
        }
    } else if (state == MOVE) {
        sprite_index = sprMageMove;
    } else {
        if (ducking) {
            sprite_index = sprMageNoneDuck;
        } else {
            sprite_index = sprMageNone;
        }
    }
}

///die
if (hp <= 0) {
    instance_destroy();
}

///other
ds_list_clear(immuneTo);