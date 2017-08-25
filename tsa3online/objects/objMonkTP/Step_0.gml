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
	attackState = NONE;
	spd = moveSpd;
} else {
	if (mouseAi != "monk") {
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
	if (upHeld) {
		upHeld = false;
	}
	
	if (upPressed) {
		if (place_meeting(preciseX, preciseY + 1, objBlock)) {
		    jumpState = INIT_JUMP;
		} else if (currAirJumps < maxAirJumps) {
		    jumpState = INIT_JUMP;
		    currAirJumps++;
		}
	
		upPressed = false;
	}
	
	if (jumpState == INIT_JUMP) {
		jumpState = NONE;
		naturalDy = 0;
		moveDy = jumpDy;
		preciseY--;
	}

	//attacking
	if (onePressed) {
		if (released) {
			if (timeAfterBlink < blinkKickTime) {
				instance_create(preciseX, preciseY, objKickHurtboxTP);
				released = false;
				attackState = POST_ATTACK;
				alarm[POST_ATTACK] = attackPostTime;
			}
		}
		
		oneChargingTime++;
	    onePressed = false;
	}
	
	if (oneReleased) {
		if (attackState == NONE) {
			var xDiff = mouse_x - x;
			var yDiff = y - mouse_y;
			var hyp = sqrt(xDiff * xDiff + yDiff * yDiff);
			spd = moveSpd;
			attackState = POST_ATTACK;
			alarm[POST_ATTACK] = attackPostTime;
		
			if (oneChargingTime >= dragonPunchChargeTime) {
				instance_create(preciseX, preciseY, objDragonPunchHurtboxTP);
				preciseX -= attackDisplace * xDiff / hyp;
				preciseY += attackDisplace * yDiff / hyp;
				naturalDx -= attackNaturalDxIncrease * sign(xDiff);
				naturalDy += attackNaturalDxIncrease * -sign(yDiff);
			} else {
				instance_create(preciseX, preciseY, objPunchHurtboxTP);
				preciseX += attackDisplace * xDiff / hyp;
				preciseY -= attackDisplace * yDiff / hyp;
				naturalDx += attackNaturalDxIncrease * sign(xDiff);
				naturalDy -= attackNaturalDxIncrease * -sign(yDiff);
			}
		}
		
		oneChargingTime = 0;
		oneReleased = false;
		released = true;
	}

	//ability
	if (twoPressed) {
		if (blinkReady) {
			var diffX = tMouseX - x;
			var diffY = y - tMouseY;
			var hyp = sqrt(diffX * diffX + diffY * diffY);
			var smallDx = diffX / hyp;
			var smallDy = diffY / hyp;
			
			for (var i = 0; i < blinkDist; i++) {
				if (i % 16 == 0) {
					instance_create(preciseX, preciseY, objMonkBlinkShadowTP);
				}
				
				if (place_meeting(preciseX + smallDx, preciseY - smallDy, objBorder)) {
					break;
				}
				
				preciseX += smallDx;
				preciseY -= smallDy;
			}
			
			blinkReady = false;
			timeAfterBlink = 0;
			naturalDx = 0;
			naturalDy = 0;
			alarm[BLINK_COOLDOWN] = blinkCooldownTime;
			attackCounter = 0;
			currAirJumps = maxAirJumps - 1;
			twoActivate = true;
			attackState = NONE;
		}
		
		twoPressed = false;
	}
	
	timeAfterBlink++;

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
	sprite_index = sprMonkPreJump;
} else if (jumpState == POST_JUMP) {
	sprite_index = sprMonkPostJump;
} else if (attackState == PRE_ATTACK) {
	if (ducking) {
	    sprite_index = sprMonkPreAttackDuck;
	} else {
	    sprite_index = sprMonkPreAttack;
	}
} /*Uelse if (attackState == POST_ATTACK) {
	if (ducking) {
	    sprite_index = sprMonkPostAttackDuck;
	} else {
	    sprite_index = sprMonkPostAttack;
	}
}*/ else {
	if (!place_meeting(preciseX, preciseY + 1, objBlock)) {
	    if (dy > 0) {
	        sprite_index = sprMonkGoingUp;
	    } else if (dy == 0) {
	        sprite_index = sprMonkNone;
	    } else {
	        sprite_index = sprMonkGoingDown;
	    }
	} else if (state == MOVE) {
	    sprite_index = sprMonkMove;
	} else {
	    if (ducking) {
	        sprite_index = sprMonkNoneDuck;
	    } else {
	        sprite_index = sprMonkNone;
	    }
	}
}

///die
if (hp <= 0) {
    instance_destroy();
}

///other
//ds_list_clear(immuneTo);