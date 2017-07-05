/// @description move and direction
if (instance_exists(heroId)) {
    image_xscale = heroId.image_xscale;
    direct = image_xscale;
    x = heroId.x - direct * offset;
    y = heroId.y - offset;
} else {
    instance_destroy();
}

