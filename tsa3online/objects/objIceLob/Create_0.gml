///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
preciseX = x;
preciseY = y;
hitbox = objIceLobHitbox;
angle = myHeroId.lobAngle;
spd = myHeroId.lobSpd;
grav = myHeroId.lobGrav;
factor = myHeroId.lobFactor;
smallLobNumber = myHeroId.smallLobNumber;
image_xscale = myHeroId.image_xscale;
dx = spd * dcos(angle) * image_xscale;
dy = spd * dsin(angle);