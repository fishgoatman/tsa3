///@desc handle cooldowns
if (instance_exists(myHeroId) && heroString != "bot" && thisInControl[thisNumber]) {
	for (var i = 0; i < cooldownNum; i++) {
		cooldownBar[thisNumber, i].image_index = (myHeroId.cooldown[i] - myHeroId.cooldownTimer[i]) * cooldownFrames / myHeroId.cooldown[i];
	}
}