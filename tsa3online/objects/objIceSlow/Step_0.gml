///@desc create hitbox
instance_create_depth(x, y, thisNumber, objIceSlowHitbox);

if (currTime >= time) {
	instance_destroy();
}

currTime++;