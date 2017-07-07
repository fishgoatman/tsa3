/// @description scrThisTakeDamage
if (!immune) {
    hp -= argument0;
    immune = true;
    alarm[IMMUNE] = immuneTime;
    
    for (var i = hp; i < maxHp; i++) {
        if (thisHpBar[i].visible) {
            thisHpBar[i].visible = false;
            instance_create(thisHpBar[i].x, thisHpBar[i].y, objHpPodDeath);
        }
    }
}