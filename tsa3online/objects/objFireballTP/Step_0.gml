/// @description move
scrMove();

if (place_meeting(x, y, objPlayerOP) || place_meeting(x + image_xscale, y, objBlock)) {
    instance_destroy();
    var hbId = instance_create(x, y, objFireballExplosionTP);
	hbId.projId = id;
}