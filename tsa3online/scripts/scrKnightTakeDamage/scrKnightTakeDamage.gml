/// @description scrKnightTakeDamage
if (shieldHp > 0 && abilityState == INIT_ABILITY && direct * -1 == other.image_xscale) {
    shieldHp--;
    shieldBarId.image_index = shieldHp;
} else {
    scrTakeDamage(argument0);
}
