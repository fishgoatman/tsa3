/// @description create the player
hero = thisPlayerHero;
mask_index = object_get_sprite(hero); //necessary because this object checks collisions for input
var spawnX;
var spawnY;

do {
    spawnX = random_range(room_width * 2 / 3, room_width);
    spawnY = random(room_height);
} until (!place_meeting(spawnX, spawnY, objBlock));

tpId = instance_create(spawnX, spawnY, hero);

if (room != rmCharacterSelect) {
	var hpPerGap = gapInterval * hpBarWidth / tpId.maxHp;

    for (var i = 0; i < hpBarWidth; i++) {
        if (i % hpPerGap != 0) {
			thisHpBar[i] = instance_create(room_width - hpBarOffset - hpBarWidth + i, hpBarOffset, objHpPod);
		} else {
			thisHpBar[i] = -1;
		}
    }
    
    if (hero == objMonkTP) {
        var width = 64;
        var height = 8;
        instance_create(room_width - hpBarOffset - width, hpBarOffset * 2 + objHpPod.sprite_height, objMonkEnergyBarTP);
    }
    
    if (hero == objMageTP) {
        tpId.xiaolongId = instance_create(tpId.x, tpId.y, objXiaolongTP);
    }
}

tpId.controlScheme = MOUSE;
upButton = vk_up;
leftButton = vk_left;
downButton = vk_down;
rightButton = vk_right;

///creation vars
needToRecharge = false;
bufferToSend = buffer_create(256, buffer_fixed, 1);
lastPodLost = array_length_1d(thisHpBar);