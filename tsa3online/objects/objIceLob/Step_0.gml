///@desc move
scrDestructiveProjectileMove()
/*var tInterval = 1
var hit = false
var groundHit = false
var tryX
var tryY
targetTime = current_time

for (var t = lastTime; t < targetTime; t += tInterval) {
	var seconds = (t - iTime) / 1000
	tryX = ix + dx * seconds + ddx * power(seconds, 2)
	tryY = iy - dy * seconds - ddy * power(seconds, 2)
	
	if (place_meeting(tryX, tryY, objPlayer)) {
		var collidingId = instance_place(tryX, tryY, objPlayer)
		
		if (collidingId.thisNumber != thisNumber) {
			hit = true
			break
		}
	} else if (place_meeting(tryX, tryY, objBlock)) {
		hit = true
		groundHit = true
		break
	}
}

preciseX = tryX
preciseY = tryY
x = scrRound(preciseX)
y = scrRound(preciseY)*/

var TWO = myHeroId.TWO
var twoPressed = instance_exists(myHeroId) && myHeroId.durationHeld[TWO] > 0 && !myHeroId.heldBefore[TWO]

if (groundHit || twoPressed) {
	for (i = 0; i < smallLobNumber; i++) {
		instance_create_depth(preciseX, preciseY, id, objSmallIceLob)
		audio_play_sound(sndIceLobMiss, 1, false)
	}
	
	if (twoPressed) {
		instance_create_depth(preciseX, preciseY, id, hitbox)
	}
	
	instance_destroy()
}