/// @description scrOtherTakeDamage
if (!immune) {
    hp -= argument0;
    
    for (var i = hp; i < maxHp; i++) {
        if (otherHpBar[i].visible) {
            otherHpBar[i].visible = false;
            instance_create(otherHpBar[i].x, otherHpBar[i].y, objHpPodDeath);
        }
    }
}