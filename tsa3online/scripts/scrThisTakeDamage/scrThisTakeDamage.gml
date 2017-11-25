/// @description scrThisTakeDamage
hp -= argument0;
var podsToLoseTo = floor(hpBarWidth * hp / maxHp);
var lpl = playerHandlerObj[thisNumber].lastPodLost;

if (podsToLoseTo < lpl) {
	for (var i = lpl - 1; i >= podsToLoseTo && i >= 0; i--) {
		if (i < array_length_2d(hpBar, thisNumber) && hpBar[thisNumber, i] != -1) {
			hpBar[thisNumber, i].image_speed = 1;
		}
	}
} else {
	for (var i = lpl; i < podsToLoseTo && i >= 0; i++) {
		if (i < array_length_2d(hpBar, thisNumber) && hpBar[thisNumber, i] != -1) {
			hpBar[thisNumber, i].image_speed = 1;
		}
	}
}

playerHandlerObj[thisNumber].lastPodLost = podsToLoseTo;