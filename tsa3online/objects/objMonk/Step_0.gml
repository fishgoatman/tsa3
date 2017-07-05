/// @description act based on input
//energy regen (comes first because needs to see dy)
if (place_meeting(preciseX, preciseY + 1, objBlock)) {
    if (dy < 0) {
        currEnergy += energyBurst;
    } else {
        currEnergy += energyRegen;
    }
    
    if (currEnergy > maxEnergy) {
        currEnergy = maxEnergy;
    }
}

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
if (currEnergy >= jumpEnergyCost && jumpState == INIT_JUMP) {
    jumpState = NONE;
    dy = jumpDy;
    currEnergy -= jumpEnergyCost;
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
if (attackState == INIT_ATTACK) {
    kickBlinkPrepped = true;
    alarm[KICK_BLINK] = kickBlinkTime;
    spd = attackSpd;
    attackState = PRE_ATTACK;
    alarm[PRE_ATTACK] = attackPreTime;
}

//ability
if (abilityState == INIT_ABILITY) {
    var cost;

    if (kickBlinkPrepped) {
        cost = kickBlinkEnergyCost;
    } else {
        cost = blinkEnergyCost;
    }

    if (cost <= currEnergy && !blinkOnCooldown && !ducking) {
        currAirJumps = maxAirJumps - 1;
        currEnergy -= cost;
        var totalDisp = 0;
        var shadow;
        var displace;
        
        if (kickBlinkPrepped) {
            if (controlScheme == MOUSE) {
                shadow = objMonkKickShadowMP;
            } else {
                shadow = objMonkKickShadowKP;
            }
            
            blinkState = KICK_BLINK;
            kickBlinkPrepped = false;
            displace = kickBlinkDisplace;
        } else {
            if (controlScheme == MOUSE) {
                shadow = objMonkShadowMP;
            } else {
                shadow = objMonkShadowKP;
            }
            
            blinkState = BLINK;
            displace = blinkDisplace;
        }
        
        while (totalDisp < displace && !place_meeting(preciseX + direct, preciseY, objBlock)) {
            if (totalDisp % 1 == 0) {
                instance_create(preciseX, preciseY, shadow);
            }
            
            totalDisp++;
            preciseX += direct;
        }
        
        blinkOnCooldown = true;
        alarm[BLINK] = blinkCooldownTime;
    }
}

//shield
if (ducking && canShield && currEnergy >= shieldEnergyCost) {
    shieldState = SHIELD;
    canShield = false;
    alarm[SHIELD] = shieldTime;
    alarm[SHIELD_COOLDOWN] = shieldCooldownTime;
    currEnergy -= shieldEnergyCost;
    
    if (controlScheme == MOUSE) {
        shield = instance_create(preciseX, preciseY, objShieldMP);
    } else {
        shield = instance_create(preciseX, preciseY, objShieldKP);
    }
}

scrMove();

///die
if (hp <= 0) {
    instance_destroy();
}

