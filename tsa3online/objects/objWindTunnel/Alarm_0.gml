/// @description destroy
instance_destroy();

if (instance_exists(opId)) {
    opId.logicId.wdCdId.image_speed = 30 / opId.windCooldown;
}

