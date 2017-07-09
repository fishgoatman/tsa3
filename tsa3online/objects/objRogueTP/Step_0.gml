/// @description act based on input
if (dashing) {
	sprite_index = sprRogueDash;
	image_angle = darctan2(dy, dx);
} else {
	//dx
	if (state == MOVE) {
	    if (direct == RIGHT && !place_meeting(preciseX + 1, preciseY, objBlock) || direct == LEFT
	    && !place_meeting(preciseX - 1, preciseY, objBlock)) {
	        dx = direct * spd;
	    } else {
	        dx = 0;
	    }
	} else {
	    dx = 0;
	}

	//dy
	if (upHeld && !upPressed) {
		if (place_meeting(preciseX + 1, preciseY, objBlock) || place_meeting(preciseX - 1, preciseY, objBlock)) {
	        dy = climbSpd;
	        currAirJumps = maxAirJumps - 1;
	        climbing = true;
	    }
	
		upHeld = false;
	} else if (upPressed) {
		if (place_meeting(preciseX, preciseY + 1, objBlock)) {
		    jumpState = INIT_JUMP;
		} else if (tpId.currAirJumps < maxAirJumps) {
		    jumpState = INIT_JUMP;
		    currAirJumps++;
		}
	
		upPressed = false;
		climbing = false;
	} else {
		climbing = false;
	}

	if (jumpState == INIT_JUMP && currAirJumps >= 1) {
	    jumpState = NONE;
	    dy = jumpDy;
	} else if (!place_meeting(preciseX, preciseY + 1, objBlock)) {
	    dy -= ddy;
    
	    if (dy > 0 && place_meeting(preciseX, preciseY - 1, objBlock)) {
	        dy = 0;
	    }
	} else {
	    if (dy < 0) {
	        dy = 0;
	        currAirJumps = 0;
	        jumpState = NONE;
	    } else {
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

	//attacking
	if (onePressed) {
	    spd = attackSpd;
	    attackState = PRE_ATTACK;
	    alarm[PRE_ATTACK] = attackPreTime;
		onePressed = false;
	}

	//ability
	if (twoPressed) {
		var diffX = mouse_x - x;
		var diffY = y - mouse_y;
		var hyp = sqrt(diffX * diffX + diffY * diffY);
		dx = dashSpd * diffX / hyp;
		dy = dashSpd * diffY / hyp;
		dashing = true;
		alarm[DASH] = dashTime;
		twoPressed = false;
	}

	if (threePressed) {
		threePressed = false;
	}

	if (fourPressed) {
		fourPressed = false;
	}

	///sprite and image
	image_xscale = direct;
	image_angle = 0;

	if (jumpState == PRE_JUMP) {
	    sprite_index = sprRoguePreJump;
	} else if (jumpState == POST_JUMP) {
	    sprite_index = sprRoguePostJump;
	} else if (attackState == PRE_ATTACK) {
	    if (ducking) {
	        sprite_index = sprRoguePreAttackDuck;
	    } else {
	        sprite_index = sprRoguePreAttack;
	    }
	} else if (attackState == POST_ATTACK) {
	    if (ducking) {
	        sprite_index = sprRoguePostAttackDuck;
	    } else {
	        sprite_index = sprRoguePostAttack;
	    }
	} else if (climbing) {
	    sprite_index = sprRogueClimb;
	} else {
	    if (!place_meeting(preciseX, preciseY + 1, objBlock)) {
	        if (dy > 0) {
	            sprite_index = sprRogueGoingUp;
	        } else if (dy == 0) {
	            sprite_index = sprRogueNone;
	        } else {
	            sprite_index = sprRogueGoingDown;
	        }
	    } else if (state == MOVE) {
	        sprite_index = sprRogueMove;
	    } else {
	        if (ducking) {
	            sprite_index = sprRogueNoneDuck;
	        } else {
	            sprite_index = sprRogueNone;
	        }
	    }
	}
}

scrMove();

///die
if (hp <= 0) {
    instance_destroy();
}