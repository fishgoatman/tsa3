/// @description creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];

if (instance_exists(myHeroId)) {
	dmg = myHeroId.lobDmg;
	dDmg = 0;
	duration = 1;
	forever = false;
	time = myHeroId.lobHitboxDuration;
	currTime = 0;
	image_xscale = myHeroId.image_xscale;
	instance_create_depth(x, y, thisNumber, objFireLobVisual);
} else {
	instance_destroy();
}