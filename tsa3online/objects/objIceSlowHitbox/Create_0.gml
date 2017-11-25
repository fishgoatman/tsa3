///@desc creation stuff
thisNumber = depth;
depth = 0;
myHeroId = heroId[thisNumber];

if (instance_exists(myHeroId)) {
	dmg = myHeroId.slowDmg;
	dDmg = 0;
	duration = 1;
	forever = false;
	slowTo = myHeroId.slowSlowTo;
	dSlowTo = 0;
	slowDuration = 1;
	slowForever = false;
	time = 1;
	currTime = 0;
}