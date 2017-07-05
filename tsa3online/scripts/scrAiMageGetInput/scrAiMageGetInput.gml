/// @description scrAiMageGetInput
if (heroId.controlScheme == MOUSE) {
    enemyId = opId;
} else {
    enemyId = tpId;
}

if (instance_exists(enemyId)) {
    heroId.state = NONE;
    var xDisplace = heroId.x - enemyId.x;
    var duckRange = 50;
    var attackRange = 120;
    
    if (abs(xDisplace) > attackRange) {
        heroId.state = MOVE;
    }
    
    if (abs(xDisplace) < duckRange) {
        heroId.ducking = true;
    }
    
    if (xDisplace < 0) {
        heroId.direct = RIGHT;
    } else {
        heroId.direct = LEFT;
    }
    
    var yDisplace = heroId.y - enemyId.y;
    
    if (yDisplace > 0) {
        if (heroId.jumpState == NONE && place_meeting(heroId.preciseX, heroId.preciseY + 1, objBlock)) {
            heroId.jumpState = INIT_JUMP;
        } else {
            heroId.abilityState = INIT_ABILITY;
        }
    } else {
        heroId.abilityState = NONE;
    }
    
    if (heroId.attackState == NONE) {
        heroId.attackState = INIT_ATTACK;
    }
}
