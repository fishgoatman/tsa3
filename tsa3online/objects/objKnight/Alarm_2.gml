/// @description post attack
attackState = NONE;
spd = moveSpd;

if (controlScheme == MOUSE) {
    with (objSwordTP) {
        instance_destroy();
    }
} else {
    with (objSwordOP) {
        instance_destroy();
    }
}

