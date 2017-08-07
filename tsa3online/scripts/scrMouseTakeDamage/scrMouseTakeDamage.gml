/// @description scrMouseTakeDamage
hp -= argument0;
var podsToLoseTo = floor(hpBarWidth * hp / maxHp);
var lpl = objMousePlayer.lastPodLost;

if (podsToLoseTo < lpl) {
	for (var i = lpl - 1; i >= podsToLoseTo; i--) {
		if (i < array_length_1d(mouseHpBar) && mouseHpBar[i] != -1) {
			mouseHpBar[i].image_speed = 1;
		}
	}
} else {
	for (var i = lpl; i < podsToLoseTo; i++) {
		if (i < array_length_1d(mouseHpBar) && mouseHpBar[i] != -1) {
			mouseHpBar[i].image_speed = 1;
		}
	}
}

objMousePlayer.lastPodLost = podsToLoseTo;