/// @description act based on input
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
if (upPressed) {
	if (place_meeting(preciseX, preciseY + 1, objBlock)) {
        jumpState = INIT_JUMP;
    } else if (tpId.currAirJumps < maxAirJumps) {
        jumpState = INIT_JUMP;
        currAirJumps++;
    }
	
	upPressed = false;
}

if (attackState == PRE_ATTACK) {
	dy = 0;
} else if (!place_meeting(preciseX, preciseY + 1, objBlock)) {
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
if (onePressed && attackState == NONE) {
    alarm[PRE_ATTACK] = attackPreTime;
    attackState = PRE_ATTACK;
}

//ability
if (twoPressed) {
    if (place_meeting(preciseX, preciseY - 1, objBlock)) {
        dy = 0;
    } else {
        dy = floatDy;
    }
    
    spd = floatDx;
} else {
    spd = moveSpd;
}

if (threePressed) {
	threePressed = false;
}

if (fourPressed) {
	fourPressed = false;
}

scrMove();

/* */
///sprite and image
image_xscale = direct;

if (jumpState == PRE_JUMP) {
    sprite_index = sprMagePreJump;
} else if (jumpState == POST_JUMP) {
    sprite_index = sprMagePostJump;
} else if (abilityState == INIT_ABILITY) {
    sprite_index = sprMageFloat;
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