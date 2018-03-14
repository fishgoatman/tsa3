///@desc movement
if (currTime >= preTurnTime + turnTime + postTurnTime) {
	instance_destroy();
} else if (currTime >= preTurnTime + turnTime) {
	dy = -spd;
} else if (currTime >= preTurnTime) {
	image_angle -= degreesPerTick * ogDir;
	dx = spd * ogDir * dcos(image_angle);
	dy = spd * ogDir * dsin(image_angle);
}

currTime++;
scrDestructiveProjectileMove();

if (!createdAlready && currTime % visualFreq == 0) {
	instance_create_depth(preciseX, preciseY, id, objCrescentPunchVisual);
}