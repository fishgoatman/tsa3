/// @description creation stuff
if (instance_exists(tpId)) {
    preciseX = x;
    preciseY = y;
	dx = 0;
    dy = 10 * overallSpd;
    ddy = 1.1;
    damp = 0.45;
    bounces = 0;
    explodeBounces = 0;
    idSet = true;
}