///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
time = myHeroId.bulletHitboxDuration;
image_xscale = x > myHeroId.preciseX ? 1 : -1;
currTime = 0;