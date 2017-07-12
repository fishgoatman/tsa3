/// @description scrThisTakeDamage
hp -= argument0;
var podsToLoseTo = floor(hpBarWidth * hp / maxHp);
var lpl = objThisPlayer.lastPodLost;

if (podsToLoseTo < lpl) {
	for (var i = lpl; i > podsToLoseTo; i--) {
		if (i < array_length_1d(thisHpBar) && thisHpBar[i] != -1) {
			thisHpBar[i].image_speed = 1;
		}
	}
} else {
	for (var i = lpl; i < podsToLoseTo; i++) {
		if (i < array_length_1d(thisHpBar) && thisHpBar[i] != -1) {
			thisHpBar[i].image_speed = 1;
		}
	}
}

objThisPlayer.lastPodLost = podsToLoseTo;