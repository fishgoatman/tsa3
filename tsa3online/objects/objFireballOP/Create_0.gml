/// @description creation stuff
if (instance_exists(opId)) {
    preciseX = x;
    preciseY = y;
    xspd = 10 * overallSpd;
    yspd = 10 * overallSpd;
    visible = true;
    
    if (otherDucking) {
        dx = xspd * opId.image_xscale;
        dy = yspd / 2;
    } else {
        dx = xspd * opId.image_xscale;
        dy = yspd;
    }
    
    ddy = 0.8;
    damp = 0.45;
    bounces = 0;
    explodeBounces = 1;
    idSet = true;
}