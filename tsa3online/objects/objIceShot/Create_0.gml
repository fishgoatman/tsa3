///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
image_xscale = myHeroId.image_xscale;
dx = myHeroId.shotSpd * image_xscale;
dy = 0;
preciseX = x;
preciseY = y;
hitbox = objIceShotHitbox;
currTime = 0;