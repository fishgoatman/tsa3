/// @description pre attack
var sword;
var icicle;

if (controlScheme == MOUSE) {
    sword = objSwordTP;
    icicle = objIcicleTP;
} else {
    sword = objSwordOP;
    icicle = objIcicleOP;
}

instance_create(x, y, sword);

if (ice) {
    instance_create(x, y, icicle);
}

attackState = POST_ATTACK;
alarm[POST_ATTACK] = attackPostTime;

