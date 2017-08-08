/// @desc fireball pre attack
if (abilityState == INIT_ABILITY) {
	for (var i = 0; i < firebombAmount; i++) {
		instance_create(preciseX + random_range(-firebombXVar, firebombXVar), preciseY, objFirebombTP);
	}
} else {
	instance_create(preciseX, preciseY, objFireballTP);
}

fireballState = POST_ATTACK;
alarm[FIREBALL_POST] = fireballPostTime;
oneActivate = true;