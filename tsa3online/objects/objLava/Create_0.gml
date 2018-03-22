///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
image_speed = 0;
image_index = irandom(image_number - 1);
image_xscale = myHeroId.image_xscale;
preciseX = x;
preciseY = y;
dx = myHeroId.lavaDx * image_xscale;
dy = myHeroId.lavaDy;
ddy = myHeroId.lavaDdy;
hitbox = objLavaHitbox;
currTime = 0;