///@desc handle cooldowns
if (instance_exists(myHeroId) && thisInControl[thisNumber]) {
	for (var i = 0; i < cooldownNum; i++) {
		if (myHeroId.object_index == objCasterTP) {
			if (current_time >= myHeroId.cooldownTime[i]) {
				cooldownBar[thisNumber, i].image_index = cooldownFrames - 1
			} else {
				cooldownBar[thisNumber, i].image_index = cooldownFrames - 1 - (myHeroId.cooldownTime[i] - current_time) * cooldownFrames / myHeroId.cooldown[i]
			}
		}
	}
}