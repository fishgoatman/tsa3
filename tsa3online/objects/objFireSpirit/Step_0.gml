/// @description move
if (instance_exists(heroId)) {
    x += dx;
    y -= dy;
} else {
    instance_destroy();
}

