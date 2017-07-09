/// @description move
if (newX != -1 || newY != -1) {
	dx = newX - preciseX;
	dy = preciseY - newY;
	var tryX = preciseX;
	var tryY = preciseY;
	var totalDisp = 0;
	var hyp = sqrt(dx * dx + dy * dy);
	var tempDx = dx / hyp;
	var tempDy = dy / hyp;
    
	while (totalDisp < hyp) {
		if (!place_meeting(tryX + tempDx, tryY, objBlock)) {
		    tryX += tempDx;
		} else {
		    dx = 0;
		}
        
		if (!place_meeting(tryX, tryY - tempDy, objBlock)) {
		    tryY -= tempDy;
		} else {
		    dy = 0;
		}
        
		if (place_meeting(tryX, tryY, objPlayerTP)) {
		    instance_create(tryX, tryY, objKnifeHurtboxOP);
		}
        
		totalDisp++;
	}
    
	preciseX = tryX;
	preciseY = tryY;
	x = scrRound(preciseX);
	y = scrRound(preciseY);
} else {
	instance_destroy();
}