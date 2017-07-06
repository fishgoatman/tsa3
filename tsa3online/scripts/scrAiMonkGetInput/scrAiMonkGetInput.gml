/// @description scrAiMonkGetInput
if (heroId.controlScheme == MOUSE) {
    enemyId = opId;
} else {
    enemyId = tpId;
}

if (instance_exists(enemyId)) {
    heroId.state = MOVE;
    var xDisplace = heroId.x - enemyId.x;
    var yDisplace = heroId.y - enemyId.y;
    var duckRange = 50;
    var attackRange = 120;
    var duckXHitbox = 14;
    var duckYHitbox = 18;
    var kickBlinkHeight = 9;
    
    if (xDisplace > 0) {
        heroId.direct = LEFT;
    } else {
        heroId.direct = RIGHT;
    }
    
    if (heroId.currEnergy < heroId.kickBlinkEnergyCost) {
        needToRecharge = true;
    }
    
    if (heroId.currEnergy == heroId.maxEnergy) {
        needToRecharge = false;
    }
    
    show_debug_message(needToRecharge);
    
    if (!needToRecharge) {
        var attack;
        
        if (heroId.controlScheme == MOUSE) {
            attack = objAttackOP;
        } else {
            attack = objAttackTP;
        }
    
        if (heroId.canShield && place_meeting(x, y, attack)) {
            heroId.ducking = true;
        } else if (heroId.attackState == NONE && abs(xDisplace) < duckXHitbox && abs(yDisplace) < duckYHitbox) {
            heroId.ducking = true;
            heroId.attackState = INIT_ATTACK;
        } else if (abs(xDisplace) > heroId.blinkDisplace) {
            heroId.ducking = false;
            heroId.abilityState = INIT_ABILITY;
        } else if (abs(yDisplace) < kickBlinkHeight && abs(xDisplace) < heroId.blinkDisplace) {
            heroId.attackState = INIT_ATTACK;
            heroId.abilityState = INIT_ABILITY;
        }
        
        if (yDisplace > 0 && heroId.jumpState == NONE) {
            if (heroId.currAirJumps < heroId.maxAirJumps) {
                heroId.jumpState = INIT_JUMP;
            } else {
                heroId.abilityState = INIT_ABILITY;
                heroId.jumpState = INIT_JUMP;
            }
        }
    } else {
        heroId.abilityState = NONE;
        heroId.ducking = false;
    }
}
