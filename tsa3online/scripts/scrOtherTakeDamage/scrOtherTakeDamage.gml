/// @description scrOtherTakeDamage
hp -= argument0;

if (argument0 > 0) {
	for (var i = hp; i < maxHp; i++) {
	    if (otherHpBar[i].visible) {
	        otherHpBar[i].visible = false;
	        instance_create(otherHpBar[i].x, otherHpBar[i].y, objHpPodDeath);
	    }
	}
} else {
	for (var i = hp + argument0; i < hp; i++) {
		if (!otherHpBar[i].visible) {
	        otherHpBar[i].visible = true;
	        instance_create(otherHpBar[i].x, otherHpBar[i].y, objHpPodDeath);
	    }
	}
}