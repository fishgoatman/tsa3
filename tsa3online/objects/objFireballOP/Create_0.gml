/// @description creation stuff
tpId = opId;

if (instance_exists(tpId)) {
    preciseX = x;
    preciseY = y;
    xspd = 10 * overallSpd;
    yspd = 10 * overallSpd;
    visible = true;
    
    if (tpId.ducking) {
        dx = xspd * tpId.direct;
        dy = yspd / 2;
    } else {
        dx = xspd * tpId.direct;
        dy = yspd;
    }
    
    ddy = 0.8;
    damp = 0.45;
    bounces = 0;
    explodeBounces = 1;
    idSet = true;
}

