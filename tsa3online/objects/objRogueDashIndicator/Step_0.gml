///@desc move and change angle
if (instance_exists(tpId)) {
	x = tpId.preciseX;
	y = tpId.preciseY;
	image_angle = scrArcTan(y - mouse_y, mouse_x - x) - 90;
}