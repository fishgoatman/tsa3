/// @description creation stuff
alreadyThrown = false;
stopped = false;
alarm[0] = 3;
preciseX = x;
preciseY = y;
spd = 55;
var diffX = mouse_x - x;
var diffY = y - mouse_y;

if (diffY > 0) {
	if (diffX > 0) {
		dx = spd;
		dy = 0;
	} else {
		dx = -spd;
		dy = 0;
	}
} else {
	var hyp = sqrt(diffX * diffX + diffY * diffY);
	dx = diffX * spd / hyp;
	dy = diffY * spd / hyp;
}

image_xscale = tpId.direct;
image_angle = tpId.direct * 90 + 180 / pi * arctan(dy / dx);
slowSpd = 1.2 * overallSpd;
dSlowSpd = 0.08 * overallSpd;
maxSlowSpd = 3.5 * overallSpd;