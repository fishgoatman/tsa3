///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];
time = 1;
currTime = 0;
dmg = myHeroId.lightningDmg;
dDmg = 0;
duration = 1;
forever = false;
instance_create_depth(x, y, id, objLightningVisual);
hitSound = noone;