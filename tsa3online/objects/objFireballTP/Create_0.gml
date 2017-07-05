/// @description creation stuff
heroId = tpId;

if (instance_exists(heroId)) {
    preciseX = x;
    preciseY = y;
    xspd = 10 * overallSpd;
    yspd = 10 * overallSpd;
    visible = true;
    
    if (heroId.ducking) {
        dx = xspd * heroId.direct;
        dy = yspd / 2;
    } else {
        dx = xspd * heroId.direct;
        dy = yspd;
    }
    
    ddy = 1.1;
    damp = 0.45;
    bounces = 0;
    explodeBounces = 1;
    idSet = true;
}

