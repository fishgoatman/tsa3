/// @description move
var tryX = preciseX;
var tryY = preciseY;
var totalDisp = 0;
var hyp = sqrt(dx * dx + dy * dy);
var tempDx = dx / hyp;
var tempDy = dy / hyp;
var dev = 8;
    
while (totalDisp < hyp) {
    if (place_meeting(tryX, tryY, objPlayerTP) || place_meeting(tryX, tryY, objBlock)) {
        instance_destroy();
		instance_create(tryX, tryY, objFireballExplosionOP);
		break;
    }
    
	tryX += tempDx;
	tryY -= tempDy;
    totalDisp++;
	
	if (random(1) < 0.3) {
		instance_create(tryX + random_range(-dev, dev), tryY + random_range(-dev, dev), objFireScrap);
	}
}
    
preciseX = tryX;
preciseY = tryY;
x = scrRound(preciseX);
y = scrRound(preciseY);