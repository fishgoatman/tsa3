/// @description creation stuff
projId = depth;
depth = 0;
thisNumber = projId.thisNumber;
myHeroId = heroId[thisNumber];
dmg = myHeroId.blastBaseDmg + projId.currTime * myHeroId.blastDmgIncrease;
dDmg = 0;
duration = 1;
forever = false;
time = myHeroId.blastHitboxDuration;
currTime = 0;
instance_create_depth(x, y, id, objFireShotVisual);