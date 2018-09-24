/// @description creation stuff
projId = depth;
depth = 0;

if (instance_exists(projId)) {
	thisNumber = projId.thisNumber;
	myHeroId = heroId[thisNumber];
	time = projId.myHeroId.visualTime;
	image_angle = projId.image_angle;
	image_xscale = projId.image_xscale;
	image_yscale = projId.image_yscale;
	image_index = projId.image_index;
	image_speed = 0;
	currTime = 0;
} else {
	currTime = 0
	time = 0
}