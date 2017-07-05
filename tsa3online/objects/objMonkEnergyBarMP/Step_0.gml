/// @description change image
if (instance_exists(tpId)) {
    image_index = tpId.currEnergy * (image_number - 1) / maxEnergy;
} else {
    instance_destroy();
}

