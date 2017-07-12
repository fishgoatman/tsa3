/// @description scrThisTakeDamage
if (room != rmCharacterSelect) {
	hp -= argument0;
	var podsToLoseTo = hpBarWidth * hp / maxHp;
	var lpl = objOtherPlayer.lastPodLost;

	if (podsToLoseTo < lpl) {
		for (var i = lpl; i > podsToLoseTo; i--) {
			if (i < array_length_1d(otherHpBar) && otherHpBar[i] != -1) {
				otherHpBar[i].image_speed = 1;
			}
		}
	} else {
		for (var i = lpl; i < podsToLoseTo; i++) {
			if (i < array_length_1d(otherHpBar) && otherHpBar[i] != -1) {
				otherHpBar[i].image_speed = 1;
			}
		}
	}

	objOtherPlayer.lastPodLost = podsToLoseTo;
}