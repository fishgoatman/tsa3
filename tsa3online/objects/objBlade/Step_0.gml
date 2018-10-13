///@desc move
//special piercing move
///@desc piercing move
var tryX = preciseX;
var tryY = preciseY;
var yDisp = 0;
var xDisp = 0;
var hyp = sqrt(dx * dx + dy * dy);
var tempDx = dx / hyp;
var tempDy = dy / hyp;

while (abs(yDisp) < abs(dy) && abs(xDisp) < abs(dx)) {
	if (abs(yDisp - dy) >= abs(tempDy)) {
		tryY -= tempDy
		yDisp -= tempDy
	} else {
		tryY = preciseY - dy
		yDisp = dy
	}
	
	if (abs(xDisp - dx) >= abs(tempDx)) {
		tryX += tempDx
		xDisp += tempDx
	} else {
		tryX = preciseX + dx
		xDisp = dx
	}
	
	var collidingId = instance_place(tryX, tryY, objPlayer);
	
	if (collidingId != noone && !createdAlready && collidingId.thisNumber != thisNumber) {
		instance_create_depth(tryX, tryY, id, hitbox);
		createdAlready = true;
	}
}

while (abs(yDisp) < abs(dy)) {
    if (abs(yDisp - dy) >= abs(tempDy)) {
		tryY -= tempDy
		yDisp -= tempDy
	} else {
		tryY = preciseY - dy
		yDisp = dy
	}
	
	var collidingId = instance_place(tryX, tryY, objPlayer);
	
	if (collidingId != noone && !createdAlready && collidingId.thisNumber != thisNumber) {
		instance_create_depth(tryX, tryY, id, hitbox);
		createdAlready = true;
	}
}

while (abs(xDisp) < abs(dx)) {
    if (abs(xDisp - dx) >= abs(tempDx)) {
		tryX += tempDx
		xDisp += tempDx
	} else {
		tryX = preciseX + dx
		xDisp = dx
	}
	
	var collidingId = instance_place(tryX, tryY, objPlayer);
	
	if (collidingId != noone && !createdAlready && collidingId.thisNumber != thisNumber) {
		instance_create_depth(tryX, tryY, id, hitbox);
		createdAlready = true;
	}
}

if (abs(xDisp) < abs(dx) || abs(yDisp) < abs(dy)) {
	if (!createdAlready) {
		instance_create_depth(tryX, tryY, id, hitbox)
		createdAlready = true
	}
	
	instance_destroy()
}

preciseX = tryX;
preciseY = tryY;
x = scrRound(preciseX);
y = scrRound(preciseY);

currTime++;

if (currTime == outDuration) {
	createdAlready = false;
} else if (currTime > outDuration) {
	image_angle = point_direction(preciseX, preciseY, myHeroId.preciseX, myHeroId.preciseY);
	dist = point_distance(preciseX, preciseY, myHeroId.preciseX, myHeroId.preciseY);
	
	if (dist < spd) {
		instance_destroy();
	} else {
		dx = spd * dcos(image_angle);
		dy = spd * dsin(image_angle);
	}
} else {
	currDmgTime++;
}