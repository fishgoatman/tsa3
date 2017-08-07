/// @description move
var tryX = preciseX;
var tryY = preciseY;
var totalDisp = 0;
var hyp = sqrt(dx * dx + dy * dy);
var tempDx = dx / hyp;
var tempDy = dy / hyp;
    
while (totalDisp < hyp) {
    if (place_meeting(tryX, tryY, objBlock) || tryX < 0 || tryX > room_width || tryY < 0 || tryY > room_height) {
        dx = 0;
		dy = 0;
		alarm[0] = stickTime;
		break;
    }
	
	if (mode == "online") {
	    if (place_meeting(tryX, tryY, objPlayerOP)) {
	        instance_create(tryX, tryY, objBoltHurtboxTP);
	    }
	} else if (mode == "offline") {
		var collidingObject = instance_place(tryX, tryY, objPlayerTP);
	
		if (instance_exists(collidingObject) && collidingObject.controlScheme != controlScheme) {
	        var hbId = instance_create(tryX, tryY, objBoltHurtboxTP);
			hbId.projId = id;
	    }
	}
    
	tryX += tempDx;
	tryY -= tempDy;
    totalDisp++;
}
    
preciseX = tryX;
preciseY = tryY;
x = scrRound(preciseX);
y = scrRound(preciseY);