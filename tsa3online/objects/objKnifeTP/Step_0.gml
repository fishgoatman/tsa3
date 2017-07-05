/// @description move
if (instance_exists(heroId)) {
    if (slowSpd < maxSlowSpd) {
        slowSpd += dSlowSpd;
    }
    
    var xDiff = x - heroId.x;
    var yDiff = y - heroId.y;
    var hyp = sqrt(xDiff * xDiff + yDiff * yDiff);
    
    if (hyp != 0) {
        dx -= slowSpd * xDiff / hyp;
        dy += slowSpd * yDiff / hyp;
    }
    
    var tryX = preciseX;
    var tryY = preciseY;
    var totalDisp = 0;
    var hyp = sqrt(dx * dx + dy * dy);
    var tempDx = dx / hyp;
    var tempDy = dy / hyp;
    
    while (totalDisp < hyp) {
        if (place_meeting(tryX + tempDx, tryY - tempDy, heroId) && alreadyThrown) {
            instance_destroy();
        }
        
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
        
        if (place_meeting(tryX, tryY, objPlayer)) {
            instance_create(tryX, tryY, objKnifeHurtboxMP);
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

