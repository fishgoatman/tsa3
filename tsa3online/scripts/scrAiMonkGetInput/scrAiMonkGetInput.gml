/// @description scrAiMonkGetInput
if (tpId.controlScheme == MOUSE) {
    enemyId = opId;
} else {
    enemyId = tpId;
}

if (instance_exists(enemyId)) {
    tpId.state = MOVE;
    var xDisplace = tpId.x - enemyId.x;
    var yDisplace = tpId.y - enemyId.y;
    var duckRange = 50;
    var attackRange = 120;
    var duckXHitbox = 14;
    var duckYHitbox = 18;
    var kickBlinkHeight = 9;
    
    if (xDisplace > 0) {
        tpId.direct = LEFT;
    } else {
        tpId.direct = RIGHT;
    }
    
    if (tpId.currEnergy < tpId.kickBlinkEnergyCost) {
        needToRecharge = true;
    }
    
    if (tpId.currEnergy == tpId.maxEnergy) {
        needToRecharge = false;
    }
    
    show_debug_message(needToRecharge);
    
    if (!needToRecharge) {
        var attack;
        
        if (tpId.controlScheme == MOUSE) {
            attack = objAttackOP;
        } else {
            attack = objAttackTP;
        }
    
        if (tpId.canShield && place_meeting(x, y, attack)) {
            tpId.ducking = true;
        } else if (tpId.attackState == NONE && abs(xDisplace) < duckXHitbox && abs(yDisplace) < duckYHitbox) {
            tpId.ducking = true;
            tpId.attackState = INIT_ATTACK;
        } else if (abs(xDisplace) > tpId.blinkDisplace) {
            tpId.ducking = false;
            tpId.abilityState = INIT_ABILITY;
        } else if (abs(yDisplace) < kickBlinkHeight && abs(xDisplace) < tpId.blinkDisplace) {
            tpId.attackState = INIT_ATTACK;
            tpId.abilityState = INIT_ABILITY;
        }
        
        if (yDisplace > 0 && tpId.jumpState == NONE) {
            if (tpId.currAirJumps < tpId.maxAirJumps) {
                tpId.jumpState = INIT_JUMP;
            } else {
                tpId.abilityState = INIT_ABILITY;
                tpId.jumpState = INIT_JUMP;
            }
        }
    } else {
        tpId.abilityState = NONE;
        tpId.ducking = false;
    }
}
