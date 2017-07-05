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
        hurtbox = objAttackHurtboxMP;
    } else {
        hurtbox = objAttackHurtboxKP;
    }
    
    instance_create(preciseX + direct * attackHurtboxXOffset, preciseY - attackHurtboxYOffset, hurtbox);
} else {
    var hurtbox;
    
    if (controlScheme == MOUSE) {
        hurtbox = objAttackDuckHurtboxMP;
    } else {
        hurtbox = objAttackDuckHurtboxKP;
    }
    
    instance_create(preciseX, preciseY, hurtbox);
}

