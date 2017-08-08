/// @description cooldown
if (instance_exists(heroId)) {
    if (image_index >= image_number - image_speed) {
        image_speed = 0;
        heroId.windReady = true;
    }
} else {
    instance_destroy();
}

