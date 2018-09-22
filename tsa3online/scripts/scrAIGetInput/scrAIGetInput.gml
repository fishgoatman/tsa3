///@desc ai input
for (var i = 0; i < numKeys; i++) {
	durationHeld[i] = 0;
	heldBefore[i] = false;
}
	
var rando = irandom(3) + 4;
durationHeld[rando] = 1;
heldBefore[rando] = false;

if (aState == "n") {
	image_xscale = scrGetOtherId().preciseX > preciseX ? 1 : -1
}
	
if (random(1) < 0.1) {
	durationHeld[UP] = 1;
	heldBefore[UP] = false;
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