///@desc ai input
for (var i = 0; i < numKeys; i++) {
	durationHeld[i] = 0;
	heldBefore[i] = false;
}
	
var rando = irandom(3) + 4;
durationHeld[rando] = 1;
heldBefore[rando] = false;

//if (cooldownTimer[rando - 4] == 0) {
	image_xscale = sign(scrGetOtherId().preciseX - preciseX)
//}
	
if (random(1) < 0.1) {
	durationHeld[UP] = 1;
	heldBefore[UP] = false;
}
	
if (abs(preciseX - targetX) < 20) {
	targetX = random(room_width);
}
	
var dir;
	
if (preciseX < targetX) {
	dir = RIGHT;
} else {
	dir = LEFT;
}
	
durationHeld[dir] = 1;
heldBefore[dir] = false;