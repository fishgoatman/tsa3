/// @description creation stuff
currLightningDx = 1;
currLightningDy = 0;
totemHeight = 20;
lightningWidth = 8;
lightningHeight = 12;
lightningTime = 3;
windHeight = 12;
numTotems = 0;
maxTotems = 3;
summonTotem = false;
summonLightning = false;
summonWind = false;
summonFire = false;
cdHeight = 35;
nearestTotem = -1;
ttCdId = instance_create(hpBarOffset + objHpPod.sprite_width / 2, hpBarOffset
    * 2 + objHpPod.sprite_height + cdHeight / 2, objTotemCooldown);
wdCdId = instance_create(hpBarOffset + objHpPod.sprite_width * 3 / 2, hpBarOffset
    * 2 + objHpPod.sprite_height + cdHeight / 2, objWindCooldown);
ltCdId = instance_create(hpBarOffset + objHpPod.sprite_width * 5 / 2, hpBarOffset
    * 2 + objHpPod.sprite_height + cdHeight / 2, objLightningCooldown);
frCdId = instance_create(hpBarOffset + objHpPod.sprite_width * 7 / 2, hpBarOffset
    * 2 + objHpPod.sprite_height + cdHeight / 2, objFireCooldown);

