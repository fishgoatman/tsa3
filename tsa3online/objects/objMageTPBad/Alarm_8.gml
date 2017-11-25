/// @desc fireball pre attack
if (true/*abilityState == NONE*/) {
	instance_create(preciseX, preciseY, objFireballTP);
} else {
	for (var i = 0; i < firebombAmount; i++) {
		instance_create(preciseX + random_range(-firebombXVar, firebombXVar), preciseY, objFirebombTP);
	}
}

fireballState = POST_ATTACK;
alarm[FIREBALL_POST] = fireballPostTime;
oneActivate = true;