/// @description change image
if (instance_exists(opId)) {
    image_index = opId.currEnergy * (image_number - 1) / maxEnergy;
} else {
    instance_destroy();
}

