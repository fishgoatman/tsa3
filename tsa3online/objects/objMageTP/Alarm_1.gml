/// @description pre attack
var tempId = instance_create(preciseX, preciseY, objFireballTP);
mageAttackState = POST_ATTACK;
alarm[POST_ATTACK] = attackPostTime;
