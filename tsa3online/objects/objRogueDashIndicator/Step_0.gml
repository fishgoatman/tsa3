///@desc move and change angle
scrHeroId();

if (instance_exists(heroId)) {
	x = heroId.preciseX;
	y = heroId.preciseY;
	image_angle = scrArcTan(y - mouse_y, mouse_x - x) - 90;
} else {
	instance_destroy();
}