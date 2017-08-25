///@desc scrAiRogueGetInput
var enemyId = kpId;
var thisId = mpId;

if (room == rmCharacterSelect) {
	mousePlayerHero = objRogueTP;
	thisId.lockedIn = true;
} else {
	if (instance_exists(enemyId)) {
		var diffX = enemyId.x - thisId.x;
		var diffY = thisId.y - enemyId.y;
		var dist = sqrt(diffX * diffX + diffY * diffY);
		var dashDist = 70;
		var runDist = 150;
		var dev = 3;
		thisId.state = MOVE;
		thisId.tMouseX = enemyId.x + random_range(-dev, dev);
		thisId.tMouseY = enemyId.y + random_range(-dev, dev);
		
		if (random(1) < 0.03 && abs(thisId.moveDy) < abs(thisId.jumpDy) / 2) {
			thisId.upPressed = true;
		}

		if (thisId.currAngle == thisId.endAngle) {
			thisId.tMouseX = enemyId.x + random_range(-dev, dev);
			thisId.tMouseY = enemyId.y + random_range(-dev, dev);
			thisId.oneReleased = true;
		} else {
			if (!thisId.onePressed) {
				thisId.onePressed = true;
			}
		}
		
		if (dist < runDist) {
			thisId.randoMoveTime = 0;
			thisId.direct = -sign(diffX);
			
			if (diffY < 0) {
				if (thisId.moveDy == 0 && thisId.currAirJumps < thisId.maxAirJumps) {
					thisId.upPressed = true;
				} else {
					thisId.upHeld = true;
					thisId.upPressed = false;
				}
			}
	
			if (dist < dashDist) {
				thisId.tMouseX = room_width - enemyId.x;
				thisId.tMouseY = room_height - enemyId.y;
				thisId.twoPressed = true;
			}
		} else {
			thisId.randoMoveTime--;
			
			if (thisId.randoMoveTime <= 0 || point_distance(x, y, targetX, targetY) <= 1) {
				do {
					targetX = random(room_width);
					targetY = random(room_height);
					var targetEnemyDist = point_distance(targetX, targetY, enemyId.x, enemyId.y);
					var targetThisDist = point_distance(targetX, targetY, thisId.x, thisId.y);
				} until (targetEnemyDist > runDist && targetThisDist < dist);
				
				thisId.randoMoveTime = 1.5 * room_speed;
			} else {
				thisId.direct = sign(targetX - thisId.x);
				
				if (thisId.y - targetY < 0) {
					if (thisId.moveDy == 0 && thisId.currAirJumps < thisId.maxAirJumps) {
						thisId.upPressed = true;
					} else {
						thisId.upHeld = true;
						thisId.upPressed = false;
					}
				}
			}
		}
	}
}