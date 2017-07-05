/// @description cooldown
if (instance_exists(opId)) {
    if (image_index >= image_number - 1) {
        image_speed = 0;
        opId.windReady = true;
    }
} else {
    instance_destroy();
}

