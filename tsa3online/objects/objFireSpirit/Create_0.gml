/// @description creation stuff
tpId = tpId;

if (instance_exists(tpId)) {
    var xDiff = -1 * (x - tpId.x);
    var yDiff = y - tpId.y;
    var hyp = sqrt(xDiff * xDiff + yDiff * yDiff);
    spd = 14 * overallSpd;
    dx = spd * xDiff / hyp;
    dy = spd * yDiff / hyp;
    preciseX = x;
    preciseY = y;
}

