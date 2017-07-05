/// @description post attack
attackState = NONE;
spd = moveSpd;

if (controlScheme == MOUSE) {
    with (objSwordMP) {
        instance_destroy();
    }
} else {
    with (objSwordKP) {
        instance_destroy();
    }
}

