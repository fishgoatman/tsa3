///@desc move and explode
if (place_meeting(preciseX, preciseY + 1, objBlockAndPlatform)) {
	dy = 0
} else {
	dy -= grav
}

scrMove()
scrGetOutOfBlock()
visualId.x = x
visualId.y = y
visualId.image_angle += da

var FOUR = myHeroId.FOUR

if (instance_exists(myHeroId) && myHeroId.durationHeld[FOUR] > 0 && !myHeroId.heldBefore[FOUR]) {
	for (var i = 0; i < triNum; i++) {
		triAngle = i * 360 / triNum
		instance_create_depth(preciseX + triCreateDist * dcos(triAngle), preciseY - triCreateDist * dsin(triAngle), id, objBallTriangle)
	}
	
	instance_destroy()
	
	with (visualId) {
		instance_destroy()
	}
}
