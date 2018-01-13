///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
image_xscale = -myHeroId.image_xscale;
dx = myHeroId.pierceKnifeSpd * image_xscale;
dy = 0;
hitbox = objPiercingKnifeHitbox;
preciseX = x;
preciseY = y;
createdAlready = false;