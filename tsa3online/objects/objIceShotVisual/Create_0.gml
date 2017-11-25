///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];

if (instance_exists(myHeroId)) {
	time = myHeroId.shotHitboxDuration;
	image_xscale = x > myHeroId.preciseX ? 1 : -1;
	currTime = 0;
} else {
	instance_destroy();
}