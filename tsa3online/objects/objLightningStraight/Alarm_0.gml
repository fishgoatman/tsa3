/// @desc destroy
instance_destroy();

if (instance_exists(heroId)) {
    heroId.logicId.ltCdId.image_speed = 30 / heroId.lightningCooldown;
	heroId.logicId.lightningOn = false;
}