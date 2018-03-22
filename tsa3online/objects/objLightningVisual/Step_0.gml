///@desc destroy
if (currTime >= time) {
	instance_destroy();
}

currTime++;

if (image_index >= image_number - image_speed) {
	image_speed = 0;
}