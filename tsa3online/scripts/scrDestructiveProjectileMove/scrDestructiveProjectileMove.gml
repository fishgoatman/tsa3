/// @description scrMove
var tryX = preciseX;
var tryY = preciseY;
var yDisp = 0;
var xDisp = 0;
var hyp = sqrt(dx * dx + dy * dy);
var tempDx = dx / hyp;
var tempDy = dy / hyp;
var createdAlready = false;

while (abs(yDisp) < abs(dy) && !place_meeting(tryX, tryY - tempDy, objBlock)) {
    tryY -= tempDy;
    yDisp -= tempDy;
	var collidingId = instance_place(tryX, tryY, objPlayer);
	
	if (collidingId != noone && !createdAlready && collidingId.thisNumber != thisNumber) {
		instance_destroy();
		instance_create_depth(tryX, tryY, thisNumber, hitbox);
		createdAlready = true;
		break;
	}
}

while (abs(xDisp) < abs(dx) && !place_meeting(tryX + tempDx, tryY, objBlock)) {
    tryX += tempDx;
    xDisp += tempDx;
	var collidingId = instance_place(tryX, tryY, objPlayer);
	
	if (collidingId != noone && !createdAlready && collidingId.thisNumber != thisNumber) {
		instance_destroy();
		instance_create_depth(tryX, tryY, thisNumber, hitbox);
		createdAlready = true;
		break;
	}
}

if (abs(xDisp) < abs(dx) || abs(yDisp) < abs(dy)) {
	instance_destroy();
	
	if (!createdAlready) {
		instance_create_depth(tryX, tryY, thisNumber, hitbox);
		createdAlready = true;
	}
}

preciseX = tryX;
preciseY = tryY;
x = scrRound(preciseX);
y = scrRound(preciseY);