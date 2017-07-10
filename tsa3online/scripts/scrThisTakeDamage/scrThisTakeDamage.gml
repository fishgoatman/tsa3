/// @description scrThisTakeDamage
hp -= argument0;
var podsToLoseTo = hpBarWidth * hp / maxHp;

for (var i = objThisPlayer.lastPodLost; i > podsToLoseTo; i++) {
	if (i < array_length_1d(thisHpBar) && thisHpBar[i] != -1) {
		thisHpBar[i].image_speed = 1;
	}
}

objThisPlayer.lastPodLost = podsToLoseTo;