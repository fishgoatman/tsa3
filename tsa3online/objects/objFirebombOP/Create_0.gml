/// @description creation stuff
if (instance_exists(opId)) {
    preciseX = x;
    preciseY = y;
	dx = opId.dx;
    dy = firebombSpd * overallSpd;
    ddy = firebombDDy;
    damp = 0.45;
    bounces = 0;
    explodeBounces = 0;
    idSet = true;
}