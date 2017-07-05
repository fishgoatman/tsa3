/// @description pre attack
var tempId = instance_create(preciseX, preciseY, objFireballTP);
attackState = POST_ATTACK;
alarm[POST_ATTACK] = attackPostTime;
oneActivate = true;