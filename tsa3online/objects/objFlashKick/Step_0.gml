///@desc wind up and destroy
if (image_index >= image_number - image_speed) {
	image_speed = 0;
	instance_create_depth(x, y, id, objFlashKickHitbox);
	instance_destroy();
}