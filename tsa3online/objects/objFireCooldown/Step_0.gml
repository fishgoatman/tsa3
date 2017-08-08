/// @description cooldown
if (instance_exists(heroId)) {
    if (image_index >= image_number - image_speed) {
        image_speed = 0;
        heroId.fireReady = true;
    }
	
	if (image_index == 0) {
		image_speed = image_number / fireCooldown;
    }
} else {
    instance_destroy();
}

