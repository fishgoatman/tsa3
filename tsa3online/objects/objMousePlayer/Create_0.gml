/// @description create the player
hero = mousePlayerHero;
mask_index = object_get_sprite(hero); //necessary because this object checks collisions for input
var spawnX;
var spawnY;

do {
    spawnX = random_range(room_width * 2 / 3, room_width);
    spawnY = random(room_height);
} until (!place_meeting(spawnX, spawnY, objBlock));

mpId = instance_create(spawnX, spawnY, hero);

if (hero == objSelectHeroTP) {
	mpId.controlScheme = "mouse";
}

if (room != rmCharacterSelect) {
	var hpPerGap = hpPerLine * hpBarWidth / mpId.maxHp;
	var lastGap = 0;

    for (var i = 0; i < hpBarWidth; i++) {
        if (i - lastGap < hpPerGap) {
			mouseHpBar[i] = instance_create(room_width - hpBarOffset - hpBarWidth + i, hpBarOffset, objHpPod);
		} else {
			mouseHpBar[i] = -1;
			lastGap = i;
		}
    }
    
    if (hero == objMonkTP) {
        var width = 64;
        var height = 8;
        instance_create(room_width - hpBarOffset - width, hpBarOffset * 2 + objHpPod.sprite_height, objMonkEnergyBarTP);
    }
	
	lastPodLost = array_length_1d(mouseHpBar);
}

upButton = vk_up;
leftButton = vk_left;
downButton = vk_down;
rightButton = vk_right;

///creation vars
needToRecharge = false;