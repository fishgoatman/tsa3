/// @description move
scrMove();

if (place_meeting(x + 1 * image_xscale, y, objBlock)) {
    instance_destroy();
}

