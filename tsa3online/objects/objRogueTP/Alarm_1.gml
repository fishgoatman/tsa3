/// @description pre attack
if (instance_number(objKnifeTP) < maxKnives) {
    instance_create(preciseX, preciseY, objKnifeTP);
}

attackState = POST_ATTACK;
alarm[POST_ATTACK] = attackPostTime;
oneActivate = true;
currAngle = startAngle;