///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
spd = myHeroId.bladeSpd;
dx = spd * dcos(myHeroId.blinkCurrAngle);
dy = spd * dsin(myHeroId.blinkCurrAngle);
image_angle = myHeroId.blinkCurrAngle;
hitbox = objBladeHitbox;
outDuration = myHeroId.rakeOutDuration;
createdAlready = false;
preciseX = x;
preciseY = y;
currTime = 0;
currDmgTime = 0
lastTime = current_time
iTime = current_time