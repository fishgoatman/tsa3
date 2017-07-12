/// @description move
scrMove();

if (place_meeting(x, y, objPlayerTP) || place_meeting(x + image_xscale, y, objBlock)) {
    instance_destroy();
    var hbId = instance_create(x, y, objFireballExplosionOP);
	hbId.projId = id;
}