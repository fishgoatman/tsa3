/// @desc destroy
instance_destroy();

if (instance_exists(heroId)) {
	heroId.logicId.ltCdId.image_speed = objLightningCooldown.image_number / lightningCooldown;
	heroId.logicId.lightningOn = false;
}