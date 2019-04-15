///@desc move
scrDestructiveProjectileMove()

if (thisInControl[thisNumber]) {
	var TWO = myHeroId.TWO
	var twoPressed = instance_exists(myHeroId) && myHeroId.durationHeld[TWO] > 0 && !myHeroId.heldBefore[TWO]
	
	if (twoPressed && detonateTime == -1) {
		detonateTime = current_time + detonateDelay
		image_index = 1
	}
}

if (detonateTime != -1 && current_time >= detonateTime) {
	detonate = true
}

if (!playerHit && (groundHit || detonate)) {
	for (i = 0; i < smallLobNumber; i++) {
		instance_create_depth(preciseX, preciseY, id, objSmallIceLob)
		audio_play_sound(sndIceLobMiss, 1, false)
	}
	
	if (detonate) {
		instance_create_depth(preciseX, preciseY, id, hitbox)
	}
	
	instance_destroy()
}