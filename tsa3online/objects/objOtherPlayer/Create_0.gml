/// @description create the player
hero = otherPlayerHero;
mask_index = object_get_sprite(hero); //necessary because this object checks collisions for input
opId = instance_create(0, 0, otherPlayerHero);

if (room != rmCharacterSelect) {
	var hpPerGap = hpPerLine * hpBarWidth / tpId.maxHp;
	var lastGap = 0;

    for (var i = 0; i < hpBarWidth; i++) {
        if (i - lastGap < hpPerGap) {
			otherHpBar[i] = instance_create(hpBarOffset + i, hpBarOffset, objHpPod);
		} else {
			otherHpBar[i] = -1;
			lastGap = i;
		}
    }
    
    if (hero == objMonkOP) {
        var width = 64;
        var height = 8;
        instance_create(hpBarOffset, hpBarOffset * 2 + objHpPod.sprite_height, objMonkEnergyBarOP);
    }
    
    if (hero == objMageOP) {
        opId.xiaolongId = instance_create(opId.x, opId.y, objXiaolongOP);
    }
	
	lastPodLost = array_length_1d(otherHpBar);
}

if (hero == objKnight) {
    opId.shieldBarId.x = hpBarOffset + tpId.shieldBarId.sprite_width / 2;
    opId.shieldBarId.y = hpBarOffset * 2 + tpId.hpBarId.sprite_height + tpId.shieldBarId.sprite_height / 2;
}

///creation vars
needToRecharge = false;
inputBuffer = buffer_create(1, buffer_fixed, 1);