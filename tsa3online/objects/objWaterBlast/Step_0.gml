///@desc create hitbox and visual
instance_create_depth(x, y, thisNumber, objWaterBlastHitbox);

if (currTime >= time) {
	instance_destroy();
} else {
	currTime++;

	//visual
	for (var i = 0; i < myHeroId.blastDropsPerTick; i++) {
		var angle = random(360);
		var radius = sprite_width / 2 * sqrt(sqrt(random(0.9) + 0.1));
		var xOff = radius * dcos(angle);
		var yOff = -radius * dsin(angle);
		dx = 0;
		dy = 0;
		instance_create_depth(x + xOff, y + yOff, id, objWaterDrop);
	}
}