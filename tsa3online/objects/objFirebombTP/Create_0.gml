/// @description creation stuff
if (instance_exists(tpId)) {
    preciseX = x;
    preciseY = y;
	dx = 0;
    dy = firebombSpd * overallSpd;
    ddy = firebombDDy;
    damp = 0.45;
    bounces = 0;
    explodeBounces = 0;
    idSet = true;
}