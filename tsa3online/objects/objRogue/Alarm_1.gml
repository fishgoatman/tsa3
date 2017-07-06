/// @description pre attack
var tempId;

if (controlScheme == MOUSE) {
    if (instance_number(objKnifeTP) < maxKnives) {
        tempId = instance_create(preciseX, preciseY, objKnifeTP);
    }
} else {
    if (instance_number(objKnifeOP) < maxKnives) {
        tempId = instance_create(preciseX, preciseY, objKnifeOP);
    }
}

attackState = POST_ATTACK;
alarm[POST_ATTACK] = attackPostTime;

