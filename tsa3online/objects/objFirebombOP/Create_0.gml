/// @description creation stuff
if (instance_exists(opId)) {
    preciseX = x;
    preciseY = y;
	dx = 0;
    dy = firebombSpd * overallSpd;
    ddy = 1.1;
    damp = 0.45;
    bounces = 0;
    explodeBounces = 0;
    idSet = true;
}