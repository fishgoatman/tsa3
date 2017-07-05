/// @description pre attack
var tempId;

if (controlScheme == MOUSE) {
    if (instance_number(objKnifeMP) < maxKnives) {
        tempId = instance_create(preciseX, preciseY, objKnifeMP);
    }
} else {
    if (instance_number(objKnifeKP) < maxKnives) {
        tempId = instance_create(preciseX, preciseY, objKnifeKP);
    }
}

attackState = POST_ATTACK;
alarm[POST_ATTACK] = attackPostTime;

