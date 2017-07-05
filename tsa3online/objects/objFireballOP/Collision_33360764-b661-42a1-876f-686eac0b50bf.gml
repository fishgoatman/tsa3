/// @description explode
if (other.controlScheme == MOUSE) {
    instance_destroy();
    var explosion = instance_create(x, y, objFireballExplosionKP);
    explosion.image_xscale = image_xscale;
}

