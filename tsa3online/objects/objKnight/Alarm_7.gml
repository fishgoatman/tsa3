/// @description regain shield hp
if (shieldHp < maxShieldHp) {
    shieldHp++;
}

alarm[SHIELD] = shieldRegainTime;

