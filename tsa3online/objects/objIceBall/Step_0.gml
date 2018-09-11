///@desc move and explode
if (place_meeting(preciseX, preciseY + 1, objBlockAndPlatform)) {
	dy = 0
} else {
	dy -= grav
}

/// @description scrMove !!CHANGE TO DOING DX AND DY FIRST THEN DOING THEM SEPARATELY!!
var tryX = preciseX
var tryY = preciseY
var yDisp = 0
var xDisp = 0
var hyp = sqrt(dx * dx + dy * dy)
var tempDx = dx / hyp
var tempDy = dy / hyp
var collideObj
var hitPlayer = false

if (dy <= 0) {
	collideObj = objBlockAndPlatform
} else {
	collideObj = objBlock
}

while (!hitPlayer && abs(yDisp) < abs(dy) && abs(xDisp) < abs(dx) && !place_meeting(tryX + tempDx, tryY - tempDy, collideObj)) {
	tryY -= tempDy
	tryX += tempDx
    yDisp -= tempDy
    xDisp += tempDx
	var collidingId = instance_place(tryX, tryY, objPlayer)
	
	if (collidingId != noone && collidingId.thisNumber != thisNumber) {
		hitPlayer = true
	}
}

while (!hitPlayer && abs(yDisp) < abs(dy) && !place_meeting(tryX, tryY - tempDy, collideObj)) {
    tryY -= tempDy
    yDisp -= tempDy
	var collidingId = instance_place(tryX, tryY, objPlayer)
	
	if (collidingId != noone && collidingId.thisNumber != thisNumber) {
		hitPlayer = true
	}
}

while (!hitPlayer && abs(xDisp) < abs(dx) && !place_meeting(tryX + tempDx, tryY, collideObj)) {
    tryX += tempDx
    xDisp += tempDx
	var collidingId = instance_place(tryX, tryY, objPlayer)
	
	if (collidingId != noone && collidingId.thisNumber != thisNumber) {
		hitPlayer = true
	}
}

preciseX = tryX
preciseY = tryY
x = scrRound(preciseX)
y = scrRound(preciseY)

scrGetOutOfBlock()
visualId.x = x
visualId.y = y
visualId.image_angle += da

var FOUR = myHeroId.FOUR
var fourPressed = instance_exists(myHeroId) && myHeroId.durationHeld[FOUR] > 0 && !myHeroId.heldBefore[FOUR]
var hitCorner = abs(xDisp) < abs(dx) && (abs(yDisp) < abs(dy) || dy == 0)

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
