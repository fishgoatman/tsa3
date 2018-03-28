///@desc move and create drops
if (instance_exists(myHeroId)) {
	image_angle = myHeroId.jetAngle;
	spd = myHeroId.jetCurrSpd;
	dx = spd * dcos(image_angle);
	dy = spd * dsin(image_angle);
	scrGetOutOfBlock();
	scrMove();
	myHeroId.preciseX = preciseX;
	myHeroId.preciseY = preciseY;
	myHeroId.image_angle = image_angle - 90;

	for (var i = 0; i < myHeroId.dropsPerTick; i++) {
		var xPos = x + sprite_height / 2 * dcos(image_angle) + random_range(-myHeroId.dropXVar, myHeroId.dropXVar);
		var yPos = y - sprite_height / 2 * dsin(image_angle) + random_range(-myHeroId.dropYVar, myHeroId.dropYVar);
		instance_create_depth(xPos, yPos, id, objWaterDrop);
	}
} else {
	instance_destroy();
}