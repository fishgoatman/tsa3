/// @description explode
if (other.controlScheme == MOUSE) {
    instance_destroy();
    var explosion = instance_create(x, y, objFireballExplosionOP);
    explosion.image_xscale = image_xscale;
}

