/// @description pre attack
attackState = DURING_ATTACK;
alarm[DURING_ATTACK] = attackDuringTime;
sprite_index = sprMonkDuringAttack;

if (!ducking) {
    var totalDisp = 0;
    
    while (totalDisp < attackDisplace && !place_meeting(preciseX + direct, preciseY, objBlock)) {
        totalDisp++;
        preciseX += direct;
    }
    
    var hurtbox;
    
    if (controlScheme == MOUSE) {
        hurtbox = objAttackHurtboxTP;
    } else {
        hurtbox = objAttackHurtboxOP;
    }
    
    instance_create(preciseX + direct * attackHurtboxXOffset, preciseY - attackHurtboxYOffset, hurtbox);
} else {
    var hurtbox;
    
    if (controlScheme == MOUSE) {
        hurtbox = objAttackDuckHurtboxTP;
    } else {
        hurtbox = objAttackDuckHurtboxOP;
    }
    
    instance_create(preciseX, preciseY, hurtbox);
}

