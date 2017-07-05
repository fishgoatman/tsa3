/// @description creation stuff
alreadyThrown = false;
stopped = false;
alarm[0] = 3;
preciseX = x;
preciseY = y;
xspd = 45 * overallSpd;
yspd = -45 * overallSpd;

if (heroId.ducking) {
    dy = 0;
    dx = xspd * heroId.direct;
} else {
    dy = yspd * sqrt(2) / 2;
    dx = xspd * heroId.direct * sqrt(2) / 2;
}

image_xscale = heroId.direct;
image_angle = heroId.direct * 90 + 180 / pi * arctan(dy / dx);
slowSpd = 1.2 * overallSpd;
dSlowSpd = 0.07 * overallSpd;
maxSlowSpd = 3.4 * overallSpd;
