/// @description scrAiMageGetInput
if (tpId.controlScheme == MOUSE) {
    enemyId = opId;
} else {
    enemyId = tpId;
}

if (instance_exists(enemyId)) {
    tpId.state = NONE;
    var xDisplace = tpId.x - enemyId.x;
    var duckRange = 50;
    var attackRange = 120;
    
    if (abs(xDisplace) > attackRange) {
        tpId.state = MOVE;
    }
    
    if (abs(xDisplace) < duckRange) {
        tpId.ducking = true;
    }
    
    if (xDisplace < 0) {
        tpId.direct = RIGHT;
    } else {
        tpId.direct = LEFT;
    }
    
    var yDisplace = tpId.y - enemyId.y;
    
    if (yDisplace > 0) {
        if (tpId.jumpState == NONE && place_meeting(tpId.preciseX, tpId.preciseY + 1, objBlock)) {
            tpId.jumpState = INIT_JUMP;
        } else {
            tpId.abilityState = INIT_ABILITY;
        }
    } else {
        tpId.abilityState = NONE;
    }
    
    if (tpId.attackState == NONE) {
        tpId.attackState = INIT_ATTACK;
    }
}
