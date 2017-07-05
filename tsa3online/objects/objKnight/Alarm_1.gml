/// @description pre attack
var sword;
var icicle;

if (controlScheme == MOUSE) {
    sword = objSwordMP;
    icicle = objIcicleMP;
} else {
    sword = objSwordKP;
    icicle = objIcicleKP;
}

instance_create(x, y, sword);

if (ice) {
    instance_create(x, y, icicle);
}

attackState = POST_ATTACK;
alarm[POST_ATTACK] = attackPostTime;

