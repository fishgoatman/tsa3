/// @description creation stuff
alreadyThrown = false;
stopped = false;
alarm[0] = 3;
preciseX = x;
preciseY = y;
spd = 55;
var diffX = mouse_x - x;
var diffY = y - mouse_y;
var angle = scrArcTan(diffY, diffX);
var rightBorder = 270 + tpId.currAngle / 2;
var leftBorder = 270 - tpId.currAngle / 2;

if (angle > rightBorder || angle < leftBorder) {
	if (diffX > 0) {
		dx = spd * dcos(rightBorder);
		dy = spd * dsin(rightBorder);
	} else {
		dx = spd * dcos(leftBorder);
		dy = spd * dsin(leftBorder);
	}
} else {
	var hyp = sqrt(diffX * diffX + diffY * diffY);
	dx = spd * diffX / hyp;
	dy = spd * diffY / hyp;
}

image_xscale = tpId.direct;
image_angle = tpId.direct * 90 + 180 / pi * arctan(dy / dx);
slowSpd = 1.2 * overallSpd;
dSlowSpd = 0.08 * overallSpd;
maxSlowSpd = 3.5 * overallSpd;