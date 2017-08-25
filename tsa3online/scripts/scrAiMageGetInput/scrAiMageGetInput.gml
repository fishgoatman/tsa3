/// @description scrAiMageGetInput
var enemyId = mpId;
var thisId = kpId;

if (room == rmCharacterSelect) {
	keyboardPlayerHero = objMageTP;
	thisId.lockedIn = true;
} else {
	if (instance_exists(enemyId)) {
		var fireShotXRange = 80;
		var fireShotYRange = 50;
		var fireballYRange = 20;
		var xDiff = enemyId.x - thisId.x;
		var yDiff = thisId.y - enemyId.y;
		thisId.state = MOVE;
		thisId.fourPressed = true;
		
		if (abs(yDiff) <= fireballYRange) {
			thisId.onePressed = true;
		}
		
		thisId.onePressed = true;

	    if (xDiff > 0) {
			thisId.direct = RIGHT;
		} else {
			thisId.direct = LEFT;
		}
	
		if (abs(xDiff) <= fireShotXRange && abs(yDiff) <= fireShotYRange) {
			thisId.twoPressed = true;
		}
		
		if (thisId.abilityState == INIT_ABILITY) {
			thisId.twoPressed = true;
		}
	
		if (yDiff > 0) {
			if (place_meeting(thisId.preciseX, thisId.preciseY + 1, objBlock)) {
				thisId.upPressed = true;
			} else if (thisId.moveDy <= 0) {
				thisId.abilityState = INIT_ABILITY;
				thisId.upHeld = true;
			}
		} else {
			thisId.abilityState = NONE;
		}
	}
}