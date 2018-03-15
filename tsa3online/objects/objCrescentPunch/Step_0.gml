///@desc movement
if (currTime >= turnTime + postTurnTime) {
	instance_destroy();
} else if (currTime >= turnTime) {
	dy = -spd;
} else if (currTime > 0) {
	image_angle -= degreesPerTick * ogDir;
	dx = spd * ogDir * dcos(image_angle);
	dy = spd * ogDir * dsin(image_angle);
}

if (changedDirection) {
	currTime++;
}

scrDestructiveProjectileMove();

if (!createdAlready && currTime % visualFreq == 0) {
	instance_create_depth(preciseX, preciseY, id, objCrescentPunchVisual);
}