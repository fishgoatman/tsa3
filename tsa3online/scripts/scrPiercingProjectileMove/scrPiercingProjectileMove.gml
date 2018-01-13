///@desc piercing move
var tryX = preciseX;
var tryY = preciseY;
var yDisp = 0;
var xDisp = 0;
var hyp = sqrt(dx * dx + dy * dy);
var tempDx = dx / hyp;
var tempDy = dy / hyp;

while (abs(yDisp) < abs(dy) && !place_meeting(tryX, tryY - tempDy, objBorder)) {
    tryY -= tempDy;
    yDisp -= tempDy;
	var collidingId = instance_place(tryX, tryY, objPlayer);
	
	if (collidingId != noone && !createdAlready && collidingId.thisNumber != thisNumber) {
		instance_create_depth(tryX, tryY, id, hitbox);
		createdAlready = true;
	}
}

while (abs(xDisp) < abs(dx) && !place_meeting(tryX + tempDx, tryY, objBorder)) {
    tryX += tempDx;
    xDisp += tempDx;
	var collidingId = instance_place(tryX, tryY, objPlayer);
	
	if (collidingId != noone && !createdAlready && collidingId.thisNumber != thisNumber) {
		instance_create_depth(tryX, tryY, id, hitbox);
		createdAlready = true;
	}
}

if (abs(xDisp) < abs(dx) || abs(yDisp) < abs(dy)) {
	if (!createdAlready) {
		instance_create_depth(tryX, tryY, id, hitbox);
		createdAlready = true;
	}
	
	instance_destroy();
}

preciseX = tryX;
preciseY = tryY;
x = scrRound(preciseX);
y = scrRound(preciseY);