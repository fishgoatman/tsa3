///@desc move and angle
if (instance_exists(heroId)) {
	x = heroId.preciseX;
	y = heroId.preciseY;
	image_angle = heroId.mouseAngle - heroId.currAngle / 2;
	visible = true;
} else {
	instance_destroy();
}