/// @description move and direction
if (instance_exists(tpId)) {
    image_xscale = tpId.image_xscale;
    direct = image_xscale;
    x = tpId.x - direct * offset;
    y = tpId.y - offset;
} else {
    instance_destroy();
}

