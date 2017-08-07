/// @description scrKeyboardTakeDamage
hp -= argument0;
var podsToLoseTo = floor(hpBarWidth * hp / maxHp);
var lpl = objKeyboardPlayer.lastPodLost;

if (podsToLoseTo < lpl) {
	for (var i = lpl - 1; i >= podsToLoseTo; i--) {
		if (i < array_length_1d(keyboardHpBar) && keyboardHpBar[i] != -1) {
			keyboardHpBar[i].image_speed = 1;
		}
	}
} else {
	for (var i = lpl; i < podsToLoseTo; i++) {
		if (i < array_length_1d(keyboardHpBar) && keyboardHpBar[i] != -1) {
			keyboardHpBar[i].image_speed = 1;
		}
	}
}

objKeyboardPlayer.lastPodLost = podsToLoseTo;