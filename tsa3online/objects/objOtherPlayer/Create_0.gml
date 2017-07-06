/// @description create the player
hero = otherPlayerHero;
mask_index = object_get_sprite(hero); //necessary because this object checks collisions for input
opId = instance_create(0, 0, otherPlayerHero);
var hpBarOffset = 50;
var hpPodSize = 32;

if (room != rmCharacterSelect) {
    for (var i = 0; i < heroId.hp; i++) {
        keyboardHpBar[i] = instance_create(hpBarOffset + hpPodSize * i, hpBarOffset, objHpPod);
    }
    
    if (hero == objMonk) {
        var width = 64;
        var height = 8;
        instance_create(hpBarOffset, hpBarOffset * 2 + objHpPod.sprite_height, objMonkEnergyBarKP);
    }
    
    if (hero == objMageOP) {
        opId.xiaolongId = instance_create(opId.x, opId.y, objXiaolongOP);
    }
}

if (hero == objKnight) {
    heroId.shieldBarId.x = hpBarOffset + heroId.shieldBarId.sprite_width / 2;
    heroId.shieldBarId.y = hpBarOffset * 2 + heroId.hpBarId.sprite_height + heroId.shieldBarId.sprite_height / 2;
}

///creation vars
needToRecharge = false;
inputBuffer = buffer_create(1, buffer_fixed, 1);