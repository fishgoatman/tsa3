/// @description cooldown
if (instance_exists(opId)) {
    if (image_index >= image_number - 1) {
        image_speed = 0;
        image_index = image_number - 1;
        opId.lightningReady = true;
    } else {
        image_speed = 30 / opId.lightningCooldown;
    }
} else {
    instance_destroy();
}

