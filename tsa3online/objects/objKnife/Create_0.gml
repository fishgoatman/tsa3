///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
dx = myHeroId.fanSpd * dcos(myHeroId.fanCurrAngle);
dy = myHeroId.fanSpd * dsin(myHeroId.fanCurrAngle);
image_angle = myHeroId.fanCurrAngle;
hitbox = objKnifeHitbox;
preciseX = x;
preciseY = y;
currTime = 0
lastTime = current_time
iTime = current_time