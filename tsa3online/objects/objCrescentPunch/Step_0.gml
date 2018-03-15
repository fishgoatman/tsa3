///@desc movement
scrDestructiveProjectileMove();

if (!createdAlready && visualTime % visualFreq == 0) {
	instance_create_depth(preciseX, preciseY, id, objCrescentPunchVisual);
}

if (currTime >= turnTime + postTurnTime) {
	instance_destroy();
} else if (currTime >= turnTime) {
	dx = 0;
	dy = -spd;
	image_angle = 180 + 90 * image_xscale;
} else if (currTime > 0) {
	image_angle -= degreesPerTick * ogDir;
	dx = spd * ogDir * dcos(image_angle);
	dy = spd * ogDir * dsin(image_angle);
}

if (changedDirection) {
	currTime++;
}

visualTime++;