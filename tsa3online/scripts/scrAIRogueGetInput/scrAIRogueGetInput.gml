///@desc ai input
var otherHeroId = scrGetOtherId()

if (aState == "n") {
	image_xscale = otherHeroId.preciseX > preciseX ? 1 : -1
}

for (var i = 0; i < numKeys; i++) {
	durationHeld[i] = 0;
	heldBefore[i] = false;
}

var buffer

if (abs(preciseY - otherHeroId.preciseY) < 150 && cooldownTimer[3] == 0) {
	targetX = otherHeroId.preciseX
	buffer = 20
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
	if (!grounded && abs(dy) < 50 / room_speed) {
		if (aiTime % 2 == 0) {
			durationHeld[THREE] = 1
			heldBefore[THREE] = false
		}
	} else {
		if (random(100) < 8) {
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

if (abs(preciseX - otherHeroId.preciseX) < 70 && abs(preciseY - otherHeroId.preciseY) < 40 && cooldownTimer[3] == 0) {
	if (aiTime % 2 == 0) {
		durationHeld[FOUR] = 1
		heldBefore[FOUR] = false
	}
} else if (cooldownTimer[1] == 0) {
	if (abs(preciseX - otherHeroId.preciseX) > 300) {
		if (abs(preciseY - otherHeroId.preciseY) < 30) {
			image_xscale = -image_xscale
	
			if (aiTime % 2 == 0) {
				durationHeld[TWO] = 1
				heldBefore[TWO] = false
			}
		}
	} else {
		if (aiTime % 2 == 0) {
			durationHeld[TWO] = 1
			heldBefore[TWO] = false
		}
	}
} else if (abs(preciseX - otherHeroId.preciseX) > 150 && abs(preciseY - otherHeroId.preciseY) < 100 && cooldownTimer[0] == 0) {
	if (aiTime % 2 == 0) {
		durationHeld[ONE] = 1
		heldBefore[ONE] = false
	}
}

aiTime++

if (aiTime > 100000) {
	aiTime = 0
}