///@desc move and angle
if (instance_exists(tpId)) {
	x = tpId.preciseX;
	y = tpId.preciseY;
	image_angle = tpId.mouseAngle + tpId.currAngle / 2;
	visible = true;
}