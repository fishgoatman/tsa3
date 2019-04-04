///@desc ai input
var otherHeroId = scrGetOtherId()
var yDist = otherHeroId.preciseY - preciseY
var xDist = otherHeroId.preciseX - preciseX

if (aState == "n") {
	image_xscale = otherHeroId.preciseX > preciseX ? 1 : -1
}

for (var i = 0; i < numKeys; i++) {
	durationHeld[i] = 0;
	heldBefore[i] = false;
}

var buffer

if (abs(yDist) < 150) {
	targetX = otherHeroId.preciseX
	buffer = 60
} else {
	if (abs(preciseX - targetX) < 20) {
		if (scrInArena()) {
			targetX = random(room_width)
		} else if (room == rmMainMenu) {
			targetX = random(room_width / 2)
		}
	}
	
	buffer = 20
}


if (preciseX < targetX - buffer) {
	durationHeld[RIGHT] = 1
	heldBefore[RIGHT] = false
} else if (preciseX > targetX + buffer) {
	durationHeld[LEFT] = 1
	heldBefore[LEFT] = false
}

if (otherHeroId.preciseY < preciseY) {
	if (aiTime % 2 == 0) {
		durationHeld[THREE] = 1
		heldBefore[THREE] = false
	}
	
	if (currAirJumps == -1) {
		if (aiTime % 2 == 0) {
			durationHeld[UP] = 1
			heldBefore[UP] = false
		}
	} else {
		if (random(100) < 10) {
			durationHeld[UP] = 1
			heldBefore[UP] = false
		}
	}
} else {
	if (random(100) < 2) {
		durationHeld[UP] = 1
		heldBefore[UP] = false
	}
}

if (cooldownTimer[3] == 0 && abs(targetX - x) > buffer + 200) {
	if (aiTime % 2 == 0) {
		durationHeld[FOUR] = 1
		heldBefore[FOUR] = false
	}
}

if (abs(yDist) < 30 && abs(xDist) < 190 && cooldownTimer[1] == 0) {
	if (aiTime % 2 == 0) {
		durationHeld[TWO] = 1
		heldBefore[TWO] = false
	}
} else if (abs(yDist) < 80 && abs(xDist) < 80 && cooldownTimer[0] == 0) {
	if (aiTime % 2 == 0) {
		durationHeld[ONE] = 1
		heldBefore[ONE] = false
	}
}

aiTime++

if (aiTime > 100000) {
	aiTime = 0
}