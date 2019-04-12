///@description scrDestructiveProjectileMove
var tInterval = 1
playerHit = false
groundHit = false
iPreciseX = preciseX
iPreciseY = preciseY
targetTime = current_time

for (var t = lastTime; t < targetTime; t += tInterval) {
	var seconds = (t - iTime) / 1000
	preciseX = ix + dx * seconds + ddx * power(seconds, 2)
	preciseY = iy - dy * seconds - ddy * power(seconds, 2)
	
	if (place_meeting(preciseX, preciseY, objPlayer)) {
		var collidingId = instance_place(preciseX, preciseY, objPlayer)
		
		if (collidingId.thisNumber != thisNumber) {
			instance_create_depth(preciseX, preciseY, id, hitbox)
			instance_destroy()
			playerHit = true
			break
		}
	}
	
	if (place_meeting(preciseX, preciseY, objBlock)) {
		instance_create_depth(preciseX, preciseY, id, hitbox)
		
		if (object_index != objIceLob) {
			instance_destroy()
		}
		
		groundHit = true
		break
	}
}

if (!playerHit && !groundHit) {
	xChange = preciseX - iPreciseX
	yChange = preciseY - iPreciseY
	tChange = targetTime - lastTime
}

x = scrRound(preciseX)
y = scrRound(preciseY)
lastTime = current_time