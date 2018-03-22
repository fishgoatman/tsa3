///@desc sprite and image and destroy
if (image_index >= image_number - image_speed) {
	image_speed = 0;
	sprite_index = sprTotem;
}

if (currTime >= time) {
	instance_destroy();
}

currTime++;