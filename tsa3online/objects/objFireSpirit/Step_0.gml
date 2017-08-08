/// @description move
if (instance_exists(enemyId)) {
    x += dx;
    y -= dy;
} else {
    instance_destroy();
}

