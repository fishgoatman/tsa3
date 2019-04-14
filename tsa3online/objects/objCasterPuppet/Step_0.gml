///@desc abilities and dmg
///abilities
preciseX = x;
preciseY = y;

if (aState == "1") {
	if (current_time >= timeToActivate && firstTime) {
		for (var i = 0; i < shotAmount; i++) {
			var xDist
				
			if (i == 1) {
				xDist = shotXMax
			} else {
				xDist = shotXMin
			}
				
			instance_create_depth(abilityPreciseX + xDist * abilityImageXScale, abilityPreciseY - (shotAmount - 1) * shotDist / 2 + i * shotDist, thisNumber, objIceTriShot)
			firstTime = false
		}
	}
} else if (aState == "2") {
	if (current_time >= timeToActivate && firstTime) {
		instance_create_depth(abilityPreciseX, abilityPreciseY, thisNumber, objIceLob)
		audio_play_sound(sndIceLob, 1, false)
		firstTime = false
	}
} else if (aState == "3") {
	if (current_time >= timeToActivate && firstTime) {
		audio_play_sound(sndTeleport, 1, false)
		firstTime = false
	}
} else if (aState == "4") {
	if (current_time >= timeToActivate && firstTime) {
		instance_create_depth(abilityPreciseX, abilityPreciseY, thisNumber, objIceBall)
		firstTime = false
	}
}

///dmg
scrThisTakeDamage(hp - clientGivenHp);