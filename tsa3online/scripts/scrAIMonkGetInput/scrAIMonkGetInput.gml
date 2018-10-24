///@desc ai input
var otherHeroId = scrGetOtherId()

if (aState == "n") {
	image_xscale = otherHeroId.preciseX > preciseX ? 1 : -1
}

for (var i = 0; i < numKeys; i++) {
	durationHeld[i] = 0;
	heldBefore[i] = false;
}

var buffer = 80

if (preciseX < otherHeroId.preciseX - buffer) {
	dir = RIGHT
} else if (preciseX > otherHeroId.preciseX + buffer) {
	dir = LEFT
}
	
durationHeld[dir] = 1
heldBefore[dir] = false

if (otherHeroId.preciseY < preciseY) {
	if (random(100) < 10) {
		durationHeld[UP] = 1
		heldBefore[UP] = false
	}
} else {
	if (random(100) < 2) {
		durationHeld[UP] = 1
		heldBefore[UP] = false
	}
}

if (abs(preciseY - otherHeroId.preciseY) < 30 && abs(preciseX - otherHeroId.preciseX) < 190) {
	if (aiTime % 2 == 0) {
		durationHeld[TWO] = 1
		heldBefore[TWO] = false
	}
}

aiTime++

if (aiTime > 100000) {
	aiTime = 0
}