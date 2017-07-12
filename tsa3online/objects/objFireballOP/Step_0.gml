/// @description move
scrMove();

if (place_meeting(x, y, objPlayerTP) || place_meeting(x + image_xscale, y, objBlock)) {
    instance_destroy();
    instance_create(x, y, objFireballExplosionOP);
}