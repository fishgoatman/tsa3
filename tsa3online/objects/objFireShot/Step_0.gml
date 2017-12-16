///@description move
scrDestructiveProjectileMove();
var offset = 5;

for (var i = 0; i < random_range(-1, 0.7); i++) {
	instance_create(preciseX + -sign(dx) * random_range(0, offset), preciseY + random_range(-offset, offset), objFireScrap);
}

if (instance_exists(myHeroId)) {
	currTime++;

	if (currTime > time && !createdAlready) {
		instance_create_depth(preciseX, preciseY, id, hitbox);
		instance_destroy();
	}
} else {
	instance_destroy();
}