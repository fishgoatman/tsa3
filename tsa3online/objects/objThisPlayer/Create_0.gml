/// @description create the player
hero = thisPlayerHero;
mask_index = object_get_sprite(hero); //necessary because this object checks collisions for input
var spawnX;
var spawnY;

do {
    spawnX = random_range(room_width * 2 / 3, room_width);
    spawnY = random(room_height);
} until (!place_meeting(spawnX, spawnY, objBlock));

heroId = instance_create(spawnX, spawnY, hero);
tpId = heroId;
var hpBarOffset = 50;
var hpPodSize = 32;

if (room != rmCharacterSelect) {
    for (var i = 0; i < heroId.hp; i++) {
        thisHpBar[i] = instance_create(room_width - hpBarOffset - hpPodSize * (i + 1), hpBarOffset,
        objHpPod);
    }
    
    if (hero == objMonk) {
        var width = 64;
        var height = 8;
        instance_create(room_width - hpBarOffset - width, hpBarOffset * 2 + objHpPod.sprite_height, objMonkEnergyBarMP);
    }
    
    if (hero == objMageTP) {
        tpId.xiaolongId = instance_create(tpId.x, tpId.y, objXiaolongTP);
    }
}

heroId.controlScheme = MOUSE;
upButton = vk_up;
leftButton = vk_left;
downButton = vk_down;
rightButton = vk_right;

///creation vars
needToRecharge = false;
bufferToSend = buffer_create(64, buffer_fixed, 1);