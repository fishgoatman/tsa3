/// @description act based on input
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
if (upPressed) {
	if (place_meeting(heroId.preciseX, heroId.preciseY + 1, objBlock)) {
        heroId.jumpState = INIT_JUMP;
    } else if (heroId.currAirJumps < heroId.maxAirJumps) {
        heroId.jumpState = INIT_JUMP;
        heroId.currAirJumps++;
    }
	
	upPressed = false;
}

if (!place_meeting(preciseX, preciseY + 1, objBlock)) {
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
if (attackState == INIT_ATTACK && changeReady) {
    firingMode *= -1;
    attackState = NONE;
    changeReady = false;
    alarm[CHANGE] = changeCDTime;
}

if (firingMode == MAGE && mageAttackState == NONE) {
    alarm[PRE_ATTACK] = attackPreTime;
    mageAttackState = PRE_ATTACK;
}

//ability
if (abilityState == INIT_ABILITY) {
    if (place_meeting(preciseX, preciseY - 1, objBlock)) {
        dy = 0;
    } else {
        dy = floatDy;
    }
    
    spd = floatDx;
} else {
    spd = moveSpd;
}

/*if (abilityState == INIT_ABILITY) {
    allExplode = true;
} else {
    allExplode = false;
}*/

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
        sprite_index = sprMagePreAttack;
    }
} else if (attackState == POST_ATTACK) {
    if (ducking) {
        sprite_index = sprMagePostAttackDuck;
    } else {
        sprite_index = sprMagePostAttack;
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

/* */
///die
if (hp <= 0) {
    instance_destroy();
}

/* */
/*  */
