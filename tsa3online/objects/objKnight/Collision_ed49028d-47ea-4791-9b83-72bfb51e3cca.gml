/// @description get powerup
if (controlScheme == KEYBOARD) {
    powerup = other.type;
    core.image_index = other.type;
    
    if (other.type == FIRE) {
        moveSpd = fireSpd;
        fire = true;
        alarm[REMOVE_POWERUP] = fireTime;
    } else if (other.type == ICE) {
        ice = true;
        alarm[REMOVE_POWERUP] = iceTime;
    } else {
        air = true;
        maxAirJumps = 999;
        ddy = airDdy;
        alarm[REMOVE_POWERUP] = airTime;
    }
    
    with (other) {
        instance_destroy();
    }
}

