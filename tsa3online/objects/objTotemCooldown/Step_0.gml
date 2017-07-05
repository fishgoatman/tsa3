/// @description cooldown
if (instance_exists(opId)) {
    if (image_index >= image_number - 1) {
        image_speed = 0;
        opId.totemReady = true;
    } else {
        image_speed = 30 / opId.totemCooldown;
    }
} else {
    instance_destroy();
}

