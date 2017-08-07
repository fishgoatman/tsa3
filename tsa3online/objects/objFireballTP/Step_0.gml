/// @description move
scrMove();

//explode
if (place_meeting(x + image_xscale, y, objBlock)) {
	instance_destroy();
	var hbId = instance_create(x, y, objFireballExplosionTP);
	hbId.image_xscale = image_xscale;
	hbId.projId = id;
}