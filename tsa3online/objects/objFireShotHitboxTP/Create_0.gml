/// @description creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];

if (instance_exists(myHeroId)) {
	dmg = myHeroId.blastBaseDmg + myHeroId.timeSinceBlast * myHeroId.blastDmgMultiplier;
	dDmg = 0;
	duration = 1;
	forever = false;
	time = myHeroId.blastHitboxDuration;
	currTime = 0;
	instance_create_depth(x, y, thisNumber, objFireShotVisual);
} else {
	instance_destroy();
}