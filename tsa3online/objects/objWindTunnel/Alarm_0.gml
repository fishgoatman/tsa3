/// @description destroy
instance_destroy();

if (instance_exists(heroId)) {
	heroId.logicId.wdCdId.image_speed = objWindCooldown.image_number / windCooldown;
}