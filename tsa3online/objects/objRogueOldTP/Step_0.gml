/// @description act based on input
if (stunTime > 0) {
	stunTime--;
	onePressed = false;
	oneReleased = false;
	twoPressed = false;
	ducking = false;
	upPressed = false;
	upHeld = false;
	moveDx = 0;
	moveDy = 0;
	
	with (objRogueKnifeIndicatorCW) {
		instance_destroy();
	}
		
	with (objRogueKnifeIndicatorCCW) {
		instance_destroy();
	}
	
	attackState = NONE;
	spd = moveSpd;
	currAngle = startAngle;
	charging = false;
} else if (dashing) {
	sprite_index = sprRogueDash;
	image_angle = dashAngle - 90;
} else {
	if (mouseAi != "rogue") {
		tMouseX = mouse_x;
		tMouseY = mouse_y;
	}
	
	mouseAngle = darctan2(y - tMouseY, tMouseX - x);

	//dx
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
	
	if (moveDx != 0 && sign(moveDx) != sign(naturalDx)) {
		if (abs(naturalDx) < abs(moveDx)) {
			naturalDx = 0;
		} else {
			naturalDx += moveDx;
		}
	}
	
	if (abs(naturalDx) > frictionDx) {
		naturalDx -= frictionDx * sign(naturalDx);
	} else {
		naturalDx = 0;
	}

	//dy
	if (upHeld && !upPressed) {
		if (place_meeting(preciseX + 1, preciseY, objBlock) || place_meeting(preciseX - 1, preciseY, objBlock)) {
	        moveDy = climbSpd;
			naturalDy = 0;
	        currAirJumps = maxAirJumps - 1;
	        climbing = true;
	    } else {
			climbing = false;
		}
	
		upHeld = false;
	} else if (upPressed) {
		if (place_meeting(preciseX, preciseY + 1, objBlock)) {
		    jumpState = INIT_JUMP;
		} else if (currAirJumps < maxAirJumps) {
		    jumpState = INIT_JUMP;
		    currAirJumps++;
		}
	
		upPressed = false;
		climbing = false;
	} else {
		climbing = false;
	}
	
	if (jumpState == INIT_JUMP) {
		jumpState = NONE;
		naturalDy = 0;
		moveDy = jumpDy;
		preciseY--;
	}

	//attacking
	if (onePressed) {
		if (attackState == NONE) {
			if (!charging) {
				instance_create(preciseX, preciseY, objRogueKnifeIndicatorCW);
				instance_create(preciseX, preciseY, objRogueKnifeIndicatorCCW);
			}
		
			currAngle += dAngle;
		
			if (currAngle < endAngle) {
				currAngle = endAngle;
			}
		
			charging = true;
		}
		
	    onePressed = false;
	}
	
	if (oneReleased) {
		if (attackState == NONE) {
			charging = false;
			spd = attackSpd;
		
			for (var i = 0; i < daggerAmount; i++) {
				daggerAngle = currAngle * i / (daggerAmount - 1) - currAngle / 2;
				instance_create(preciseX, preciseY, objDaggerTP);
			}

			attackState = POST_ATTACK;
			alarm[POST_ATTACK] = attackPostTime;
			oneActivate = true;
		
			with (objRogueKnifeIndicatorCW) {
				instance_destroy();
			}
		
			with (objRogueKnifeIndicatorCCW) {
				instance_destroy();
			}
		}
		
		oneReleased = false;
	}

	//ability
	if (twoPressed) {
		if (dashReady) {
			var diffX = tMouseX - x;
			var diffY = y - tMouseY;
			var hyp = sqrt(diffX * diffX + diffY * diffY);
			naturalDx = dashSpd * diffX / hyp;
			moveDy = dashSpd * diffY / hyp;
			dashing = true;
			dashReady = false;
			dashAngle = mouseAngle;
			alarm[DASH] = dashTime;
			alarm[DASH_COOLDOWN] = dashCooldownTime;
			
			with (objRogueDashIndicator) {
				instance_destroy();
			}
			
			for (var i = 0; i < boltAmount; i++) {
				boltAngle = boltSpread * i / (boltAmount - 1) - boltSpread / 2;
				instance_create(preciseX, preciseY, objBoltTP);
			}
			
			twoActivate = true;
		}
		
		twoPressed = false;
	}

	if (threePressed) {
		threePressed = false;
	}

	if (fourPressed) {
		fourPressed = false;
	}
}

//slow
var tempDdy = ddy;

for (var i = 0; i < ds_list_size(slowTos); i++) {
	tempDdy *= ds_list_find_value(slowTos, i);
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
	if (moveDy > tempDdy) {
		moveDy -= tempDdy;
	} else if (moveDy > 0) {
		moveDy = 0;
	} else {
		naturalDy -= tempDdy;
	}
}

dx = moveDx + naturalDx;
dy = moveDy + naturalDy;

for (var i = 0; i < ds_list_size(slowTos); i++) {
	dx *= ds_list_find_value(slowTos, i);
	dy *= ds_list_find_value(slowTos, i);
}

for (var i = 0; i < ds_list_size(slowTimes); i++) {
	ds_list_replace(slowTimes, i, ds_list_find_value(slowTimes, i) - 1);
	
	if (ds_list_find_value(slowTimes, i) == 0) {
		ds_list_delete(slowTimes, i);
		ds_list_delete(slowIds, i);
		ds_list_delete(slowTos, i);
	}
}

scrMove();
ds_list_clear(immuneToThisTick);

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

///die
if (hp <= 0) {
    instance_destroy();
}

///other
//ds_list_clear(immuneTo);