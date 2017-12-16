/// @description creation stuff
projId = depth;
depth = 0;
thisNumber = projId.thisNumber;
myHeroId = heroId[thisNumber];
dmg = myHeroId.shotDmg;
dDmg = 0;
duration = 1;
forever = false;
slowTo = myHeroId.shotSlowTo;
dSlowTo = 0;
slowDuration = myHeroId.shotSlowDuration;
slowForever = false;
time = myHeroId.shotHitboxDuration;
currTime = 0;
image_xscale = x > myHeroId.preciseX ? 1 : -1;
instance_create_depth(x, y, id, objIceShotVisual);