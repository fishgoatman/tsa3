/// @description creation stuff
projId = depth;
depth = 0;
thisNumber = projId.thisNumber;
myHeroId = heroId[thisNumber];
dmg = myHeroId.bladeBaseDmg + projId.currDmgTime * myHeroId.bladeDmgIncrease;
dDmg = 0;
duration = 1;
forever = false;
time = 1;
currTime = 0;
image_angle = projId.image_angle;
hitSound = sndBladeHit