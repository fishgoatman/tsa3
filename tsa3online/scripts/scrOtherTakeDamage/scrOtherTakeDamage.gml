/// @description scrOtherTakeDamage
hp -= argument0;
var podsToLoseTo = hpBarWidth * hp / maxHp;

for (var i = objOtherPlayer.lastPodLost; i > podsToLoseTo; i++) {
	if (i < array_length_1d(otherHpBar) && otherHpBar[i] != -1) {
		otherHpBar[i].image_speed = 1;
	}
}

objOtherPlayer.lastPodLost = podsToLoseTo;

//need better fix for hp problem