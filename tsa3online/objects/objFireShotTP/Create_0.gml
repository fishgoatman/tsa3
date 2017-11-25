///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
angle = myHeroId.blastAngle;
dx = myHeroId.blastSpd * dcos(angle);
dy = myHeroId.blastSpd * dsin(angle);
preciseX = x;
preciseY = y;
image_angle = angle + 90;
time = myHeroId.blastTime;
currTime = 0;
dmg = myHeroId.blastBaseDmg;
hitbox = objFireShotHitboxTP;