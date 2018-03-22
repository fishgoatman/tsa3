///@desc move and create drops
image_angle = myHeroId.jetAngle;
spd = myHeroId.jetCurrSpd;
dx = spd * dcos(image_angle);
dy = spd * dsin(image_angle);
scrMove();

for (var i = 0; i < myHeroId.dropsPerTick; i++) {
	var xPos = x + random_range(-myHeroId.dropXVar, myHeroId.dropXVar);
	var yPos = y + random_range(-myHeroId.dropYVar, myHeroId.dropYVar);
	instance_create_depth(xPos, yPos, id, objWaterDrop);
}