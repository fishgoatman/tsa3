///@desc scrAiMonkGetInput
var enemyId = kpId;
var thisId = mpId;

if (room == rmCharacterSelect) {
	mousePlayerHero = objMonkTP;
	thisId.lockedIn = true;
} else {
	if (instance_exists(enemyId)) {
		var diffX = enemyId.x - thisId.x;
		var diffY = thisId.y - enemyId.y;
		var dist = sqrt(diffX * diffX + diffY * diffY);
		var dev = 0;
		thisId.state = MOVE;
		thisId.direct = sign(diffX);
		attackDists[0] = 30;
		attackDists[1] = 80;
		attackDists[2] = 60;
		
		if (dist < attackDists[thisId.attackCounter]) {
			thisId.onePressed = true;
			thisId.oneReleased = true;
		}
		
		show_debug_message("dist = " + string(dist));
		
		thisId.tMouseX = enemyId.x + random_range(-dev, dev);
		thisId.tMouseY = enemyId.y + random_range(-dev, dev);
		
		if (diffY > 0) {
			if (thisId.moveDy == 0) {
				thisId.twoPressed = true;
			}
			
			thisId.upPressed = true;
		} else {
			thisId.upPressed = false;
		}
	}
}