/// @description take damage
//shield
if (shieldState == NONE && controlScheme == KEYBOARD) {
    scrThisTakeDamage(1);
} else if (shieldState == SHIELD) {
    instance_create(x, y, objShieldReflect);
}

