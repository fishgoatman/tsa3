/// @description scrMove !!CHANGE TO DOING DX AND DY FIRST THEN DOING THEM SEPARATELY!!
var tryX = preciseX;
var tryY = preciseY;
var yDisp = 0;
var xDisp = 0;
var hyp = sqrt(dx * dx + dy * dy);
var tempDx = dx / hyp;
var tempDy = dy / hyp;

while (abs(yDisp) < abs(dy) && !place_meeting(tryX, tryY - tempDy, objBlock)) {
    tryY -= tempDy;
    yDisp -= tempDy;
}

while (abs(xDisp) < abs(dx) && !place_meeting(tryX + tempDx, tryY, objBlock)) {
    tryX += tempDx;
    xDisp += tempDx;
}

preciseX = tryX;
preciseY = tryY;
x = scrRound(preciseX);
y = scrRound(preciseY);