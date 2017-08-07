/// @description destroy
instance_destroy();

if (instance_exists(heroId)) {
    heroId.logicId.wdCdId.image_speed = 30 / heroId.windCooldown;
}