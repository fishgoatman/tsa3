/// @description cooldown
if (instance_exists(opId)) {
    if (image_index >= image_number - 1) {
        image_speed = 0;
        opId.fireReady = true;
    } else {
        image_speed = 30 / opId.fireCooldown;
    }
} else {
    instance_destroy();
}

