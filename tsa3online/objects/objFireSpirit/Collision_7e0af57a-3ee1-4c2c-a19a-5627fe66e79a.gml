/// @desc offline explode
if (mode == "offline" && other.controlScheme != controlScheme) {
	instance_destroy();
	var hbId = instance_create(x, y, objFireSpiritExplosion);
	hbId.projId = id;
}