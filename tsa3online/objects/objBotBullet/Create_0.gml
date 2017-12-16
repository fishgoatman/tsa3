///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
image_xscale = myHeroId.image_xscale;
preciseX = x;
preciseY = y;
angle = point_direction(preciseX, preciseY, myHeroId.targetId.preciseX, myHeroId.targetId.preciseY);
dx = myHeroId.bulletSpd * dcos(angle);
dy = myHeroId.bulletSpd * dsin(angle);
hitbox = objBotBulletHitbox;