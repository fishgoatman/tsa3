///@desc scrArcTan
var diffY = argument0;
var diffX = argument1;

if (diffX == 0) {
	if (diffY > 0) {
		return 90;
	} else {
		return 270;
	}
} else if (diffX > 0) {
	if (diffY > 0) {
		return darctan(diffY / diffX);
	} else {
		return 360 + darctan(diffY / diffX);
	}
} else {
	return 180 + darctan(diffY / diffX);
}