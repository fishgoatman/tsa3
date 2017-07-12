/// @description move
var tryX = preciseX;
var tryY = preciseY;
var totalDisp = 0;
var hyp = sqrt(dx * dx + dy * dy);
var tempDx = dx / hyp;
var tempDy = dy / hyp;
    
while (totalDisp < hyp) {
    if (place_meeting(tryX, tryY, objBlock)) {
        dx = 0;
		dy = 0;
		break;
    }
	   
    if (place_meeting(tryX, tryY, objPlayerOP)) {
        instance_create(tryX, tryY, objDaggerHurtboxTP);
    }
    
	tryX += tempDx;
	tryY -= tempDy;
    totalDisp++;
}
    
preciseX = tryX;
preciseY = tryY;
x = scrRound(preciseX);
y = scrRound(preciseY);