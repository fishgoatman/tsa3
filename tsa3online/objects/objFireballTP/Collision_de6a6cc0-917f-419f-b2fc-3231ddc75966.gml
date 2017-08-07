/// @desc offline explode
if (other.controlScheme != controlScheme) {
	instance_destroy();
	var hbId = instance_create(x, y, objFireballExplosionTP);
	hbId.image_xscale = image_xscale;
	hbId.projId = id;
}