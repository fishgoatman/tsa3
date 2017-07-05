/// @description act based on input
//dx
if (abilityState != PRE_ABILITY) {
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
}

//dy
if (jumpState == INIT_JUMP && currAirJumps >= 1) {
    jumpState = NONE;
    dy = jumpDy;
} else if (abilityState == ACTIVATE_ABILITY) {
    abilityState = NONE;
} else if (!place_meeting(preciseX, preciseY + 1, objBlock)) {
    dy -= ddy;
    
    if (dy > 0 && place_meeting(preciseX, preciseY - 1, objBlock)) {
        dy = 0;
    }
} else {
    if (dy < 0) {
        dy = 0;
        jumpState = POST_JUMP;
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
if (attackState == INIT_ATTACK) {
    spd = attackSpd;
    attackState = PRE_ATTACK;
    alarm[PRE_ATTACK] = attackPreTime;
}

//ability
if (abilityState == INIT_ABILITY) {
    spd = abilityDx;
} else {
    spd = moveSpd;
}

scrMove();

core.x = x;
core.y = y;
core.image_xscale = direct;

///sprite and image
image_xscale = direct;

if (jumpState == PRE_JUMP) {
    sprite_index = sprKnightPreJump;
} else if (jumpState == POST_JUMP) {
    sprite_index = sprKnightPostJump;
} else if (attackState == PRE_ATTACK) {
    if (ducking) {
        //sprite_index = sprKnightPreAttackDuck;
    } else {
        sprite_index = sprKnightPreAttack;
    }
} else if (attackState == POST_ATTACK) {
    if (ducking) {
        //sprite_index = sprKnightPostAttackDuck;
    } else {
        sprite_index = sprKnightPostAttack;
    }
} else if (abilityState == INIT_ABILITY) {
    sprite_index = sprKnightBlock;
} else {
    if (!place_meeting(preciseX, preciseY + 1, objBlock)) {
        if (dy > 0) {
            sprite_index = sprKnightGoingUp;
        } else if (dy == 0) {
            sprite_index = sprKnightNone;
        } else {
            sprite_index = sprKnightGoingDown;
        }
    } else if (state == MOVE) {
        image_speed = 0.6;
        sprite_index = sprKnightMove;
    } else {
        if (ducking) {
            sprite_index = sprKnightNoneDuck;
        } else {
            sprite_index = sprKnightNone;
        }
    }
}

///die
if (hp <= 0) {
    instance_destroy();
    show_debug_message("dead");
    
    with (core) {
        instance_destroy();
    }
}

