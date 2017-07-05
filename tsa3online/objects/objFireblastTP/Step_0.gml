/// @description move
scrMove();

if (place_meeting(x, y, opId) || place_meeting(x + image_xscale, y, objBlock)) {
    instance_destroy();
    instance_create(x, y, objFireballExplosionMP);
}

