/// @description act based on input
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