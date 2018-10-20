///@desc ai input
var otherHeroId = scrGetOtherId()

if (aState == "n") {
	image_xscale = otherHeroId.preciseX > preciseX ? 1 : -1
}

for (var i = 0; i < numKeys; i++) {
	durationHeld[i] = 0;
	heldBefore[i] = false;
}

if (abs(preciseX - otherHeroId.preciseX) < 50 && abs(preciseY - otherHeroId.preciseY) < 80 && cooldownTimer[2] == 0 && aState != "3") {
	image_xscale = -image_xscale
	durationHeld[THREE] = 1
	heldBefore[THREE] = false
} else {
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

	if (abs(preciseY - otherHeroId.preciseY) < 30 && random(1) < 0.3) {
		durationHeld[ONE] = 1
		heldBefore[ONE] = false
	}

	if (random(100) < 5) {
		durationHeld[TWO] = 1
		heldBefore[TWO] = false
	}

	if (random(100) < 5) {
		durationHeld[FOUR] = 1
		heldBefore[FOUR] = false
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
}