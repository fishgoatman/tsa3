/// @description cooldown
if (instance_exists(heroId)) {
    if (image_index >= image_number - 1) {
        image_speed = 0;
        heroId.totemReady = true;
    } else {
        image_speed = 30 / heroId.totemCooldown;
    }
} else {
    instance_destroy();
}

