/// @description creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
dmg = myHeroId.slashDmg;
dDmg = 0;
duration = 1;
forever = false;
time = myHeroId.slashHitboxDuration;
currTime = 0;
image_xscale = myHeroId.image_xscale;
instance_create_depth(x, y, thisNumber, objFireSlashVisual);
hitSound = sndFireSlashHit
lastTime = current_time
iTime = current_time