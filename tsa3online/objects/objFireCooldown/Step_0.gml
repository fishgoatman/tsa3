/// @description cooldown
if (instance_exists(heroId)) {
    if (image_index >= image_number - 1) {
        image_speed = 0;
        heroId.fireReady = true;
    } else {
        image_speed = 30 / heroId.fireCooldown;
    }
} else {
    instance_destroy();
}

