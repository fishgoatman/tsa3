/// @description scrTakeDamage
if (!immune) {
    hp -= argument0;
    immune = true;
    alarm[IMMUNE] = immuneTime;
    var arr;
    
    if (controlScheme == MOUSE) {
        arr = thisHpBar;
    } else {
        arr = keyboardHpBar;
    }
    
    for (var i = hp; i < maxHp; i++) {
        if (arr[i].visible) {
            arr[i].visible = false;
            instance_create(arr[i].x, arr[i].y, objHpPodDeath);
        }
    }
}