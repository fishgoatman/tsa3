/// @description cooldown
if (instance_exists(heroId)) {
    if (image_index >= image_number - image_speed) {
        image_speed = 0;
        heroId.totemReady = true;
    }
	
	if (image_index == 0) {
		image_speed = image_number / totemCooldown;
    }
} else {
    instance_destroy();
}

