/// @description move
if (!tapped) {
    dir = cos(counter / 20) * (90 - buffer) + 90 + buffer / 2;
    dir += extraAngle;
    counter++;
    dx = currSpd * cos(dir * pi / 180);
    dy = currSpd * sin(dir * pi / 180);
    x += dx + windSpd / 2.5;
    y -= dy;
} else {
    var diffX = targetX - x;
    var diffY = targetY - y;
    var hyp = sqrt(diffX * diffX + diffY * diffY);
    
    if (hyp > tappedSpd) {
        dx = tappedSpd * diffX / hyp;
        dy = -tappedSpd * diffY / hyp;
        dir = arctan2(dy, dx);
        x += dx;
        y -= dy;
    } else {
        x = targetX;
        y = targetY;
        dir = 90;
        dx = 0;
        dy = 0;
        
        if (lastMouseChime) {
            thisChimesReady = true;
        } else if (lastKeyboardChime) {
            otherChimesReady = true;
        }
    }
}

///sprite and image
var shadow = instance_create(x, y, objChimeCarrierShadow);

if (tapped) {
    shadow.sprite_index = sprChimeCarrierShadowTapped;
}

image_angle = 270 - (90 - dir) / imageAngleConst + windSpdConst * windSpd;

///destroy
if (y < 0) {
    instance_destroy();
}