/// @description creation stuff
totemBuildTime = 0.4 * room_speed / overallSpd;
image_speed = 30 / totemBuildTime;
dx = 0;
dy = 0;
ddy = 1.8;
preciseX = x;
preciseY = y;
aura = -1;
controlScheme = shamanControlScheme;
scrHeroId();
durationBar = instance_create(x, y, objTotemDurationBar);
type = "none";
created = true;