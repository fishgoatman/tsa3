/// @description creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];

if (instance_exists(myHeroId)) {
	dmg = myHeroId.shotDmg;
	dDmg = 0;
	duration = 1;
	slowTo = 0.5;
	dSlowTo = 0;
	slowDuration = 60;
	slowForever = false;
	forever = false;
	time = myHeroId.shotHitboxDuration;
	currTime = 0;
	image_xscale = x > myHeroId.preciseX ? 1 : -1;
	instance_create_depth(x, y, thisNumber, objIceShotVisual);
} else {
	instance_destroy();
}