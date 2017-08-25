/// @desc creation stuff
dmg = dragonPunchDmg;
slowTime = 0;
stunTime = dragonPunchStunTime;
controlScheme = monkControlScheme;
projId = id;
dot = false;
spd = 15;
var xDiff = mouse_x - x;
var yDiff = y - mouse_y;
var hyp = sqrt(xDiff * xDiff + yDiff * yDiff);
dx = spd * xDiff / hyp;
dy = spd * yDiff / hyp;
preciseX = x;
preciseY = y;
depth = -1;
scrHeroId();
image_angle = heroId.mouseAngle;
alarm[0] = image_number;