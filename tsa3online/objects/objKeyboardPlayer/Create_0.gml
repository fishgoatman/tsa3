/// @description create the player
hero = keyboardPlayerHero;
mask_index = object_get_sprite(hero); //necessary because this object checks collisions for input
var spawnX;
var spawnY;

do {
    spawnX = random_range(0, room_width * 1/3);
    spawnY = random(room_height);
} until (!place_meeting(spawnX, spawnY, objBlock));

kpId = instance_create(spawnX, spawnY, hero);

if (hero == objSelectHeroTP) {
	kpId.controlScheme = "keyboard";
}

if (room != rmCharacterSelect) {
	var hpPerGap = hpPerLine * hpBarWidth / kpId.maxHp;
	var lastGap = 0;

    for (var i = 0; i < hpBarWidth; i++) {
        if (i - lastGap < hpPerGap) {
			keyboardHpBar[i] = instance_create(hpBarOffset + i, hpBarOffset, objHpPod);
		} else {
			keyboardHpBar[i] = -1;
			lastGap = i;
		}
    }
    
    if (hero == objMonkTP) {
        var width = 64;
        var height = 8;
        instance_create(room_width - hpBarOffset - width, hpBarOffset * 2 + objHpPod.sprite_height, objMonkEnergyBarTP);
    }
	
	lastPodLost = array_length_1d(keyboardHpBar);
}

upButton = vk_up;
leftButton = vk_left;
downButton = vk_down;
rightButton = vk_right;

///creation vars
needToRecharge = false;