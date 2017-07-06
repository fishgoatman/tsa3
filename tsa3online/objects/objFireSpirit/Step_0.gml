/// @description move
if (instance_exists(tpId)) {
    x += dx;
    y -= dy;
} else {
    instance_destroy();
}

