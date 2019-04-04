///@desc move and explode
var tInterval = 1
var collideObj
var hitPlayer = false
var hitCorner = false
var xStopped = false
var yStopped = false
targetTime = current_time

if (dy <= 0) {
	collideObj = objBlockAndPlatform
} else {
	collideObj = objBlock
}

for (var t = lastTime; t < targetTime; t += tInterval) {
	var tryX = lastStoppedX + dx * (t - lastXStoppedTime) / 1000
	var tryY = lastStoppedY - ddy * power(tInterval, 2) * power(t - lastYStoppedTime, 2) / power(1000, 2)
	
	if (place_meeting(tryX, preciseY, collideObj)) {
		xStopped = true
		lastStoppedX = preciseX
		lastXStoppedTime = t
	} else if (place_meeting(preciseX, tryY, collideObj)) {
		yStopped = true
		lastStoppedY = preciseY
		lastYStoppedTime = t
	}
	
	if (!xStopped) {
		preciseX = tryX
	}
	
	if (!yStopped) {
		preciseY = tryY
	}
	
	var playerCollideId = instance_place(preciseX, preciseY, objPlayer)
	
	if (playerCollideId != noone && playerCollideId.thisNumber != thisNumber) {
		hitPlayer = true
		break
	}
	
	if (xStopped && yStopped) {
		hitCorner = true
		break
	}
}

x = scrRound(preciseX)
y = scrRound(preciseY)
lastTime = current_time

scrGetOutOfBlock()
visualId.x = x
visualId.y = y
visualId.image_angle += da

var FOUR = myHeroId.FOUR
var fourPressed = instance_exists(myHeroId) && myHeroId.durationHeld[FOUR] > 0 && !myHeroId.heldBefore[FOUR]

if (fourPressed || hitPlayer || hitCorner) {
	for (var i = 0; i < triNum; i++) {
		triAngle = i * 360 / triNum
		var createObj
		
		if (hitPlayer) {
			createObj = objBallInertTriangle
		} else {
			createObj = objBallTriangle
		}
		
		instance_create_depth(preciseX + triCreateDist * dcos(triAngle), preciseY - triCreateDist * dsin(triAngle), id, createObj)
	}
	
	if (hitPlayer || hitCorner) {
		instance_create_depth(preciseX, preciseY, id, objIceBallHitbox)
	}
	
	if (fourPressed) {
		audio_play_sound(sndIceDetonate, 1, false)
	}
	
	with (visualId) {
		instance_destroy()
	}
	
	instance_destroy()
}
