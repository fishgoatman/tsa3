/// @description random powerup
var shrine;

type = floor(random(3)) + 1;
core.image_index = type;

if (type == FIRE) {
    moveSpd = fireSpd;
    fire = true;
    alarm[REMOVE_POWERUP] = fireTime;
} else if (type == ICE) {
    ice = true;
    alarm[REMOVE_POWERUP] = iceTime;
} else {
    air = true;
    maxAirJumps = 999;
    ddy = airDdy;
    alarm[REMOVE_POWERUP] = airTime;
}

alarm[SHRINE] = shrineTime;

