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
if (!place_meeting(preciseX, preciseY + 1, objBlock)) {
    dy -= ddy;
    
    if (dy > 0 && place_meeting(preciseX, preciseY - 1, objBlock)) {
        dy = 0;
    }
} else {
    if (dy < 0) {
        dy = 0;
        jumpState = NONE;
        currJumps = 0;
    } else {
        if (jumpState == INIT_JUMP) {
            jumpState = NONE;
            dy = jumpDy;
        }
    }
}

//summon totem
if (attackState == INIT_ATTACK) {
    attackState = NONE;
    
    if (totemReady) {
        totemReady = false;
        logicId.summonTotem = true;
    }
}

//wind
if (abilityState == INIT_ABILITY) {
    abilityState = NONE;
    
    if (windReady) {
        windReady = false;
        logicId.summonWind = true;
    }
}

//lightning
if (threeState == INIT_THREE) {
    threeState = NONE;
    
    if (lightningReady) {
        lightningReady = false;
        logicId.summonLightning = true;
    }
}

//fire
if (fourState == INIT_FOUR) {
    fourState = NONE;
    
    if (fireReady) {
        fireReady = false;
        logicId.summonFire = true;
    }
}

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

