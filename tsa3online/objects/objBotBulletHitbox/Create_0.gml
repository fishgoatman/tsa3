/// @description creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
dmg = myHeroId.bulletDmg;
dDmg = 0;
duration = 1;
forever = false;
time = myHeroId.bulletHitboxDuration;
currTime = 0;
image_xscale = x > myHeroId.preciseX ? 1 : -1;
instance_create_depth(x, y, thisNumber, objBotBulletVisual);