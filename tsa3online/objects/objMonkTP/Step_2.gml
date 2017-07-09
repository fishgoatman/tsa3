/// @description sprite and image
image_xscale = direct;

if (blinkState == KICK_BLINK) {
    sprite_index = sprMonkKickBlink;
    blinkState = NONE;
} if (blinkState == BLINK) {
    sprite_index = sprMonkBlink;
    blinkState = NONE;
} else if (jumpState == PRE_JUMP) {
    sprite_index = sprMonkPreJump;
} else if (jumpState == POST_JUMP) {
    sprite_index = sprMonkPostJump;
} else if (attackState == PRE_ATTACK) {
    if (ducking) {
        sprite_index = sprMonkPreAttackDuck;
    } else {
        sprite_index = sprMonkPreAttack;
    }
} else if (attackState == DURING_ATTACK) {
    if (ducking) {
        sprite_index = sprMonkDuringAttackDuck;
    } else {
        sprite_index = sprMonkDuringAttack;
    }
} else if (attackState == POST_ATTACK) {
    if (ducking) {
        sprite_index = sprMonkPostAttackDuck;
    } else {
        sprite_index = sprMonkPostAttack;
    }
} else {
    if (!place_meeting(preciseX, preciseY + 1, objBlock)) {
        if (dy > 0) {
            sprite_index = sprMonkGoingUp;
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

