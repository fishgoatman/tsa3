///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];

if (instance_exists(myHeroId)) {
	time = myHeroId.blastHitboxDuration;
	currTime = 0;
} else {
	instance_destroy();
}