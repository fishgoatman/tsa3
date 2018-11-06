///@desc ai input
var otherHeroId = scrGetOtherId()

if (aState == "n") {
	image_xscale = otherHeroId.preciseX > preciseX ? 1 : -1
}

for (var i = 0; i < numKeys; i++) {
	durationHeld[i] = 0;
	heldBefore[i] = false;
}

/*if (abs(preciseX - otherHeroId.preciseX) < 50 && abs(preciseY - otherHeroId.preciseY) < 80 && cooldownTimer[2] == 0 && aState != "3") {
	image_xscale = -image_xscale
	durationHeld[THREE] = 1
	heldBefore[THREE] = false
} else {*/
	if (otherHeroId.preciseY < preciseY) {
		if (random(100) < 8) {
			durationHeld[UP] = 1
			heldBefore[UP] = false
		}
	} else {
		if (random(100) < 4) {
			durationHeld[UP] = 1
			heldBefore[UP] = false
		}
	}
	
	if (cooldownTimer[0] == 0 && abs(preciseY - otherHeroId.preciseY) < 30) {
		if (aiTime % 2 == 0) {
			durationHeld[ONE] = 1
			heldBefore[ONE] = false
		}
	}
	
	if (instance_exists(lobId)) {
		if (abs(lobId.preciseX - otherHeroId.preciseX) < 40 && (otherHeroId.preciseY - lobId.preciseY > 40 || lobId.preciseY > otherHeroId.preciseY)) {
			if (aiTime % 2 == 0) {
				durationHeld[TWO] = 1
				heldBefore[TWO] = false
			}
		}
	} else if (cooldownTimer[1] == 0 && aState != "2") {
		if (aiTime % 2 == 0) {
			durationHeld[TWO] = 1
			heldBefore[TWO] = false
		}
	}
	
	if (instance_exists(ballId)) {
		var distance = point_distance(ballId.preciseX, ballId.preciseY, otherHeroId.preciseX, otherHeroId.preciseY)
		var explodeDist = 100
		
		if (distance < explodeDist || distance > explodeDist && abs(ballId.preciseX - otherHeroId.preciseX) < 80) {
			if (aiTime % 2 == 0) {
				durationHeld[FOUR] = 1
				heldBefore[FOUR] = false
			}
		}
	} else if (cooldownTimer[3] == 0 && aState != "4") {
		if (aiTime % 2 == 0) {
			durationHeld[FOUR] = 1
			heldBefore[FOUR] = false
		}
	}
	
	if (abs(preciseX - targetX) < 20) {
		if (scrInArena()) {
			targetX = random(room_width)
		} else if (room == rmMainMenu) {
			targetX = random(room_width / 2)
		}
	}
	
	var dir;
	
	if (preciseX < targetX) {
		dir = RIGHT;
	} else {
		dir = LEFT;
	}
	
	durationHeld[dir] = 1;
	heldBefore[dir] = false;
//}

aiTime++

if (aiTime > 100000) {
	aiTime = 0
}