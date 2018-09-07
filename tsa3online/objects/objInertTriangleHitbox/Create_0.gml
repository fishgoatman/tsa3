/// @description creation stuff
projId = depth;
depth = 0;
thisNumber = projId.thisNumber;
myHeroId = heroId[thisNumber];
time = myHeroId.lobHitboxDuration;
currTime = 0;
image_xscale = myHeroId.image_xscale;
instance_create_depth(x, y, id, objSmallIceLobVisual);
hitSound = noone;