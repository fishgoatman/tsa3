///@desc create new icebergs
if (currTime == timeBetween) {
	instance_create_depth(x + image_xscale * widthDiff, y - heightDiff, thisNumber, objIcebergVisual);
}

if (currTime >= time || x < -sprite_width / 2 || x > room_width + sprite_width / 2) {
	instance_destroy();
}

instance_create_depth(x, y, thisNumber, objIcebergSlowHitbox);
currTime++;