///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
angle = myHeroId.blastAngle;
dx = myHeroId.blastSpd * dcos(angle);
dy = myHeroId.blastSpd * dsin(angle);
preciseX = x;
preciseY = y;
hitbox = objFireShotHitbox;
currTime = 0;
time = myHeroId.blastTime;