/// @desc fireball pre attack
if (abilityState == INIT_ABILITY) {
	instance_create(preciseX, preciseY, objFirebombTP);
} else {
	instance_create(preciseX, preciseY, objFireballTP);
}

fireballState = POST_ATTACK;
alarm[FIREBALL_POST] = fireballPostTime;
oneActivate = true;